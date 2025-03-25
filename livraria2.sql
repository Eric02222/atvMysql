CREATE DATABASE livraria2;
USE livraria2;

CREATE TABLE editora (
id_editora INT NOT NULL AUTO_INCREMENT,
nome_editora ENUM('Editora A', 'Editora B', 'Editora C'),
razaoSocial_editora VARCHAR(45) NOT NULL,
pais_editora VARCHAR(45) DEFAULT 'Brasil',
telefone_editora INT,
PRIMARY KEY (id_editora)
);

CREATE TABLE autor (
id_autor INT NOT NULL AUTO_INCREMENT,
nome_autor VARCHAR (45) NOT NULL,
rg_autor INT,
PRIMARY KEY (id_autor)
);

CREATE TABLE cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome_cliente VARCHAR(45) NOT NULL,
pais VARCHAR (45) DEFAULT 'Brasil',
cpf_cliente INT UNIQUE,
PRIMARY KEY (id_cliente)
);

CREATE TABLE financiador (
id_financiador INT NOT NULL AUTO_INCREMENT,
nome_fin VARCHAR (45) default ('Financiador Publico'),
cnpj_fin BIGINT,
PRIMARY KEY (id_financiador)
);

CREATE TABLE livro (
id_livro INT NOT NULL AUTO_INCREMENT,
isbn_livro BIGINT,
titulo VARCHAR (45),
preco DECIMAL (8.5),
CHECK (preco >= 0),
categoria ENUM ('Horror', 'Ficção', 'Romance', 'Ação'),
editora_id INT,
autor_id INT,
financiador_id INT,
PRIMARY KEY (id_livro),
FOREIGN KEY (editora_id)
REFERENCES editora (id_editora),
FOREIGN KEY (autor_id)
REFERENCES autor (id_autor),
FOREIGN KEY (financiador_id)
REFERENCES financiador (id_financiador)
);

CREATE TABLE pedido (
id_pedido INT NOT NULL AUTO_INCREMENT,
qtd_pedido INT,
CHECK (qtd_pedido >= 0),
livro_id INT,
cliente_id INT,
PRIMARY KEY (id_pedido),
FOREIGN KEY (livro_id)
REFERENCES livro (id_livro),
FOREIGN KEY (cliente_id)
REFERENCES cliente (id_cliente)
);

INSERT INTO editora 
(nome_editora, razaoSocial_editora, pais_editora, telefone_editora)
VALUES
('Editora C', 'Editora Schwarcz SA', 'Coreia do Sul', 44558833),
('Editora C', 'Editora carlos LTDA', 'Burundi', 22443388),
('Editora B', 'Editora Rocco LTDA', 'Bahrein', 88662211);

INSERT INTO autor
(nome_autor, rg_autor)
VALUES
('Carlos', 457812369),
('Beto', 13212359),
('Jorge', 489532669);

INSERT INTO financiador
(nome_fin, cnpj_fin)
VALUES
('Carlos da Silva', 456132189),
('Marcos da Santos', 412454352),
('Andre Andrade', 907132189);

INSERT INTO cliente
(nome_cliente, pais, cpf_cliente)
VALUES
('João junior', 'Bulgária', 12245497),
('Elis Oliveira', 'Fiji', 12245497),
('Murilo Santos', 'ArgentinaArgentina', 13845497);

INSERT INTO livro 
(isbn_livro, titulo, preco, categoria, editora_id, autor_id, financiador_id)
VALUES
(9783785746042, 'Shining', -15, 'Horror', 2, 1, 3),
(1483724746062, 'The Dead House', 112.45, 'Ficção', 1, 3, 2),
(9213885746091, 'O despertar da lua caída', 89.90, 'Romance', 3, 2, 1);

INSERT INTO pedido 
(qtd_pedido, livro_id, cliente_id)
VALUES 
(1, 3, 2),
(1, 2, 1),
(2, 1, 3);

SELECT * FROM livro;


