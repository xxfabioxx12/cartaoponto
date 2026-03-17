# FS Celulares — Sistema de Ponto

Sistema de ponto eletrônico para a loja FS Celulares. Controle de presença, banco de horas, relatórios e exportação — tudo em uma aplicação web responsiva.

**Demo**: [fs-celulares-sistema-ponto.vercel.app](https://fs-celulares-sistema-ponto.vercel.app)
**Senha admin**: `admin123`

## Funcionalidades

### Tela Pública
- Relógio em tempo real
- Grade de funcionários — toque no nome para registrar ponto
- Acesso ao painel administrativo

### Tela do Funcionário
- Registrar entrada, saída intervalo, volta intervalo e saída
- Visualizar registros do dia com total de horas
- Informações do turno atual

### Painel Administrativo
- **Dashboard** — KPIs (presentes, ausentes, intervalo) + gráfico semanal de registros
- **Funcionários** — cadastro completo com turno e cargo
- **Relatórios** — filtro por mês/ano/funcionário, com horas trabalhadas e extras
- **Atrasos** — relatório de atrasos por funcionário com tolerância configurável
- **Banco de Horas** — saldo acumulado (crédito/débito) por funcionário
- **Histórico** — log completo de todas as operações do sistema
- **Turnos** — cadastro com horários de entrada/saída/intervalo e tolerância
- **Configurações** — alterar senha admin, configurar sincronização Supabase
- **Exportação** — CSV e PDF dos relatórios
- **Edição de Ponto** — ajuste de horários com registro em auditoria

## Stack

| Camada | Tecnologia |
|--------|-----------|
| Frontend | HTML5 + Tailwind CSS (CDN) + JavaScript Vanilla |
| Backend | Supabase (PostgreSQL) |
| Hospedagem | Vercel (static site + serverless function) |
| Dependências | jsPDF 2.5.1, Supabase JS 2.38.0, Material Symbols |

## Desenvolvimento Local

```bash
git clone https://github.com/xxfabioxx12/cartaoponto.git
cd cartaoponto
npm install
npm run dev
```

Acesse `http://localhost:3000`. Os dados são salvos no localStorage (funciona sem Supabase).

Para configuração completa com Supabase e deploy, veja [docs/deploy.md](docs/deploy.md).

## Estrutura

```
├── index.html           # Aplicação completa (HTML + CSS + JS)
├── api/config.js        # Serverless function (credenciais Supabase)
├── schema.sql           # DDL das tabelas Supabase
├── create-tables.html   # Interface para criar tabelas
├── package.json         # Metadados e scripts
├── vercel.json          # Configuração Vercel
├── .env.example         # Template de variáveis de ambiente
└── docs/
    ├── deploy.md        # Guia de deploy e configuração
    ├── arquitetura.md   # Referência técnica
    └── manual-admin.md  # Manual do administrador
```

## Segurança

- Senha admin com SHA-256 + salt (migrada de Base64)
- Proteção XSS via `escapeHtml()` em todas as renderizações
- Rate limiting no login (3 tentativas → bloqueio de 30s)
- Timeout automático da sessão admin (15 min inatividade)
- Row Level Security (RLS) habilitado no Supabase
- Credenciais Supabase via variáveis de ambiente (nunca no código)

## Licença

MIT
