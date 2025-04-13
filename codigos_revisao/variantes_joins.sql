
CREATE DATABASE familia;

USE familia;

CREATE TABLE filho(
id_filho INT NOT NULL AUTO_INCREMENT,
nome_filho VARCHAR(45),
PRIMARY KEY (id_filho)
);

CREATE TABLE pai(
id_pai INT NOT NULL AUTO_INCREMENT,
nome_pai VARCHAR(45),
filho_id INT,
FOREIGN KEY (filho_id)
references filho (id_filho),
PRIMARY KEY (id_pai)
);

INSERT INTO filho
(nome_filho)
VALUES
('Joaozinho'),
('Mariazinha'),
('Carlinha'),
('Aninha');

INSERT INTO pai
(nome_pai, filho_id)
VALUES
('Antonio', 4),
('Antonio', 3),
('Carlos', 2);

INSERT INTO pai
(nome_pai)
VALUES
('Mateus');

SELECT * FROM filho;
SELECT * FROM pai;

-- JOIN NORMAL tras apenas dados filtrados que estao vinvulados por id
SELECT pai.nome_pai, filho.nome_filho FROM pai
JOIN filho
ON pai.filho_id = filho.id_filho;

-- LEFT JOIN tras dados filtrados da tabela a esquerda(tabela pai) que não esta vinculado por id da tabela a direita (tabela filho)
SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho
ON pai.filho_id = filho.id_filho;

-- RIGHT JOIN tras dados filtrados da tabela a direita (tabela filho) que não esta vinculado por id da tabela a esquerda(tabela pai) 
SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho.id_filho;

-- FULL JOIN tras todos os dados filtrados até os que não estão vinculados por id
SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho
ON pai.filho_id = filho.id_filho 
-- UNION junta os dois comando de JOIN RIGHT e LEFT
UNION
SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho.id_filho;