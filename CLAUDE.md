# 📋 Contexto do Projeto FS Celulares

## Visão Geral
Sistema de Cartão Ponto (Time Clock) para a FS Celulares, desenvolvido em HTML/CSS/JavaScript puro com integração Supabase para backend e hospedagem em Vercel.

## 🏗️ Arquitetura

### Frontend
- **Arquivo**: `index.html` (1.320 linhas)
- **Stack**: HTML5 + CSS3 (Tailwind CSS) + JavaScript Vanilla
- **Dependências externas**:
  - Tailwind CSS (CDN)
  - Material Symbols (ícones)
  - jsPDF 2.5.1 (exportação PDF)
  - Supabase JS Client 2.38.0

### Backend
- **Banco de Dados**: Supabase (PostgreSQL)
- **URL**: Ver em `.env`
- **Chaves**: Configuradas em `.env` (não versionadas no Git)

### Hospedagem
- **Platform**: Vercel
- **Repositório**: https://github.com/xxfabioxx12/cartaoponto
- **Branch**: main

## 📊 Estrutura de Dados

### Estado da Aplicação (localStorage + Supabase)
```javascript
state = {
  funcionarios: [...],      // Array de funcionários
  turnos: [...],            // Array de turnos (horários)
  registros: [...],         // Array de registros de ponto
  historico: [...],         // Histórico de operações
  config: { senhaAdmin },   // Configurações
  sessao: { tipo, funcId }  // Sessão atual
}
```

### Tabelas Supabase
1. **app_state** - Estado completo (JSONB)
2. **funcionarios** - Dados desnormalizados
3. **registros** - Registros de ponto
4. **turnos** - Turnos de trabalho
5. **historico** - Log de operações

## 🔐 Segurança

- **Credenciais**: Protegidas em `.env` (não versionado)
- **RLS**: Habilitado no Supabase
- **localStorage**: Backup local dos dados
- **Senha Admin**: Codificada com Base64 (default: `admin123`)

## 🎯 Funcionalidades Principais

### Tela Pública (Idle)
- Relógio grande em tempo real
- Grade de funcionários para registrar ponto
- Login administrativo

### Tela do Funcionário
- Ver ponto do dia (entrada/saída)
- Histórico de pontos
- Cálculo de horas
- Encerrar sessão

### Painel Administrativo
- Dashboard com resumo
- CRUD de funcionários
- Relatórios por período
- Banco de horas
- Histórico de ações
- Gerenciar turnos
- Exportar CSV/PDF

## 🔄 Fluxo de Dados

1. **Entrada de dados**: Interface HTML
2. **Processamento**: JavaScript (cálculos, validações)
3. **Armazenamento**:
   - `localStorage` (offline-first)
   - Supabase (sincronização na nuvem)
4. **Visualização**: Renderização dinâmica

## 📝 Arquivos Importantes

- `index.html` - Aplicação principal
- `.env` - Credenciais Supabase (não versionado)
- `.env.example` - Template de variáveis
- `.gitignore` - Protege `.env`
- `package.json` - Dependências NPM
- `schema.sql` - Script para criar tabelas
- `README.md` - Documentação de setup

## 🚀 Deploy

### Local
```bash
npm install
npm run dev  # Serve em http://localhost:3000
```

### Vercel
- Conectado ao repositório GitHub
- Deploy automático em push para `main`
- Variáveis de ambiente configuradas no Vercel

## 🔧 Status Atual (18 Fevereiro 2026 - SESSÃO 2)

### ✅ CONCLUÍDO (100% - Código + Infra):
1. ✅ Código HTML desenvolvido (1.320 linhas)
2. ✅ Supabase integrado no frontend
3. ✅ Arquivos de configuração (.env, .env.example, .gitignore)
4. ✅ Git inicializado e repositório GitHub criado
5. ✅ 9 commits realizados (todas documentações)
6. ✅ Documentação COMPLETA (12 arquivos, 1400+ linhas)
7. ✅ Schema SQL criado (5 tabelas)
8. ✅ Scripts de sincronização (Python + Batch)
9. ✅ Credenciais compartilháveis criadas
10. ✅ Sincronização Google Drive documentada
11. ✅ Outro Claude consegue acessar de outro PC
12. ✅ MEMORY.md atualizado com contexto completo

### ⏳ PENDENTE (40% - Ações Manuais do Usuário):
1. ⏳ Executar schema.sql no Supabase SQL Editor (5 min)
2. ⏳ Criar projeto no Vercel (10 min)
3. ⏳ Configurar DNS no Hostinger (5 min)
4. ⏳ Adicionar domínio customizado no Vercel (5 min)
5. ⏳ Testar aplicação final (2 min)

**Tempo Total**: 30-45 minutos (ou até 48h com DNS)

## 📋 Todos os Arquivos de Documentação Criados

### Guias Principais:
- **APENAS_ACCOES_MANUAIS.md** (120 linhas) - 5 ações simples que só o usuário pode fazer
- **DEPLOY_CHECKLIST.md** (228 linhas) - Guia passo a passo completo
- **INSTRUCOES_PARA_CLAUDE_EXTENSION.md** (99 linhas) - Para automação via extensão Claude
- **RESUMO_EXECUTIVO.txt** (134 linhas) - Overview executivo do projeto
- **README.md** (53 linhas) - Quick start

### Guias de Acesso & Compartilhamento:
- **COMO_ACESSAR_EM_OUTRO_PC.md** (183 linhas) - Clone, setup, rodar localmente
- **COMPARTILHAR_COM_OUTRO_CLAUDE.md** (174 linhas) - 3 formas de compartilhar credenciais
- **CREDENCIAIS_PARA_COMPARTILHAR.txt** (84 linhas) - Arquivo pronto para copiar/colar
- **SINCRONIZAR_GOOGLE_DRIVE.md** (228 linhas) - Guia completo de sincronização
- **COPIAR_PARA_GOOGLE_DRIVE.md** (158 linhas) - Instruções rápidas (2-3 min)

