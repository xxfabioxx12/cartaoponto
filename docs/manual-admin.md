# Manual do Administrador

Guia completo para gerenciar o sistema de ponto da FS Celulares.

## Acesso ao Painel

1. Na tela inicial (relógio), clique em **Acesso Administrativo**
2. Digite a senha (padrão: `admin123`)
3. Clique **Entrar**

> **Segurança**: Após 3 tentativas erradas, o login é bloqueado por 30 segundos. A sessão expira automaticamente após 15 minutos de inatividade.

## Dashboard

Visão geral do dia atual:

- **Total Equipe** — quantidade de funcionários cadastrados
- **Presentes** — funcionários que bateram entrada hoje
- **Em Intervalo** — funcionários no horário de intervalo
- **Ausentes** — funcionários que ainda não bateram ponto

### Gráfico Semanal

Mostra a quantidade de registros de ponto dos últimos 7 dias em formato de barras.

### Alertas

O dashboard exibe alertas quando há funcionários ausentes ou com registros incompletos.

## Funcionários

### Cadastrar

1. Clique no botão **+ Novo Funcionário**
2. Preencha: nome, cargo, turno
3. Clique **Salvar**

A carga horária é calculada automaticamente pelo turno selecionado.

### Editar

Clique no ícone de edição (lápis) ao lado do funcionário. Altere os campos desejados e salve.

### Excluir

Clique no ícone de exclusão (lixeira). Confirme a exclusão no diálogo.

> **Atenção**: Excluir um funcionário não remove seus registros de ponto anteriores.

## Relatórios

### Filtros

- **Mês/Ano** — selecione o período desejado
- **Funcionário** — filtre por um funcionário específico ou veja todos

### Colunas do relatório

| Coluna | Descrição |
|--------|-----------|
| Funcionário | Nome do funcionário |
| Data | Data do registro |
| Entrada | Horário de entrada |
| Saída Int. | Saída para intervalo |
| Volta Int. | Volta do intervalo |
| Saída | Horário de saída |
| Total | Horas trabalhadas no dia |
| Extra | Horas extras (positivo) ou falta (negativo) |

### Exportar

- **CSV** — planilha compatível com Excel/Google Sheets
- **PDF** — documento formatado para impressão

Os botões de exportação ficam no topo da página de relatórios.

## Relatório de Atrasos

Mostra atrasos na entrada de cada funcionário, considerando a tolerância do turno.

### Como funciona

1. O sistema compara o horário de entrada registrado com o horário de entrada do turno
2. Subtrai a tolerância configurada (ex: 5 minutos)
3. Se o funcionário chegou após o horário + tolerância, conta como atraso

### Colunas

- **Funcionário** — nome
- **Total de Atrasos** — quantidade de dias com atraso no período
- **Tempo Total** — soma de todos os minutos de atraso
- **Detalhe** — lista de datas e minutos de cada atraso

## Banco de Horas

Exibe o saldo acumulado de horas extras e horas em falta de cada funcionário.

- **Crédito** (verde) — horas trabalhadas além da carga diária
- **Débito** (vermelho) — horas trabalhadas abaixo da carga diária
- **Saldo** — diferença entre crédito e débito

O cálculo é baseado nos registros de ponto versus a carga horária do turno.

## Histórico

Log completo de todas as operações realizadas no sistema:

- Registros de ponto (entrada, saída, intervalos)
- Cadastro/edição/exclusão de funcionários
- Alterações de configuração
- Edições de ponto

### Limpar histórico

O botão **Limpar Histórico** remove todos os registros do log. Use com cautela — esta ação não pode ser desfeita.

## Turnos

### Cadastrar turno

1. Preencha o formulário:
   - **Nome** — ex: "Manhã", "Tarde", "Integral"
   - **Entrada** — horário de início
   - **Saída Intervalo** — início do intervalo
   - **Volta Intervalo** — fim do intervalo
   - **Saída** — horário de fim
   - **Tolerância** — minutos de tolerância para atrasos
2. Clique **Salvar Turno**

A carga horária é calculada automaticamente (tempo trabalhado excluindo intervalo).

### Editar / Excluir

Use os botões ao lado de cada turno na tabela.

> **Atenção**: Se excluir um turno que está vinculado a funcionários, esses funcionários ficarão sem turno definido.

## Configurações

### Alterar senha admin

1. Vá em **Alterar Senha** no menu lateral
2. Digite a nova senha
3. Confirme a nova senha
4. Clique **Alterar Senha**

A senha é armazenada com hash SHA-256 — não é possível recuperá-la, apenas redefinir.

### Sincronização com a Nuvem

Se o Supabase não estiver configurado via variáveis de ambiente (Vercel), você pode configurar manualmente:

1. Na seção **Sincronização com a Nuvem**, insira:
   - **URL do Supabase** — ex: `https://xxx.supabase.co`
   - **Chave Anon** — chave pública do projeto
2. Clique **Salvar e Conectar**

O status de conexão é exibido:
- **Verde** ("Conectado") — dados sincronizados entre dispositivos
- **Vermelho** ("Não conectado") — dados apenas no dispositivo atual

### Indicador no header

No topo do painel, o badge mostra:
- **Cloud** (verde) — sincronizando com Supabase
- **Local** (amarelo) — dados apenas locais

## Editar Registro de Ponto

Para corrigir um horário registrado incorretamente:

1. Vá em **Relatórios**
2. Na linha do registro, clique no ícone de edição
3. No modal, ajuste os horários desejados
4. Clique **Salvar**

> A edição fica registrada no **Histórico** para fins de auditoria.
