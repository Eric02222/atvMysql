CREATE DATABASE posto_gasolina;
USE posto_gasolina;

CREATE TABLE produto (
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    valor DECIMAL(8.2) DEFAULT (6.50),
    estoque INT,
    CHECK (estoque >= 0),
    PRIMARY KEY (id_produto)
);

CREATE TABLE pedido (
	id_pedido INT NOT NULL AUTO_INCREMENT,
    data_horario DATETIME,
    quantidade DECIMAL(8.2),
    produto_id INT,
    FOREIGN KEY (produto_id)
    REFERENCES produto (id_produto),
    PRIMARY KEY (id_pedido)
);

DELIMITER $$
CREATE TRIGGER atualizacao_estoque
AFTER INSERT ON pedido
FOR EACH ROW 
BEGIN 
	UPDATE produto
	SET produto.estoque = produto.estoque - new.quantidade
	WHERE produto.id_produto = new.produto_id;
END;
$$

INSERT INTO produto
(nome, valor, estoque)
VALUES
('Bomba 1', 15, 300),
('Bomba 2', 20, 150);

INSERT INTO produto
(nome, estoque)
VALUES
('Bomba 3', 100);

SELECT * FROM produto;

INSERT INTO pedido
(data_horario, quantidade, produto_id)
VALUES
('2024-12-10 20:31:00', 30, 2),
('2025-2-8 12:21:00', 10.5, 1),
('2014-12-10 18:04:00', 100, 3);

INSERT INTO pedido
(data_horario, quantidade, produto_id)
VALUES
('2025-2-8 12:21:00', 10.5, 1);

SELECT * FROM pedido;