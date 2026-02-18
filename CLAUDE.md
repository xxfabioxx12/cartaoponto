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

## 🔧 Status Atual (18 Fevereiro 2026)

### ✅ CONCLUÍDO (60%):
1. ✅ Código HTML desenvolvido (1.320 linhas)
2. ✅ Supabase integrado no frontend
3. ✅ Arquivos de configuração (.env, .env.example, .gitignore)
4. ✅ Git inicializado e primeiro commit
5. ✅ Repositório GitHub criado e push feito
6. ✅ Documentação completa (6 arquivos, 765 linhas)
7. ✅ Schema SQL criado (5 tabelas)

### ⏳ PENDENTE (40% - Ações Manuais):
1. ⏳ Executar schema.sql no Supabase SQL Editor
2. ⏳ Criar projeto no Vercel
3. ⏳ Configurar DNS no Hostinger
4. ⏳ Adicionar domínio customizado no Vercel
5. ⏳ Testar aplicação final

## 📋 Arquivos Criados Durante Publicação

- **APENAS_ACCOES_MANUAIS.md** - Ações que o usuário precisa fazer (120 linhas)
- **DEPLOY_CHECKLIST.md** - Guia passo a passo detalhado (228 linhas)
- **INSTRUCOES_PARA_CLAUDE_EXTENSION.md** - Para automação (99 linhas)
- **RESUMO_EXECUTIVO.txt** - Overview executivo (134 linhas)
- **README.md** - Setup rápido (53 linhas)
- **schema.sql** - Script de banco de dados

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

**Última atualização**: 2026-02-18
