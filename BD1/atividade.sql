CREATE DATABASE IF NOT EXISTS licao;
USE licao;

CREATE TABLE usuario (
    idUsuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(45),
    PRIMARY KEY(idUsuario)
);

-- INSERINDO DADOS DA TABELA
INSERT INTO usuario (idUsuario,nome, email, senha) VALUES (1,"Alexandre", "alexandre@email.com", "12345");
INSERT INTO usuario (idUsuario,nome, email, senha) VALUES (2,"Natanael", "natanael12@email.com", "ABCDE");
INSERT INTO usuario (idUsuario,nome, email, senha) VALUES (3,"Julia", "julia_09@email.com", "98765");
INSERT INTO usuario (idUsuario,nome, email, senha) VALUES (4,"Fernanda", "fernanda@gmail.com", "EFGHI");

SELECT * FROM usuario;

-- ATUALIZANDO A SENHA DO ALEXANDRE

UPDATE usuario SET senha ='54321' where idUsuario = 1;
SELECT * FROM usuario;

-- DELETANDO O USUARIO FERNANDA 

DELETE FROM usuario WHERE idUsuario = 4;
SELECT * FROM usuario;

-- BUSCA DE DADOS COM TODOS OS USUARIOS 

SELECT * FROM usuario;

-- BUSCA DE DADOS COM USUARIO QUE CONTEM N NO NOME

SELECT * FROM usuario WHERE nome like '%N%';
