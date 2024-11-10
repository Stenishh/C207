CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8;
USE mydb;

CREATE TABLE IF NOT EXISTS Agente (
  idAgente INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  endereco VARCHAR(45) NULL,
  nascimento DATE NULL,
  habilidade VARCHAR(45) NULL,
  sexo VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  PRIMARY KEY (idAgente)
);

CREATE TABLE IF NOT EXISTS vilao (
  idvilao INT NOT NULL,
  nome VARCHAR(45) NULL,
  num_crime INT NULL,
  PRIMARY KEY (idvilao)
);

CREATE TABLE IF NOT EXISTS missao (
  idmissao INT NOT NULL,
  data DATE NULL,
  nome VARCHAR(45) NULL,
  local VARCHAR(45) NULL,
  duracao INT NULL,
  vilao_idvilao INT NOT NULL,
  PRIMARY KEY (idmissao),
  INDEX fk_missao_vilao1_idx (vilao_idvilao ASC),
  CONSTRAINT fk_missao_vilao1
    FOREIGN KEY (vilao_idvilao)
    REFERENCES mydb.vilao (idvilao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS mydb.Agente_has_missao (
  Agente_idAgente INT NOT NULL,
  missao_idmissao INT NOT NULL,
  PRIMARY KEY (Agente_idAgente, missao_idmissao),
  INDEX fk_Agente_has_missao_missao1_idx (missao_idmissao ASC),
  INDEX fk_Agente_has_missao_Agente_idx (Agente_idAgente ASC),
  CONSTRAINT fk_Agente_has_missao_Agente
    FOREIGN KEY (Agente_idAgente)
    REFERENCES mydb.Agente (idAgente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Agente_has_missao_missao1
    FOREIGN KEY (missao_idmissao)
    REFERENCES mydb.missao (idmissao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
-- Crie um usuário
CREATE USER 'Billy Butcher' IDENTIFIED BY 'senha';

-- Conceda todas as permissões para o banco de dados e todas as tabelas
GRANT ALL PRIVILEGES ON mydb.* TO 'Billy Butcher';

-- Atualize as permissões
FLUSH PRIVILEGES;



-- Deletar a coluna 'email' da tabela 'Agente'
ALTER TABLE Agente DROP COLUMN email;

-- Inserir dados na tabela Agente
INSERT INTO Agente (idAgente, nome, endereco, nascimento, habilidade, sexo)
VALUES
(1, 'Bento', 'ruas do limoes', '1990-01-01', 'tiro ao alvo', 'Masculino'),
(2, 'Salmonela', 'moradora de rua', '1995-02-15', 'chute no saco', 'Feminino'),
(3, 'Sarneia', 'casa dos piramines', '1988-07-20', 'suco gastrico', 'Masculino');

-- Inserir dados na tabela vilao
INSERT INTO vilao (idvilao, nome, num_crime)
VALUES
(1, 'leptospirose', 10),
(2, 'peixe cru', 5),
(3, 'sarnento', 8);



-- Inserir dados na tabela missao
INSERT INTO missao (idmissao, date, nome, local, duracao, vilao_idvilao)
VALUES
(1, '2023-01-10', 'caca rato', 'inatel', 3, 1),
(2, '2023-02-20', 'sushi', 'casa do alexandre', 5, 2),
(3, '2023-03-30', 'pipoquete', 'bahia', 2, 3);

-- Inserir dados na tabela Agente_has_missao
INSERT INTO Agente_has_missao (Agente_idAgente, missao_idmissao)
VALUES
(1, 1),
(2, 2),
(3, 3);

--  select que retorne o nome da missão e nome do vilão:
SELECT m.nome AS NomeMissao, v.nome AS NomeVilao FROM missao m JOIN vilao v ON m.vilao_idvilao = v.idvilao;

-- select que retorne o nome do agente e nome de suas missões:
SELECT a.nome AS NomeAgente, m.nome AS NomeMissao FROM Agente a JOIN Agente_has_missao am ON a.idAgente = am.Agente_idAgente JOIN missao m ON am.missao_idmissao = m.idmissao;

-- Revogar a permissão DELETE no banco de dados e em todas as tabelas
REVOKE DELETE ON mydb.* FROM 'Billy Butcher';

-- Atualizar as permissões
FLUSH PRIVILEGES;




