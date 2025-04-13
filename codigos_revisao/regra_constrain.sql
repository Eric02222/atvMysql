CREATE DATABASE  regra_constrain;
USE regra_constrain;

CREATE TABLE usuario(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf BIGINT UNIQUE,
pais VARCHAR(45) DEFAULT 'Brasil',
graduado ENUM('Sim', 'Não'),
num_filhos INT,
CHECK (num_filhos >= 0),
PRIMARY KEY (id_cliente)
);

SELECT * FROM usuario;
  
-- CONSTRAINT NOT NULL
INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES 
(123345678, 'Brasil', 'Sim', 2);

INSERT INTO usuario
(cpf, pais, graduado, num_filhos)
VALUES 
(123345678, 'Brasil', 'Sim', 2);

INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES 
('Carlos', 123345678, 'Brasil', 'Sim', 2);

-- CONSTRAINT UNIQUE
INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES 
('Vito', 123345678, 'Chile', 'Nao', 1);

-- CONSTRAINT DEFAULT
INSERT INTO usuario
(nome, cpf, graduado, num_filhos)
VALUES 
('Vito', 123344128, 'Nao', 1);

-- CONSTRAINT ENUM]
INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES 
('Elis', 123245678, 'Alemanha', 'Incompleto', 1);

INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES 
('Elis', 123245678, 'Alemanha', 'Sim', 1);

-- CONSTRAINT CHECK
INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES 
('Fabio', 743245678, 'Canada', 'Sim', -1);

INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES 
('Fabio', 743245678, 'Canada', 'Sim', 69);



