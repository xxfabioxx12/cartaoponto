# Arquitetura Técnica

## Visão Geral

O sistema é uma SPA (Single Page Application) composta por um único arquivo HTML (`index.html`, ~2100 linhas) que contém HTML, CSS e JavaScript. Não há build step — o arquivo é servido diretamente pelo Vercel como site estático.

```
Usuário → index.html (Tailwind + JS Vanilla)
                ↓
         localStorage (offline-first)
                ↓
         Supabase (sincronização na nuvem)
```

### Três telas principais

1. **Tela Pública** (`#tela-publica`) — relógio + grade de funcionários para bater ponto
2. **Tela do Funcionário** (`#tela-funcionario`) — registrar ponto + ver registros do dia
3. **Painel Admin** (`#painel-admin`) — dashboard, CRUD, relatórios, configurações

A navegação entre telas é controlada por `mostrarTela(qual)`, que alterna classes CSS (`.ativa`).

## Modelo de Dados

### Objeto `state` (fonte da verdade)

```javascript
state = {
  funcionarios: [{
    id: Number,         // ID incremental
    nome: String,       // Nome completo
    cargo: String,      // Ex: "Vendedor", "Caixa"
    turno: String,      // Nome do turno (referência por nome, não por ID)
    carga: Number,      // Carga horária diária em horas
    cor: String         // Classes Tailwind para avatar (ex: "bg-primary/20 text-primary")
  }],
  turnos: [{
    id: Number,
    nome: String,       // Ex: "Manhã", "Tarde", "Integral"
    entrada: String,    // "HH:MM" — horário de entrada
    saida_int: String,  // "HH:MM" — saída para intervalo
    volta_int: String,  // "HH:MM" — volta do intervalo
    saida: String,      // "HH:MM" — horário de saída
    tolerancia: Number  // Minutos de tolerância para atraso
  }],
  registros: [{
    id: Number,
    funcId: Number,     // ID do funcionário
    data: String,       // "YYYY-MM-DD"
    tipo: String,       // "entrada" | "saida_intervalo" | "volta_intervalo" | "saida"
    hora: String        // "HH:MM"
  }],
  historico: [{
    tipo: String,       // Tipo da operação
    funcId: Number,     // ID do funcionário relacionado
    detalhe: String,    // Descrição da operação
    timestamp: String   // Data/hora completa
  }],
  config: {
    senhaAdmin: String  // Hash SHA-256 da senha (ou Base64 em dados antigos)
  },
  sessao: {
    tipo: String|null,  // null | "funcionario" | "admin"
    funcId: Number|null // ID do funcionário logado (ou null)
  },
  nextFuncId: Number,   // Próximo ID para funcionário
  nextTurnoId: Number   // Próximo ID para turno
}
```

### Relação turno ↔ funcionário

O vínculo é feito pelo **nome** do turno (`funcionario.turno === turno.nome`), não pelo ID. A função `getFuncTurno(func)` resolve essa referência.

## Tabelas Supabase

Definidas em `schema.sql`:

| Tabela | Campos | Uso |
|--------|--------|-----|
| `app_state` | `id (PK), data (JSONB), updated_at, created_at` | Estado completo — única tabela realmente usada pelo app |
| `funcionarios` | `id, nome, cargo, turno, carga, cor, timestamps` | Desnormalizada (não usada ativamente) |
| `registros` | `id, funcionario_id, data, tipo, hora, timestamps` | Desnormalizada (não usada ativamente) |
| `turnos` | `id, nome, entrada, saida_int, volta_int, saida, tolerancia, timestamps` | Desnormalizada (não usada ativamente) |
| `historico` | `id, tipo, funcionario_id, detalhe, timestamp, created_at` | Desnormalizada (não usada ativamente) |

> **Nota**: O app usa apenas `app_state` para sincronização. As demais tabelas existem para consultas diretas futuras.

Todas as tabelas têm RLS habilitado com policy permissiva (acesso via anon key).

## Fluxo de Persistência

### Salvamento (`saveState`)
```
Ação do usuário
  → saveState()
    → localStorage.setItem('fs_ponto_v2', JSON.stringify(state))
    → supabase.from('app_state').upsert({ id: 1, data: state })
      → Se falha: _syncPending = true
```

### Carregamento (startup)
```
Página carrega
  → loadState() ← localStorage
  → initSupabase() ← /api/config ou localStorage
  → loadFromCloud() ← supabase.from('app_state')
    → Merge: registros da nuvem são adicionados aos locais (sem duplicatas)
    → Se nuvem tem mais registros → usa dados da nuvem
```

### Retry automático
`retrySyncToCloud()` roda periodicamente (via `setInterval`) para reenviar dados quando `_syncPending === true`.

## Segurança

### Senha admin
- Hash SHA-256 com salt fixo (`fs_celulares_2026`)
- Migração automática: detecta hash Base64 antigo via `isBase64Hash()` e re-hash no próximo login
- Comparação: `hashSenha(input) === state.config.senhaAdmin`

### Rate limiting (login)
- Máximo 3 tentativas consecutivas
- Bloqueio de 30 segundos após exceder
- Contador resetado após login bem-sucedido

### XSS
- Função `escapeHtml(str)` aplicada em todas as renderizações de dados dinâmicos
- Sanitiza `&`, `<`, `>`, `"`, `'`

### Timeout de sessão
- Sessão admin expira após 15 minutos de inatividade
- `resetAdminTimer()` chamado em interações do usuário
- Redireciona para tela pública ao expirar

## Dependências Externas (CDN)

| Biblioteca | Versão | Uso |
|-----------|--------|-----|
| Tailwind CSS | Latest (CDN) | Estilização |
| Material Symbols | Latest | Ícones |
| jsPDF | 2.5.1 | Exportação PDF |
| Supabase JS | 2.38.0 | Cliente do banco de dados |
| Inter (Google Fonts) | Latest | Tipografia |

## API Serverless

### `GET /api/config`

Retorna credenciais Supabase configuradas nas variáveis de ambiente do Vercel.

```javascript
// api/config.js
export default function handler(req, res) {
  res.setHeader('Cache-Control', 'no-store');
  res.json({
    supabaseUrl: process.env.VITE_SUPABASE_URL || '',
    supabaseKey: process.env.VITE_SUPABASE_ANON_KEY || '',
  });
}
```

Sem autenticação — as chaves anon do Supabase são públicas por design (protegidas por RLS).

## Convenções de Código

- Horários sempre como string `"HH:MM"`
- Datas sempre como string `"YYYY-MM-DD"`
- IDs são números inteiros incrementais
- Seções do código marcadas com `// ============================================================`
- Funções `render*()` atualizam o DOM completo da respectiva seção
- Estado global em `window.state` (variável `state`)
- Sem módulos ES — tudo no escopo global do `<script>`
