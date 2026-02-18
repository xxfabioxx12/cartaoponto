# 💻 COMO ACESSAR O PROJETO EM OUTRO PC

## 🎯 Resumo Rápido

Para trabalhar no projeto em outro PC:

```bash
# 1. Clonar o repositório
git clone https://github.com/xxfabioxx12/cartaoponto.git
cd cartaoponto

# 2. Criar arquivo .env com suas credenciais
# (copiar do seu PC original ou gerar novo)

# 3. Abrir index.html no navegador
# (ou rodar um servidor local)
```

---

## ✅ PASSO A PASSO DETALHADO

### **PASSO 1: Clonar o Repositório**

Abra o terminal/PowerShell e execute:

```bash
git clone https://github.com/xxfabioxx12/cartaoponto.git
cd cartaoponto
```

Pronto! Você tem todo o código no seu PC.

---

### **PASSO 2: Configurar Variáveis de Ambiente**

#### Opção A: Copiar do PC Original (RECOMENDADO)

1. No PC original, copie o arquivo `.env` inteiro
2. Cole no seu novo PC (mesma pasta do projeto)
3. Pronto! Mesmas credenciais Supabase

#### Opção B: Criar novo `.env`

1. Crie um arquivo chamado `.env` na raiz do projeto
2. Adicione as credenciais:

```
VITE_SUPABASE_URL=https://ebhzsddqmjnxzcecgyrv.supabase.co
VITE_SUPABASE_ANON_KEY=(copie do .env original)
VITE_SUPABASE_SERVICE_ROLE=(copie do .env original)
```

⚠️ **IMPORTANTE**: Nunca faça push do `.env` para GitHub (ele está no `.gitignore`)

---

### **PASSO 3: Abrir o Projeto**

#### Opção A: Abrir direto no navegador (Mais rápido)

1. Navegue até a pasta do projeto
2. Clique 2x no arquivo `index.html`
3. Abre no navegador
4. Pronto! Sistema rodando

#### Opção B: Rodar em servidor local (Melhor para testar)

```bash
# Se tiver Python
python -m http.server 3000

# Ou com Node.js
npm install -g http-server
http-server -p 3000
```

Depois acesse: `http://localhost:3000`

---

### **PASSO 4: Fazer Alterações**

```bash
# Editar arquivos conforme necessário
# (usar seu editor: VSCode, Sublime, etc)

# Quando terminar, salvar e testar no navegador
# (F5 para recarregar a página)
```

---

### **PASSO 5: Fazer Push das Mudanças (Opcional)**

Se fez alterações e quer salvar no GitHub:

```bash
# Ver o que mudou
git status

# Adicionar arquivos (NÃO adicione .env!)
git add index.html  # ou outros arquivos modificados

# Fazer commit
git commit -m "Descrição das mudanças"

# Enviar para GitHub
git push origin main
```

---

## 📋 CHECKLIST DE CONFIGURAÇÃO

- [ ] Repositório clonado: `git clone https://github.com/xxfabioxx12/cartaoponto.git`
- [ ] Arquivo `.env` criado com credenciais
- [ ] `index.html` abre no navegador sem erros
- [ ] Relógio funciona (atualiza a cada segundo)
- [ ] Cards de funcionários aparecem
- [ ] Painel admin acessível com senha: `admin123`

---

## 🔐 CREDENCIAIS SENSÍVEIS

⚠️ **NUNCA compartilhe ou faça commit:**
- `.env` (arquivo inteiro)
- Chaves Supabase
- Senhas de admin

✅ **SEMPRE protegido por `.gitignore`**

---

## 🆘 PROBLEMAS COMUNS

### "Permission denied" ao clonar

**Solução**: Instale Git (https://git-scm.com) e configure:

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
```

### "index.html não encontrado"

**Solução**: Verifique se está na pasta correta:

```bash
ls  # ou dir (Windows)
# Deve mostrar: index.html, .env, README.md, etc
```

### Erro de CORS ou Supabase

**Solução**: Verifique se o `.env` está correto com as credenciais certas

### "http-server não encontrado"

**Solução**: Instale:

```bash
npm install -g http-server
```

---

## 📞 RESUMO

| Ação | Comando |
|------|---------|
| Clonar repo | `git clone https://github.com/xxfabioxx12/cartaoponto.git` |
| Entrar na pasta | `cd cartaoponto` |
| Ver status | `git status` |
| Salvar mudanças | `git add . && git commit -m "msg" && git push` |
| Rodar em servidor | `python -m http.server 3000` |

---

**Pronto! Você consegue acessar e trabalhar no projeto de qualquer PC!** 🎉
