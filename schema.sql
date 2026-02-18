-- Tabela para armazenar o estado completo da aplicação
CREATE TABLE IF NOT EXISTS app_state (
  id BIGINT PRIMARY KEY,
  data JSONB NOT NULL,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de funcionários (desnormalizada para consultas mais rápidas)
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

-- Tabela de registros de ponto
CREATE TABLE IF NOT EXISTS registros (
  id BIGINT PRIMARY KEY,
  funcionario_id BIGINT,
  data TEXT,
  tipo TEXT,
  hora TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de turnos
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

-- Tabela de histórico de operações
CREATE TABLE IF NOT EXISTS historico (
  id BIGINT PRIMARY KEY,
  tipo TEXT,
  funcionario_id BIGINT,
  detalhe TEXT,
  timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Enable Row Level Security (RLS)
ALTER TABLE app_state ENABLE ROW LEVEL SECURITY;
ALTER TABLE funcionarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE registros ENABLE ROW LEVEL SECURITY;
ALTER TABLE turnos ENABLE ROW LEVEL SECURITY;
ALTER TABLE historico ENABLE ROW LEVEL SECURITY;

-- Policies (permitir acesso anônimo com a anon key por enquanto)
CREATE POLICY "Enable all access for authenticated users" ON app_state
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "Enable all access for authenticated users" ON funcionarios
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "Enable all access for authenticated users" ON registros
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "Enable all access for authenticated users" ON turnos
  FOR ALL USING (true) WITH CHECK (true);

CREATE POLICY "Enable all access for authenticated users" ON historico
  FOR ALL USING (true) WITH CHECK (true);
