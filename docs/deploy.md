# Guia de Deploy e Configuração

## Pré-requisitos

- Conta no [GitHub](https://github.com)
- Conta no [Vercel](https://vercel.com)
- Conta no [Supabase](https://supabase.com)

## 1. Banco de Dados (Supabase)

1. Crie um projeto no [Supabase Dashboard](https://app.supabase.com)
2. Vá em **SQL Editor**
3. Cole o conteúdo do arquivo `schema.sql` e execute
4. Isso cria 5 tabelas com RLS habilitado:
   - `app_state` — estado completo da aplicação (JSONB)
   - `funcionarios` — dados dos funcionários
   - `registros` — registros de ponto
   - `turnos` — turnos de trabalho
   - `historico` — log de operações

> **Alternativa**: Abra `create-tables.html` no navegador para criar as tabelas via interface gráfica.

### Obter credenciais

Em **Settings → API** do seu projeto Supabase, copie:
- **Project URL** → será `VITE_SUPABASE_URL`
- **anon public key** → será `VITE_SUPABASE_ANON_KEY`

## 2. Deploy no Vercel

1. Importe o repositório GitHub no [Vercel](https://vercel.com/new)
2. Framework Preset: **Other**
3. Build Command: deixe vazio (site estático)
4. Output Directory: deixe como `.` (raiz)
5. Adicione as variáveis de ambiente:

| Variável | Valor |
|----------|-------|
| `VITE_SUPABASE_URL` | `https://seu-projeto.supabase.co` |
| `VITE_SUPABASE_ANON_KEY` | `eyJ...` (anon key do Supabase) |

6. Clique em **Deploy**

O deploy automático está configurado: cada push na branch `main` atualiza o site.

## 3. Domínio Customizado (opcional)

1. No Vercel, vá em **Settings → Domains**
2. Adicione seu domínio (ex: `ponto.fscelulares.com`)
3. Configure os registros DNS no seu provedor:
   - **CNAME**: `ponto` → `cname.vercel-dns.com`
   - Ou **A record**: `76.76.21.21`
4. Aguarde propagação DNS (até 48h, geralmente minutos)

## 4. Desenvolvimento Local

```bash
git clone https://github.com/xxfabioxx12/cartaoponto.git
cd cartaoponto
npm install
npm run dev
```

O servidor inicia em `http://localhost:3000`.

### Com Supabase local

Crie um arquivo `.env` na raiz baseado no `.env.example`:

```
VITE_SUPABASE_URL=https://seu-projeto.supabase.co
VITE_SUPABASE_ANON_KEY=sua-anon-key
```

> **Nota**: Localmente, o endpoint `/api/config` não existe (é uma serverless function do Vercel). O app funciona sem Supabase usando apenas localStorage.

### Configurar Supabase pelo painel admin

Método alternativo que não requer variáveis de ambiente:

1. Acesse o site → faça login como admin (`admin123`)
2. Menu lateral → **Alterar Senha** (Configurações)
3. Na seção **Sincronização com a Nuvem**, insira URL e chave
4. Clique **Salvar e Conectar**

As credenciais ficam salvas no localStorage daquele dispositivo.

## Troubleshooting

### Site não conecta ao Supabase
- Verifique se as variáveis de ambiente estão configuradas no Vercel
- Faça um redeploy após adicionar as variáveis
- Verifique no console do navegador (F12) se há erros de conexão

### Dados não aparecem em outro dispositivo
- Confirme que o Supabase está conectado (badge "Cloud" verde no header do admin)
- Os dados são sincronizados via tabela `app_state` — ambos dispositivos devem estar conectados ao mesmo projeto Supabase

### Schema SQL falha
- Certifique-se de executar no **SQL Editor** do Supabase (não em um client SQL externo)
- Se as tabelas já existem, o `CREATE TABLE IF NOT EXISTS` não causa erro
- Verifique se as policies de RLS foram criadas corretamente
