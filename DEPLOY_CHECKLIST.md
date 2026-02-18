# 🚀 CHECKLIST COMPLETO - PUBLICAÇÃO FS CELULARES

## CONTEXTO
- **Projeto**: Sistema de Cartão Ponto FS Celulares
- **Repositório GitHub**: https://github.com/xxfabioxx12/cartaoponto
- **Branch**: main
- **Supabase Project URL**: Ver em `.env`
- **Domínio**: A definir (Hostinger)
- **Credenciais**: Ver arquivo `.env` (não versionado)

---

## ✅ ETAPA 1: CRIAR TABELAS NO SUPABASE

### O que fazer:
Executar o SQL abaixo no Supabase SQL Editor para criar as tabelas necessárias.

### Passos:
1. Acesse: https://app.supabase.com
2. Clique no projeto: **sistema-ponto**
3. No menu lateral esquerdo: **SQL Editor**
4. Clique em **+ New** (canto superior)
5. Cole o SQL abaixo COMPLETO (todo de uma vez):

```sql
CREATE TABLE IF NOT EXISTS app_state (
  id BIGINT PRIMARY KEY,
  data JSONB NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS funcionarios (
  id BIGINT PRIMARY KEY,
  nome TEXT NOT NULL,
  cargo TEXT,
  turno TEXT,
  carga BIGINT,
  cor TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS registros (
  id BIGINT PRIMARY KEY,
  funcionario_id BIGINT,
  data TEXT,
  tipo TEXT,
  hora TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS turnos (
  id BIGINT PRIMARY KEY,
  nome TEXT NOT NULL,
  entrada TEXT,
  saida_int TEXT,
  volta_int TEXT,
  saida TEXT,
  tolerancia BIGINT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS historico (
  id BIGINT PRIMARY KEY,
  tipo TEXT,
  funcionario_id BIGINT,
  detalhe TEXT,
  timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE app_state ENABLE ROW LEVEL SECURITY;
ALTER TABLE funcionarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE registros ENABLE ROW LEVEL SECURITY;
ALTER TABLE turnos ENABLE ROW LEVEL SECURITY;
ALTER TABLE historico ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Enable all access" ON app_state FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Enable all access" ON funcionarios FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Enable all access" ON registros FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Enable all access" ON turnos FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Enable all access" ON historico FOR ALL USING (true) WITH CHECK (true);
```

6. Clique no botão **"Run"** (verde, canto superior direito)
7. **Aguarde 30-60 segundos** até ver mensagem de sucesso
8. ✅ Confirmar: "Pronto! Tabelas criadas"

---

## ✅ ETAPA 2: CRIAR PROJETO NO VERCEL

### O que fazer:
Conectar o repositório GitHub ao Vercel e fazer o primeiro deploy.

### Passos:
1. Acesse: https://vercel.com
2. Faça login (ou crie conta com GitHub)
3. Clique em **"Add New Project"** (ou "New Project")
4. Clique em **"Import Git Repository"**
5. Procure por: `cartaoponto` (ou `xxfabioxx12/cartaoponto`)
6. Selecione: **xxfabioxx12 / cartaoponto**
7. Clique em **"Import"**
8. **Configurações do Projeto**:
   - Project Name: `fs-celulares-sistema-ponto` (ou `cartaoponto`)
   - Framework: **Other** (é um HTML estático)
   - Root Directory: `./` (deixar padrão)
9. Clique **"Environment Variables"** e adicione as credenciais de `.env`:
   - **VITE_SUPABASE_URL** = (valor de `.env`)
   - **VITE_SUPABASE_ANON_KEY** = (valor de `.env`)
10. Clique **"Deploy"**
11. **Aguarde 2-3 minutos** (verá: "Congratulations! Your project has been successfully deployed")
12. ✅ Confirmar: URL do projeto apareceu (algo como: `https://cartaoponto-xxxx.vercel.app`)
13. **Copie essa URL!** Você vai precisar para o domínio.

---

## ✅ ETAPA 3: APONTAR DOMÍNIO (HOSTINGER)

