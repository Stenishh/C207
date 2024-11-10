DROP DATABASE IF EXISTS lista5;
CREATE DATABASE lista5;

USE lista5;

CREATE TABLE aluno (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT,
    curso VARCHAR(50),
    email VARCHAR(100)
);

DELIMITER $$

DROP FUNCTION IF EXISTS email $$

CREATE FUNCTION email(a VARCHAR(20), b VARCHAR(3)) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN CONCAT(a, "@", b, ".inatel.br");
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS inserirAlunos $$

CREATE PROCEDURE inserirAlunos(IN nome VARCHAR(50), IN idade INT, IN curso VARCHAR(50)) 
BEGIN
    INSERT INTO aluno(nome, idade, curso, email) VALUES (nome, idade, curso, email(nome, curso));
END $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER atualizarIdadeMaisVelho AFTER INSERT ON aluno FOR EACH ROW
BEGIN
    DECLARE maxIdade INT;
    SELECT MAX(idade) INTO maxIdade FROM aluno;

    UPDATE aluno
    SET idade = 20
    WHERE idade = maxIdade;
END $$

DELIMITER ;

CREATE VIEW alunos_maiores_18 AS SELECT * FROM aluno WHERE idade > 18;
SELECT * FROM alunos_maiores_18;
