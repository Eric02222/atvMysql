CREATE DATABASE loja;
USE loja;

CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    cidade VARCHAR (45),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE acompanhamento (
	id_acompanhamento INT NOT NULL AUTO_INCREMENT,
    situacao VARCHAR (45),
    PRIMARY KEY (id_acompanhamento)
);

CREATE TABLE pedido (
	id_pedido INT NOT NULL AUTO_INCREMENT,
    data_pedido DATE,
    preco DECIMAL (8,2),
    cliente_id INT,
    acompanhamento_id INT,
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id_cliente),
    FOREIGN KEY (acompanhamento_id)
    REFERENCES acompanhamento (id_acompanhamento),
    PRIMARY KEY (id_pedido)
);

INSERT INTO cliente
(nome, cidade)
VALUES
('João', 'Macaé'),
('Carlos', 'Salvador'),
('Maria', 'Niteroí'),
('Ana', 'Campinas'),
('Marcos', 'Santos');

INSERT INTO acompanhamento
(situacao)
VALUES
('Registrado'),
('Em transporte'),
('Entregue');

INSERT INTO pedido
(data_pedido, preco, cliente_id, acompanhamento_id)
VALUES
('2024-09-24', 250, 2, 1),
('2024-09-25', 150, 1, 2),
('2024-09-25', 450, 4, 3);

-- Junta duas tabelas na consulta
SELECT * FROM pedido 
JOIN cliente
ON cliente.id_cliente = pedido.cliente_id;

-- mostrar todas as informações das tabelas 
SELECT * FROM pedido 
JOIN cliente
ON cliente.id_cliente = pedido.cliente_id
JOIN acompanhamento
ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;

-- Informações das tableas filtradas 
SELECT pedido.id_pedido, pedido.data_pedido, cliente.nome, acompanhamento.situacao FROM pedido 
JOIN cliente
ON cliente.id_cliente = pedido.cliente_id
JOIN acompanhamento
ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;

-- Criar atalho de comando select
CREATE VIEW vw_consulta_pedido_situacao AS  
SELECT pedido.id_pedido, pedido.data_pedido, cliente.nome, acompanhamento.situacao FROM pedido 
JOIN cliente
ON cliente.id_cliente = pedido.cliente_id
JOIN acompanhamento
ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;

SELECT * FROM vw_consulta_pedido_situacao;