### O que fazer:
Configurar DNS no Hostinger para apontar para Vercel.

### Informações necessárias:
- **IP do Vercel**: `76.76.19.21` (ou o que Vercel fornecer)
- **URL Vercel gerada**: (copiado da etapa anterior)

### Passos:
1. Acesse: https://www.hostinger.com.br (seu painel)
2. Vá em **Meus Domínios** ou **Gerenciar Domínios**
3. Selecione seu domínio (qual domínio quer usar? Ex: `fscelulares.com`)
4. Clique em **Gerenciar DNS** ou **DNS**
5. **Procure por registros tipo "A"**:
   - Apague registros A existentes
   - Crie novo registro:
     - **Type**: A
     - **Name**: @ (ou deixar em branco)
     - **Content**: `76.76.19.21`
     - **TTL**: 3600
6. **Se tiver registro CNAME para www**:
   - Type: CNAME
   - Name: www
   - Content: `cname.vercel-dns.com`
7. **Clique "Salvar"**
8. Aguarde **15-30 minutos** para DNS propagar
9. ✅ Confirmar: Acesse seu domínio no navegador (ex: `https://fscelulares.com`)

---

## ✅ ETAPA 4: CONFIGURAR DOMÍNIO CUSTOMIZADO NO VERCEL

### O que fazer:
Registrar o domínio personalizado no Vercel.

### Passos:
1. Acesse seu projeto no Vercel: https://vercel.com/dashboard
2. Clique no projeto: **cartaoponto** (ou nome que escolheu)
3. Vá em **Settings** (aba superior)
4. Clique em **Domains** (menu lateral esquerdo)
5. Clique **"Add Domain"**
6. Digite seu domínio (ex: `fscelulares.com`)
7. Clique **"Add"**
8. **Vercel vai mostrar nameservers**:
   - Se usar DNS customizado do Vercel, anote os nameservers
   - Se preferir registros A/CNAME, configure conforme etapa anterior
9. **Aguarde validação** (pode demorar 24-48h, mas geralmente é rápido)
10. ✅ Confirmar: Status muda para "Valid" (verde)

---

## ✅ ETAPA 5: TESTAR E VALIDAR

### O que fazer:
Verificar se tudo está funcionando.

### Testes:
1. **Acesse via domínio**: https://seu-dominio.com (deve carregar a aplicação)
2. **Verifique:**
   - ✅ Página carrega (logo FS Celulares visível)
   - ✅ Relógio funciona (atualiza a cada segundo)
   - ✅ Cards de funcionários aparecem
   - ✅ Botão "Acesso Administrativo" funciona
3. **Teste no console do navegador** (F12):
   - Nenhum erro vermelho relacionado ao Supabase
4. **Se tiver erro de CORS ou chave**: volte para Vercel → Settings → Environment Variables e verifique se estão corretas

---

## 📋 RESUMO DO CHECKLIST

- [ ] Etapa 1: Tabelas criadas no Supabase
- [ ] Etapa 2: Projeto criado no Vercel (URL gerada)
- [ ] Etapa 3: DNS configurado no Hostinger
- [ ] Etapa 4: Domínio adicionado no Vercel
- [ ] Etapa 5: Testes passou (site acessível e funcionando)

---

## 🆘 TROUBLESHOOTING

### "Erro ao conectar ao Supabase"
→ Verificar se as variáveis de ambiente no Vercel estão corretas

### "Domínio não acessa"
→ Aguardar propagação de DNS (pode levar até 48h)
→ Limpar cache do navegador (Ctrl+Shift+Delete)

### "Tabelas não criadas"
→ Voltar ao Supabase SQL Editor
→ Tentar executar cada CREATE TABLE separadamente

---

## 📞 RESUMO DE CREDENCIAIS

```
SUPABASE_URL: https://ebhzsddqmjnxzcecgyrv.supabase.co
SUPABASE_ANON_KEY: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
GITHUB_REPO: https://github.com/xxfabioxx12/cartaoponto
VERCEL_PROJECT: fs-celulares-sistema-ponto
```

---

**Data**: Fevereiro 2026
**Status**: Pronto para executar
