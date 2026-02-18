# FS Celulares — Sistema de Ponto

Sistema de cartão ponto para a FS Celulares com integração Supabase e hospedagem Vercel.

## 🚀 Começar Rápido

### 1. Configurar Supabase (Uma vez só)

Copie todo o conteúdo do arquivo `schema.sql` e cole no **SQL Editor** do Supabase em:
https://app.supabase.com → seu projeto → SQL Editor → Cole e execute

Isso cria automaticamente:
- Tabela de estado da app
- Tabela de funcionários
- Tabela de registros de ponto
- Tabela de turnos
- Tabela de histórico

### 2. Variáveis de Ambiente

O arquivo `.env` já está configurado com as credenciais do Supabase.

**⚠️ AVISO:** Não faça commit do arquivo `.env` - o `.gitignore` já protege isso!

### 3. Rodar Localmente

```bash
npm install
npm run dev
```

Acesse: `http://localhost:3000`

### 4. Deploy

Deploiaremos automaticamente no Vercel conectado ao GitHub.

## 📋 Estrutura

- `index.html` - Aplicação completa (HTML + CSS + JavaScript)
- `.env` - Credenciais Supabase (não versionado)
- `schema.sql` - Scripts para criar tabelas no Supabase
- `package.json` - Dependências

## 🔐 Segurança

- Credenciais do Supabase protegidas no `.env`
- Supabase com Row Level Security (RLS) habilitado
- Backup local em `localStorage` como fallback

---

**Desenvolvido com ❤️ para FS Celulares**
