CREATE DATABASE escola;
USE escola;

CREATE TABLE aluno (
	id_aluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    email VARCHAR(45),
    cpf BIGINT,
    PRIMARY KEY (id_aluno)
);

CREATE TABLE disciplina (
	id_disciplina INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    carga_horaria INT,
    PRImARY KEY (id_disciplina)
);

CREATE TABLE turma (
	id_turma INT NOT NULL AUTO_INCREMENT,
    turno ENUM ("Matutino", "Vespertino", "Noturno"),
    disciplina_id INT,
    FOREIGN KEY (disciplina_id)
    REFERENCES disciplina (id_disciplina),
    PRIMARY KEY (id_turma)
);

CREATE TABLE inscricao (
	id_inscricao INT NOT NULL AUTO_INCREMENT,
    dt_inscricao DATE,
    aluno_id INT,
    turma_id INT,
    FOREIGN KEY (aluno_id)
    REFERENCES aluno (id_aluno),
    FOREIGN KEY (turma_id)
    REFERENCES turma (id_turma),
    PRIMARY KEY (id_inscricao)
);

CREATE TABLE mensalidade (
	id_mensalidade INT NOT NULL AUTO_INCREMENT,
    dt_vencimento DATE,
    valor DECIMAL (8,2),
    status_pagamento ENUM("Fatura Paga", "Em Débito"),
    inscricao_id INT,
    FOREIGN KEY (inscricao_id)
    REFERENCES inscricao (id_inscricao),
     PRIMARY KEY (id_mensalidade)
);

INSERT INTO aluno
(nome, email, cpf)
VALUES
("Eric Mara", "ericmaraoliveira@gmail.com", 06610213941),
("Vito Carlos", "vitoCa@gmail.com", 01210633921),
("Elis Dias", "Elis@gmail.com", 01669433941),
("Eduarda Santos", "dudaS@gmail.com", 766752213211),
("João vitor", "joão@gmail.com", 42617433991);

INSERT INTO disciplina 
(nome, carga_horaria)
VALUES
("Fisica", 15),
("Geografia", 10),
("Ciencia", 20),
("Biologia", 15),
("Historia", 10);

INSERT INTO turma
(turno, disciplina_id)
VALUES 
("Matutino", 1),
("Noturno", 3),
("Noturno", 4),
("Vespertino", 5),
("Matutino", 2);

INSERT INTO inscricao
(dt_inscricao, aluno_id, turma_id)
VALUES
("2024-01-01", 4, 1),
("2024-01-01", 3, 2),
("2024-01-01", 2, 3),
("2024-06-01", 4, 1),
("2024-06-01", 3, 2),
("2024-06-01", 2, 3);

INSERT INTO inscricao
(dt_inscricao)
VALUES
("2024-06-01");

INSERT INTO mensalidade
(dt_vencimento, valor, status_pagamento, inscricao_id)
VALUES
("2024-01-05", 600, "Fatura Paga", 1),
("2024-01-05", 600, "Fatura Paga", 2),
("2024-01-05", 600, "Fatura Paga", 3),
("2024-06-05", 700, "Em Débito", 4),
("2024-06-05", 700, "Em Débito", 5),
("2024-06-05", 700, "Em Débito", 6);


SELECT * FROM mensalidade
JOIN inscricao
ON inscricao.id_inscricao = mensalidade.inscricao_id
WHERE status_pagamento = "Em Débito";

SELECT inscricao.id_inscricao, mensalidade.dt_vencimento, mensalidade.valor FROM mensalidade
JOIN inscricao
ON inscricao.id_inscricao = mensalidade.inscricao_id;

SELECT * FROM inscricao
LEFT JOIN aluno
ON aluno.id_aluno = inscricao.aluno_id;

SELECT * FROM aluno;

SELECT * FROM disciplina;


SELECT * FROM inscricao
RIGHT JOIN turma
ON turma.id_turma = inscricao.turma_id;

SELECT * FROM inscricao
JOIN aluno
JOIN turma
ON inscricao.aluno_id = aluno.id_aluno AND inscricao.turma_id = turma.id_turma;


SELECT * FROM inscricao
LEFT JOIN aluno
ON aluno.id_aluno = inscricao.aluno_id
UNION
SELECT * FROM inscricao
RIGHT JOIN aluno
ON aluno.id_aluno = inscricao.aluno_id;

SELECT inscricao.id_inscricao, aluno.nome, aluno.email FROM inscricao
JOIN aluno
ON aluno.id_aluno = inscricao.aluno_id;

CREATE VIEW vw_inscricao_aluno AS 
SELECT inscricao.id_inscricao, aluno.nome AS nome_aluno, aluno.email AS email_aluno FROM inscricao
JOIN aluno
ON aluno.id_aluno = inscricao.aluno_id;


SELECT * FROM vw_inscricao_aluno;

