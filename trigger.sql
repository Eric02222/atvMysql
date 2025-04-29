CREATE DATABASE teste_trigger;
USE teste_trigger;

CREATE TABLE produto (
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    preco DECIMAL(8.2),
    estoque INT,
    PRIMARY KEY (id_produto)
);

CREATE TABLE pedido (
	id_pedido INT NOT NULL AUTO_INCREMENT,
    data_horario DATETIME,
    quantidade INT,
    produto_id INT,
    FOREIGN KEY (produto_id)
    REFERENCES produto (id_produto),
    PRIMARY KEY (id_pedido)
);

INSERT INTO produto 
(nome, preco, estoque)
VALUES
('Caderno', 19.00, 200),
('Caneta', 5.00, 5),
('Lápis', 3.00, 1000);

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

INSERT INTO pedido
(data_horario, quantidade, produto_id)
VALUES
('2023-10-16 19:35:00', 9, 1);



SELECT * FROM produto;

