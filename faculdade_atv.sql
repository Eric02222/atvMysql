CREATE DATABASE faculdade;
USE faculdade;

CREATE TABLE aluno (
	id_aluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    PRIMARY KEY (id_aluno)
);

CREATE TABLE curso (
	id_curso INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    duracao INT,
    PRIMARY KEY (id_curso)
);

CREATE TABLE inscricao (
	id_inscricao INT NOT NULL AUTO_INCREMENT,
    dt_inscricao DATE,
    aluno_id INT,
    curso_id INT,
    PRIMARY KEY (id_inscricao)
);

CREATE TABLE mensalidade (
	id_mensalidade INT NOT NULL AUTO_INCREMENT,
    dt_vencimento DATE,
    valor DECIMAL(8,2),
    status_pagamento ENUM('Pago', 'Não Pago'),
    inscricao_id INT,
    PRImARY KEY (id_mensalidade)
);


INSERT INTO aluno
(nome)
VALUES
('Elis'),
('Carlos'),
('Paula'),
('Marcos'),
('Eduardo');

INSERT INTO curso
(nome, duracao)
VALUES
('Medicina', 5),
('Desing', 4),
('Filosofia', 4),
('Desenvolvimento de Sistemas', 2),
('Adiministração', 4);

INSERT INTO inscricao 
(dt_inscricao, aluno_id, curso_id)
VALUES
('2020-01-02', 4, 4),
('2020-01-02', 3, 3),
('2020-01-02', 2, 2),
('2020-06-02', 4, 4),
('2020-06-02', 3, 3),
('2020-06-02', 2, 2);

INSERT INTO inscricao 
(dt_inscricao)
VALUES
('2020-06-02');

INSERT INTO mensalidade
(dt_vencimento, valor, status_pagamento, inscricao_id)
VALUES
('2020-01-10', 550, 'Pago', 1),
('2020-01-10', 540, 'Pago', 2),	
('2020-01-10', 530, 'Pago', 3),
('2020-06-10', 580, 'Não Pago', 4),
('2020-06-10', 570, 'Não Pago', 5),
('2020-06-10', 560, 'Não Pago', 6);

SELECT aluno.nome, sum(mensalidade.valor) AS valor_das_mensalidades FROM mensalidade
JOIN aluno
JOIN inscricao
ON aluno.id_aluno = inscricao.aluno_id
ON inscricao.id_inscricao = mensalidade.inscricao_id
GROUP BY aluno.nome;

SELECT sum(mensalidade.valor), mensalidade.status_pagamento FROM mensalidade
WHERE mensalidade.status_pagamento = 'Não Pago';

SELECT aluno.nome, avg(mensalidade.valor) AS valor_medio_das_mensalidades FROM mensalidade
JOIN aluno
JOIN inscricao
ON aluno.id_aluno = inscricao.aluno_id
ON inscricao.id_inscricao = mensalidade.inscricao_id
GROUP BY aluno.nome;

SELECT max(mensalidade.valor) AS Valor_Maximo_Da_Mensalidade FROM mensalidade;

SELECT min(mensalidade.valor) AS Valor_Minimo_Da_Mensalidade FROM mensalidade;

SELECT min(mensalidade.valor) AS Valor_Minimo_Da_Mensalidade, mensalidade.status_pagamento FROM mensalidade
WHERE mensalidade.status_pagamento = 'Não Pago';

SELECT DiSTINCT aluno.nome FROM aluno;

SELECT aluno.nome FROM aluno
GROUP BY aluno.nome;

SELECT SUM(mensalidade.valor) AS Valor_Da_Mensalidade, mensalidade.dt_vencimento FROM mensalidade
WHERE mensalidade.dt_vencimento < '2020-06-10'
GROUP BY mensalidade.dt_vencimento;

SELECT SUM(mensalidade.valor) AS Valor_Da_Mensalidade, mensalidade.dt_vencimento FROM mensalidade
WHERE mensalidade.dt_vencimento > '2020-06-09'
GROUP BY mensalidade.dt_vencimento;

SELECT sum(mensalidade.valor) AS Valor_Da_Mensalidade FROM mensalidade
WHERE mensalidade.id_mensalidade >= 2 AND mensalidade.id_mensalidade <= 5;


