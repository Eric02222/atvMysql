CREATE DATABASE aula_03_25;
USE aula_03_25;

CREATE TABLE aluno(
	id_aluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    matricula INT,
    data_nascimento DATE,
    PRImARY KEY (id_aluno)
);

INSERT INTO aluno 
(nome, matricula, data_nascimento)
VALUES
('Vito', 12345, '1999-03-10'),
('Marcus', 23456, '2001-06-23'),
('Elis', 78912, '2003-08-18');

SELECT * FROM aluno

UPDATE aluno
SET matricula = 65498
WHERE id_aluno = 1;

DELETE FROM aluno 
WHERE id_aluno = 2;