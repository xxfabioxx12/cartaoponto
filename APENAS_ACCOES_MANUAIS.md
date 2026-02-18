# ⚡ APENAS AÇÕES MANUAIS (O que você precisa fazer)

## Tudo que EU não consigo fazer automaticamente:

---

## 1️⃣ CRIAR TABELAS NO SUPABASE (5 min)

**Por quê não consigo**: Supabase não expõe API de SQL arbitrário

**O que fazer**:
1. Acesse: https://app.supabase.com → sistema-ponto
2. Menu: **SQL Editor** → **New Query**
3. Cole o arquivo `schema.sql` COMPLETO
4. Clique botão **"Run"** (verde)
5. Aguarde sucesso

**Copie e cole isto no SQL Editor:**
```sql
CREATE TABLE IF NOT EXISTS app_state (id BIGINT PRIMARY KEY, data JSONB NOT NULL, updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS funcionarios (id BIGINT PRIMARY KEY, nome TEXT NOT NULL, cargo TEXT, turno TEXT, carga BIGINT, cor TEXT, created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS registros (id BIGINT PRIMARY KEY, funcionario_id BIGINT, data TEXT, tipo TEXT, hora TEXT, created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS turnos (id BIGINT PRIMARY KEY, nome TEXT NOT NULL, entrada TEXT, saida_int TEXT, volta_int TEXT, saida TEXT, tolerancia BIGINT, created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS historico (id BIGINT PRIMARY KEY, tipo TEXT, funcionario_id BIGINT, detalhe TEXT, timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);
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

---

## 2️⃣ CRIAR PROJETO NO VERCEL (10 min)

**Por quê não consigo**: Vercel requer autenticação OAuth

**O que fazer**:
1. Acesse: https://vercel.com
2. Clique **"Add New Project"**
3. Clique **"Import Git Repository"**
4. Selecione: **xxfabioxx12/cartaoponto**
5. Preencha:
   - Project Name: `fs-celulares-sistema-ponto`
   - Framework: **Other**
6. Clique **"Environment Variables"**
7. Adicione (valores estão em `.env`):
   ```
   VITE_SUPABASE_URL = (seu valor do .env)
   VITE_SUPABASE_ANON_KEY = (seu valor do .env)
   ```
8. Clique **"Deploy"**
9. **Aguarde 2-3 minutos** até ver "Congratulations!"
10. **Copie a URL gerada** (algo como `https://cartaoponto-xxx.vercel.app`)

---

## 3️⃣ CONFIGURAR DNS NO HOSTINGER (5 min)

**Por quê não consigo**: Hostinger requer acesso à conta

**O que fazer**:
1. Acesse seu painel Hostinger
2. Vá em **Meus Domínios** → **Gerenciar DNS**
3. Selecione seu domínio (qual domínio? ex: fscelulares.com)
4. **Crie/Edite registros**:
   - **Type**: A | **Name**: @ | **Content**: `76.76.19.21`
   - **Type**: CNAME | **Name**: www | **Content**: `cname.vercel-dns.com`
5. Clique **"Salvar"**
6. **Aguarde 15-30 minutos** (propagação de DNS)

---

## 4️⃣ ADICIONAR DOMÍNIO NO VERCEL (5 min)

**Por quê não consigo**: Vercel requer autenticação

**O que fazer**:
1. Acesse seu projeto no Vercel (da etapa 2)
2. Vá em **Settings** → **Domains** (menu lateral)
3. Clique **"Add Domain"**
4. Digite seu domínio (ex: `fscelulares.com`)
5. Clique **"Add"**
6. **Aguarde validação** (DNS precisa estar propagado)
7. Quando ficar verde = **pronto!**

---

## 5️⃣ TESTAR (2 min)

**O que fazer**:
1. Acesse: `https://seu-dominio.com`
2. Verifique:
   - ✓ Página carrega
   - ✓ Logo "FS Celulares" visível
   - ✓ Relógio funciona (atualiza a cada segundo)
   - ✓ Cards de funcionários aparecem
   - ✓ Sem erros vermelhos no console (F12)

---

## 📋 CHECKLIST RÁPIDO

- [ ] Etapa 1: Tabelas criadas no Supabase (Run SQL)
- [ ] Etapa 2: Projeto criado no Vercel (Deploy)
- [ ] Etapa 3: DNS configurado no Hostinger (Aguardar propagação)
- [ ] Etapa 4: Domínio adicionado no Vercel (Status: Valid)
- [ ] Etapa 5: Testes passaram (Site acessível)

---

**⏱️ Tempo total estimado: 30-45 minutos**
(Considerando DNS propagado, pode ser até 24-48h)

**Status: TUDO PRONTO!** 🚀
