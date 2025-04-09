CREATE DATABASE banco_brasil;
USE banco_brasil;

CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE mensalidade (
	id_mensalidade INT NOT NULL AUTO_INCREMENT,
    valor DECIMAL (8,2),
    status_pagamento VARCHAR (45),
    cliente_id INT,
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id_cliente),
    PRIMARY KEY (id_mensalidade)
);

INSERT INTO cliente
(nome)
VALUES
('Jose'),
('Carlos'),
('Marcos');

INSERT INTO mensalidade 
(valor, status_pagamento, cliente_id)
VALUES
(650, 'Fatura Paga', 1),
(670, 'Fatura Paga', 2),
(690, 'Fatura Paga', 3),
(720, 'Em Débito', 1),
(740, 'Em Débito', 2),
(760, 'Em Débito', 3),
(800, 'Em Débito', 3);

-- count mostra a quantidade de um certo dado
SELECT count(mensalidade.status_pagamento) FROM mensalidade;

-- agrupa todos os nomes repetidos com o group by, e mostra a quantidade de mensalidade de cada pessoa com o count
SELECT cliente.nome, count(mensalidade.status_pagamento) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.nome;

-- utiliza o sum para somar o valor de cada mensalidade dos clientes
SELECT cliente.nome, sum(mensalidade.valor), count(mensalidade.status_pagamento) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.nome;

-- utiliza o avg para adiquirir o valor medio da mensalidade dos clientes
SELECT cliente.nome, avg(mensalidade.valor), count(mensalidade.status_pagamento) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.nome;

-- Utilizar o AS para alterar o nome na tabelo de consulta
SELECT cliente.nome, avg(mensalidade.valor) AS Media_Da_Mensalidade, count(mensalidade.status_pagamento) FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.nome;


-- Utilizar o max para mostrar os valoras mais altos
SELECT cliente.nome, max(mensalidade.valor) AS Maior_Valor_Da_Mensalidade FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.nome;

-- Utilizar o max para mostrar os valoras mais altos
SELECT cliente.nome, min(mensalidade.valor) AS Valor_Mais_Barato_Da_Mensalidade FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id
GROUP BY cliente.nome;

-- DISTINCT comando com a mesma função do GROUP BY (Agrupar valores duplicados)
SELECT DISTINCT cliente.nome FROM mensalidade
JOIN cliente
ON cliente.id_cliente = mensalidade.cliente_id




