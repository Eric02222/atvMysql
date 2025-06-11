USE aula_03_25;
USE banco_brasil;
USE concessionaria;

SELECT * FROM aluno;

SELECT * FROM cliente;
SELECT * FROM mensalidade;

SELECT * FROM estacionamento;

INSERT INTO aluno (nome, matricula, data_nascimento)
VALUES
('Carlos', 203681, '2001-01-16'),
('Vitor', 043265, '2000-12-26'),
('João', 103841, '2004-08-02');

INSERT INTO cliente (nome)
VALUES
('Carlos'),
('Vitor'),
('João');

INSERT INTO mensalidade (valor, status_pagamento, cliente_id)
VALUES
(300, 'Em Débito', 4),
(2000.5, 'Fatura Paga', 6),
(613, 'Em Débito', 5);
