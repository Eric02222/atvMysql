CREATE DATABASE estacionamento_desafio;
USE estacionamento_desafio;

CREATE TABLE estacionamento (
	id_estacionamento INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    capacidade INT,
    subsolo ENUM ('SIM', 'Não'),
    especial ENUM ('SIM', 'Não'),
    PRIMARY KEY (id_estacionamento)
);

INSERT INTO estacionamento
(nome, capacidade, subsolo, especial)
VALUES
('Estacionamneto A', 20, 'Não', 'Não'),
('Estacionamneto B', 35, 'Sim', 'Sim'),
('Estacionamneto C', 40, 'Sim', 'Sim'),
('Estacionamneto D', 50, 'Sim', 'Sim'),
('Estacionamneto E', 15, 'Sim', 'Não'),
('Estacionamneto F', 85, 'Sim', 'Sim'),
('Estacionamneto G', 100, 'Não', 'Não');

SELECT estacionamento.nome, estacionamento.capacidade, estacionamento.subsolo, estacionamento.especial FROM estacionamento
WHERE estacionamento.capacidade BETWEEN 20 AND 40
AND estacionamento.subsolo LIKE 'Sim'
AND estacionamento.especial LIKE 'Sim';

