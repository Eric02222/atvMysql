CREATE DATABASE concessionaria;
USE concessionaria;

CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    dt_nascimento DATE,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE categoria (
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    descricao TEXT,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE veiculo (
	id_veiculo INT NOT NULL AUTO_INCREMENT,
    placa VARCHAR (10),
    cor VARCHAR (45),
    cliente_id INT,
    categoria_id INT,
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id_cliente),
    FOREIGN KEY (categoria_id)
    REFERENCES categoria (id_categoria),
    PRIMARY KEY (id_veiculo)
);

CREATE TABLE estacionamento (
	id_estacionamento INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    capacidade INT,
    dt_entrada DATE,
    dt_saida DATE,
    hs_entrada TIME, 
    hs_saida TIME,
    veiculo_id INT,
    FOREIGN KEY (veiculo_id)
    REFERENCES veiculo (id_veiculo),
    PRIMARY KEY (id_estacionamento)
);

INSERT INTO cliente 
(nome, dt_nascimento)
VALUES
('Carlos', '2001-05-16'),
('Elis', '2003-07-11'),
('Victor', '1993-11-02');

INSERT INTO categoria
(nome, descricao)
VALUES
('Utilitarios', 'Carros robustos e espaçosos, com motores potentes e capacidade de transportar cargas e passageiros.'),
('Van', 'Veículo comercial leve, que pode ser usado para transportar passageiros ou cargas pequenas.'),
('Pick-Up', 'Automóvel com uma cabine e uma caçamba traseira, ideal para transportar cargas.');

INSERT INTO veiculo
(placa, cor, cliente_id, categoria_id)
VALUES 
('AAA-2020', 'Preto', 1, 2),
('BBB-1111', 'Branco', 1, 3),
('CCCC-5050', 'Azul', 2, 3),
('DDD-1234', 'Branco', 1, 2);

INSERT INTO veiculo
(placa, cor)
VALUES 
('RRR-2525', 'Azul');

INSERT INTO estacionamento 
(nome, capacidade, dt_entrada, dt_saida, hs_entrada,hs_saida, veiculo_id)
VALUES
('Estacionamento A', 50, '2025-05-21', '2025-05-21', '11:30:45', '17:26:20', 5),
('Estacionamento B', 30, '2025-08-13', '2025-08-16', '7:20:15', '8:49:42', 2),
('Estacionamento C', 65, '2025-11-02', '2025-12-15', '13:12:14', '19:46:35', 4);

SELECT * FROM veiculo
JOIN categoria
JOIN cliente
ON veiculo.categoria_id = categoria.id_categoria;

SELECT * FROM veiculo 
LEFT JOIN cliente
ON veiculo.cliente_id = cliente.id_cliente;
 
SELECT * FROM veiculo
RIGHT JOIN categoria 
ON veiculo.categoria_id = categoria.id_categoria;
 
SELECT * FROM veiculo 
LEFT JOIN cliente
ON veiculo.cliente_id = cliente.id_cliente
UNION
SELECT * FROM veiculo 
RIGHT JOIN cliente
ON veiculo.cliente_id = cliente.id_cliente;
 
SELECT veiculo.id_veiculo, veiculo.placa, veiculo.cor, cliente.nome FROM veiculo 
JOIN cliente
ON veiculo.cliente_id = cliente.id_cliente;

CREATE VIEW vw_veiculo_cliente AS 
SELECT veiculo.id_veiculo, veiculo.placa, veiculo.cor, cliente.nome FROM veiculo 
JOIN cliente
ON veiculo.cliente_id = cliente.id_cliente;

SELECT * FROM vw_veiculo_cliente;
