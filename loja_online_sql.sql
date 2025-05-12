CREATE DATABASE loja_online;
USE loja_online;

CREATE TABLE pedido (
	id_pedido INT NOT NULL AUTO_INCREMENT,
    data_horario DATETIME,
    tipo_entrega ENUM("Normal", "Urgente"),
    preco DECIMAL(8, 2),
    quantidade INT,
    valor_total DECIMAL(8, 2),
    valor_com_desconto DECIMAL(8, 2),
    CHECK (valor_total >= 0),
    CHECK (valor_com_desconto >= 0),
    PRIMARY KEY (id_pedido)
)


DELIMITER $$
CREATE TRIGGER atualizar_valor_total
BEFORE INSERT ON pedido
FOR EACH ROW
BEGIN 
    SET new.valor_total = new.preco * new.quantidade;
END;
$$

DELIMITER $$
CREATE TRIGGER atualizar_valor_total_desconto
BEFORE INSERT ON pedido
FOR EACH ROW
BEGIN 
    SET new.valor_com_desconto = new.valor_total - (new.valor_total * 0.1) ;
END;
$$

SELECT * FROM pedido;

INSERT INTO pedido
(data_horario, tipo_entrega, preco, quantidade)
VALUES
("2024-12-10 20:31:00", "Urgente", 10, 6),
("2024-12-21 09:11:00", "Normal", 150, 8),
("2025-02-10 22:45:00", "Urgente", 130, 15),
("2025-02-12 16:53:00", "Normal", 80, 3),
("2025-04-05 12:14:00", "Urgente", 90, 4),
("2025-04-18 13:41:00", "Normal", 15, 5);

