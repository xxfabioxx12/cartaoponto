# Contexto Técnico — FS Celulares (Cartão Ponto)

## Stack
- Frontend: HTML5 + CSS3 (Tailwind CSS via CDN) + JavaScript Vanilla
- Backend: Supabase (PostgreSQL) via JS client
- Hospedagem: Vercel (static + serverless function)
- Arquivo principal: `index.html` (~2100 linhas — HTML + CSS + JS em arquivo único)

## Estrutura do Projeto

| Arquivo | Descrição |
|---------|-----------|
| `index.html` | Aplicação completa (HTML + CSS + JS) |
| `api/config.js` | Serverless function — retorna credenciais Supabase via env vars |
| `schema.sql` | DDL das 5 tabelas Supabase (com RLS) |
| ~~`create-tables.html`~~ | Removido (credenciais expostas) |
| `vercel.json` | Configuração Vercel |
| `package.json` | Metadados e scripts (`npm run dev` → python HTTP server) |
| `.env.example` | Template de variáveis de ambiente |
| `docs/` | Documentação (deploy, arquitetura, manual admin) |

## Estado da Aplicação

```javascript
state = {
  funcionarios: [{ id, nome, cargo, turno, carga, cor }],
  turnos: [{ id, nome, entrada, saida_int, volta_int, saida, tolerancia }],
  registros: [{ id, funcId, data, tipo, hora }],  // tipo: entrada|saida_intervalo|volta_intervalo|saida
  historico: [{ tipo, funcId, detalhe, timestamp }],
  config: { senhaAdmin },  // SHA-256 com salt
  sessao: { tipo, funcId },  // tipo: null|'funcionario'|'admin'
  nextFuncId, nextTurnoId
}
```

## Tabelas Supabase

| Tabela | Uso |
|--------|-----|
| `app_state` | Estado completo como JSONB (source of truth) |
| `funcionarios` | Dados desnormalizados para consultas |
| `registros` | Registros de ponto |
| `turnos` | Turnos de trabalho |
| `historico` | Log de operações |

RLS habilitado em todas as tabelas.

## Funções Críticas (index.html)

| Função | Responsabilidade |
|--------|-----------------|
| `initSupabase()` | Tenta `/api/config`, fallback para localStorage |
| `loadFromCloud()` | Carrega estado do Supabase no startup, merge com local |
| `saveState()` | Persiste em localStorage + Supabase (com retry) |
| `registrarPontoFunc(tipo)` | Registra ponto com validação de duplicata |
| `hashSenha(senha)` | SHA-256 com salt `fs_celulares_2026` |
| `calcHorasDia(funcId, data)` | Calcula total de horas trabalhadas |
| `calcHorasExtra(funcId, data)` | Calcula horas extras baseado na carga do turno |
| `calcAtrasoEntrada(funcId, data)` | Calcula atraso considerando tolerância |
| `renderDashboard()` | Dashboard com KPIs + gráfico semanal |
| `renderRelatorio()` | Relatório de ponto com filtros e export CSV/PDF |
| `renderRelatorioAtrasos()` | Relatório de atrasos por funcionário/mês |
| `renderBancoHoras()` | Banco de horas com saldo acumulado |
| `exportarCSV()` / `exportarPDF()` | Exportação de relatórios |

## Seções do index.html (marcadas com `// ====`)

1. Segurança (SHA-256, escapeHtml)
2. Estado e Persistência (Supabase init, loadState, saveState)
3. Utilitários (datas, cálculos de horas)
4. Relógio (updateClock)
5. Navegação Admin (showPage)
6. Dashboard, Funcionários, Relatórios, Atrasos, Banco de Horas
7. Histórico, Configurações, Turnos
8. Exportação (CSV/PDF)
9. Toast, Sidebar, Admin Timer
10. Sessões (tela pública, funcionário, admin)
11. Registro de Ponto, Edição de Ponto

## Variáveis de Ambiente

```
VITE_SUPABASE_URL=https://xxx.supabase.co
VITE_SUPABASE_ANON_KEY=eyJ...
```

Configuradas no Vercel (Settings → Environment Variables). O endpoint `api/config.js` as expõe para o frontend.

## URLs

- **Produção**: https://fs-celulares-sistema-ponto.vercel.app
- **GitHub**: https://github.com/xxfabioxx12/cartaoponto
- **Supabase**: https://app.supabase.com/project/ebhzsddqmjnxzcecgyrv

## Convenções

- Push na `main` = deploy automático no Vercel
- localStorage key: `fs_ponto_v2`
- Senha admin padrão: `admin123` (hash SHA-256 com salt em produção)
- IDs são incrementais (`nextFuncId`, `nextTurnoId`)
- Todos os horários em formato `HH:MM` (string)
- Datas em formato `YYYY-MM-DD` (string)

## Problemas Conhecidos (baixa prioridade)

Os itens abaixo foram identificados em auditoria mas não foram corrigidos por exigirem mudança arquitetural significativa:

| Problema | Motivo de não corrigir agora |
|----------|------------------------------|
| Turno noturno (midnight crossing) | Requer redesenho de `diffMin()` |
| Split do `index.html` em módulos | Refatoração grande, baixo risco |
| Supabase Auth (autenticação server-side) | Mudança arquitetural |
| SRI hashes nos CDNs | Depende de build step |
| Acessibilidade (ARIA, keyboard nav) | Sprint dedicado |
| RLS policies restritivas | Requer Supabase Auth primeiro |
| Rate limiting server-side | Requer edge function |
| PBKDF2/bcrypt para senha | Requer server-side |