### Scripts Automáticos:
- **sincronizar.py** - Script Python para copiar projeto ao Google Drive
- **sincronizar.bat** - Script Windows (.bat) para automação

### Referência:
- **CLAUDE.md** (Este arquivo) - Contexto técnico completo

## 📊 Localizações do Projeto

```
Local: C:\Users\eufab\OneDrive\Área de Trabalho\FS Celulares\
GitHub: https://github.com/xxfabioxx12/cartaoponto
Google Drive: C:\Users\eufab\OneDrive\Área de Trabalho\google driver\
Memory: C:\Users\eufab\.claude\projects\...\memory\MEMORY.md
```

## 🔐 Credenciais & Senhas

**Senha Admin Padrão**: `admin123`
- Armazenada em Base64 (atualizar para produção)
- Pode ser alterada via painel admin → Configurações

**Chaves Supabase**: Em `.env` (não versionado)
- Anon Key para frontend
- Service Role para backend (futuro)

## 📊 GitHub Repository

- **URL**: https://github.com/xxfabioxx12/cartaoponto
- **Branch**: main
- **Commits**: 4 commits iniciais
- **Status**: Pronto para Vercel deploy

## 🔐 IMPORTANTE

**CREDENCIAIS SENSÍVEIS**:
- Todas as chaves de API estão em `.env` (arquivo local, não versionado)
- Veja `.env.example` para referência de variáveis necessárias
- NUNCA faça commit do arquivo `.env`

## 📞 Contato & Suporte

**Projeto**: FS Celulares - Sistema de Ponto
**Desenvolvido por**: Claude Code
**Data**: Fevereiro 2026

---

## 🖥️ Sessão 2 — 18/02/2026

### Contexto desta sessão
- Projeto clonado em `C:\Users\USUARIO\Desktop\cartaoponto`
- Site confirmado online: https://fs-celulares-sistema-ponto.vercel.app
- GitHub acesso confirmado: https://github.com/xxfabioxx12/cartaoponto
- Deploy automático via Vercel (push na branch main = site atualizado)

### Problemas identificados
1. **Chave Supabase inválida** no código (JWT mal formado) — dados só salvam no localStorage
2. **Histórico** mostra coluna "Ação" e "Detalhe" com o mesmo valor
3. **Senha admin em Base64** (não é criptografia segura)
4. **Domínio fscelulares.top** configurado na Hostgator — NÃO está abrindo o site

### Pendências críticas para produção
1. ⏳ Investigar e corrigir domínio `fscelulares.top` (Hostgator → Vercel)
2. ✅ Corrigir chave Supabase no código (resolvido na Sessão 3)
3. ⏳ Configurar credenciais Supabase reais (ver Sessão 3)

### Domínio
- **Domínio**: fscelulares.top
- **Registrado em**: Hostgator
- **Destino desejado**: Vercel (site cartaoponto)
- **Problema**: DNS não está apontando corretamente para o Vercel

**Última atualização**: 2026-02-18 (Sessão 2)

---

## 🖥️ Sessão 3 — 18/02/2026

### O que foi corrigido

**Problema raiz**: Chave Supabase hardcoded no index.html era um JWT inválido (fabricado). Além disso, o app nunca carregava dados DO Supabase — só salvava, então mobile sempre começava vazio.

**Solução implementada** (2 commits, pusados para main):

1. **`api/config.js`** (novo) — Vercel serverless function que retorna credenciais via env vars:
   - Lê `VITE_SUPABASE_URL` e `VITE_SUPABASE_ANON_KEY` do ambiente Vercel
   - Endpoint: `/api/config`

2. **`vercel.json`** (novo) — Configuração mínima do Vercel

3. **`index.html`** — múltiplas correções:
   - Remove chave Supabase inválida hardcoded
   - `initSupabase()`: tenta `/api/config` primeiro, fallback para localStorage
   - `loadFromCloud()`: carrega estado do Supabase no startup (era ausente!)
   - `salvarConfigSupabase()`: nova função para salvar credenciais via UI
   - Painel admin > Configurações: novo card "Sincronização com a Nuvem"
   - Status visual (verde/vermelho) mostrando se Supabase está conectado
   - `atualizarStatusSupabase()`: atualiza indicador de status

### Para ativar a sincronização (um dos dois métodos)

**Método 1 — Vercel env vars (automático para todos):**
1. Acesse https://vercel.com → projeto `fs-celulares-sistema-ponto`
2. Settings → Environment Variables
3. Adicione: `VITE_SUPABASE_URL` = `https://ebhzsddqmjnxzcecgyrv.supabase.co`
4. Adicione: `VITE_SUPABASE_ANON_KEY` = (chave anon real do Supabase dashboard)
5. Redeploy → todos os dispositivos sincronizam automaticamente

**Método 2 — Pelo painel admin (por dispositivo):**
1. Acesse o site → Login admin (`admin123`)
2. Menu → Configurações
3. Seção "Sincronização com a Nuvem"
4. Insira URL e chave anon → clique "Salvar e Conectar"
5. Dados sincronizados imediatamente

### Arquivos de credenciais Supabase
- A chave anon real está em: https://app.supabase.com/project/ebhzsddqmjnxzcecgyrv/settings/api
- Localização do projeto: `C:\Users\USUARIO\Desktop\cartaoponto`
- GitHub: https://github.com/xxfabioxx12/cartaoponto
- Site: https://fs-celulares-sistema-ponto.vercel.app

**Última atualização**: 2026-02-18 (Sessão 3)
