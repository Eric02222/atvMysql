CREATE DATABASE banco;
USE banco;

CREATE TABLE tipo_conta(
	id_tipo_conta INT NOT NULL AUTO_INCREMENT,
    des_tipo_conta VARCHAR(100),
    PRIMARY KEY (id_tipo_conta)
);

CREATE TABLE categoria_cliente(
	id_categoria_cliente INT NOT NULL AUTO_INCREMENT,
    nom_categoria_cliente VARCHAR(100),
    PRIMARY KEY (id_categoria_cliente)
);

CREATE TABLE agencia(
	id_agencia INT NOT NULL AUTO_INCREMENT,
    nom_agencia VARCHAR(100),
    PRIMARY KEY (id_agencia)
);

CREATE TABLE cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    nom_cliente VARCHAR(100),
    num_cpf_cnpj VARCHAR(20),
    num_celular VARCHAR(20),
    num_endereco VARCHAR(300),
    categoria_cliente_id INT,
	PRIMARY KEY(id_cliente),
    FOREIGN KEY (categoria_cliente_id)
    REFERENCES categoria_cliente (id_categoria_cliente)
);

CREATE TABLE conta(
	id_conta INT NOT NULL AUTO_INCREMENT,
    val_saldo DECIMAL(8.2),
    tipo_conta_id INT,
    cliente_id INT,
    agencia_id INT,
    PRIMARY KEY (id_conta),
    FOREIGN KEY (tipo_conta_id)
    REFERENCES tipo_conta (id_tipo_conta),
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (id_cliente),
    FOREIGN KEY (agencia_id)
    REFERENCES agencia (id_agencia)
);

INSERT INTO tipo_conta
(des_tipo_conta)
VALUES
('Poupança'),
('Corrente');

SELECT * FROM tipo_conta;

INSERT INTO categoria_cliente
(nom_categoria_cliente)
VALUES
('Private'),
('Exclusive'),
('Gold'),
('Básico');

SELECT * FROM categoria_cliente;

INSERT INTO agencia 
(nom_agencia)
VALUES
('Campeche'),
('Ingleses'),
('Centro');

SELECT * FROM agencia;

INSERT INTO cliente
(nom_cliente, num_cpf_cnpj, num_celular, num_endereco, categoria_cliente_id)
VALUES
('Eric', '000.111.222-41', '48 911223344', 'Rod Carlos Alberto', 1),
('vito', '000.333.666-65', '48 919512344', 'Rod Marcus Alberto', 2),
('Bianca', '000.141.262-41', '48 911983344', 'Rod Vetor ', 4),
('Elis', '000.131.122-41', '48 911223344', 'Rod Bulares', 1),
('Henrique', '000.114.212-48', '48 911223304', 'Rod São João', 3),
('Juan', '000.151.522-71', '48 911207344', 'Rod Alberto', 2),
('Fabio', '100.171.452-21', '48 911223344', 'Rod Coruja', 3),
('Ruy', '060.125.422-11', '48 911845544', 'Rod Rio Claro', 4);

SELECT * FROM cliente;

INSERT INTO conta
(val_saldo, tipo_conta_id, cliente_id, agencia_id)
VALUES
(62000, 1, 1, 2),
(2, 2, 2, 3),
(5, 2, 3, 1),
(1000, 1, 4, 1),	
(5600, 2, 5, 3),
(12, 1, 6, 2),
(69, 1, 7, 2),
(3000, 1, 8, 3);

SELECT * FROM conta;

UPDATE categoria_cliente
SET nom_categoria_cliente = 'Personalite'
WHERE id_categoria_cliente = 1;

UPDATE cliente
SET categoria_cliente_id = 3
WHERE id_cliente = 3;

UPDATE cliente
SET categoria_cliente_id = 3
WHERE id_cliente = 6;

UPDATE cliente
SET categoria_cliente_id = 1
WHERE id_cliente = 2;

DELETE FROM categoria_cliente
WHERE id_categoria_cliente = 2;

DELETE FROM conta 
WHERE id_conta = 1;

DELETE FROM cliente 
WHERE id_cliente = 1;

UPDATE tipo_conta
SET des_tipo_conta = 'Poupança Digital'
WHERE id_tipo_conta = 1;

UPDATE conta 
SET agencia_id = 2
WHERE id_conta = 3;

UPDATE conta 
SET agencia_id = 3
WHERE id_conta = 4;

DELETE FROM agencia
WHERE id_agencia = 1;


