# 🤖 INSTRUÇÕES PARA CLAUDE EXTENSION

## RESUMO
Publicar o Sistema de Cartão Ponto FS Celulares no ar.
- ✅ Código pronto no GitHub
- ✅ Supabase configurado
- ⏳ Faltam: Criar tabelas, Vercel, Domínio

---

## ARQUIVOS QUE VOCÊ VAI PRECISAR

1. **DEPLOY_CHECKLIST.md** - Guia completo com todos os passos
2. **schema.sql** - Script SQL para criar tabelas
3. **CLAUDE.md** - Contexto do projeto
4. **index.html** - Aplicação principal (já modificada com Supabase)
5. **.env** - Credenciais (não fazer commit!)

---

## FLUXO RÁPIDO

### 1️⃣ SUPABASE: Criar Tabelas
**Arquivo**: `schema.sql`
**Ação**: Executar SQL no Supabase SQL Editor
**Status**: Pendente (requer ação manual no navegador)

### 2️⃣ VERCEL: Conectar Repositório
**GitHub**: https://github.com/xxfabioxx12/cartaoponto
**Framework**: Other (HTML estático)
**Variáveis de Ambiente**: (copiar de `.env`)
**Status**: Manual (requer Vercel MCP ou ação no site)

### 3️⃣ HOSTINGER: Configurar DNS
**Domínio**: ? (A DEFINIR)
**IP Vercel**: 76.76.19.21
**Status**: Manual (requer ação no Hostinger)

### 4️⃣ VERCEL: Adicionar Domínio Customizado
**URL Vercel gerada**: (copiada do deploy)
**Domínio**: (mesmo do Hostinger)
**Status**: Manual

### 5️⃣ TESTAR
**URL**: https://seu-dominio.com
**Verificar**: Logo, relógio, cards de funcionários

---

## ⚡ COMMANDOS POSSÍVEIS

Se você tiver MCP do Vercel configurado, pode:
```bash
vercel project create --name fs-celulares-sistema-ponto
vercel env add VITE_SUPABASE_URL https://ebhzsddqmjnxzcecgyrv.supabase.co
vercel deploy --prod
```

Se tiver acesso a APIs:
```
POST /api/projects (Vercel API)
POST /v1/projects (Hostinger API)
```

---

## 📋 CHECKLIST FINAL

**Feito pela Claude (Claude Code)**:
- ✅ Arquivos criados (.env, .gitignore, schema.sql, etc)
- ✅ Código HTML integrado com Supabase
- ✅ Git inicializado
- ✅ Repositório GitHub criado e push feito
- ✅ Documentação completa (CLAUDE.md, README.md, DEPLOY_CHECKLIST.md)

**Falta fazer** (Manual ou via MCP):
- ⏳ Executar schema.sql no Supabase
- ⏳ Criar projeto no Vercel
- ⏳ Configurar DNS no Hostinger
- ⏳ Adicionar domínio no Vercel
- ⏳ Testar acesso final

---

## 🔑 CREDENCIAIS PRINCIPAIS

```
GitHub Repo: https://github.com/xxfabioxx12/cartaoponto
Supabase Project: https://app.supabase.com (sistema-ponto)
Vercel: https://vercel.com/dashboard

Todas as credenciais sensíveis estão em .env (arquivo local)
```

⚠️ **NUNCA fazer commit de `.env` ou publicar credenciais no GitHub!**

---

**Pronto!** 🚀 Você pode passar esse repositório e essas instruções para qualquer Claude Extension e ela consegue continuar.
