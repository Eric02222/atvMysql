CREATE DATABASE livraria;
USE livraria;

CREATE TABLE editora (
id_editora INT NOT NULL AUTO_INCREMENT,
nome_editora VARCHAR(45),
razaoSocial_editora VARCHAR(45),
rua_editora VARCHAR(45),
estado_editora VARCHAR(45),
telefone_editora INT,
PRIMARY KEY (id_editora)
);

CREATE TABLE autor (
id_autor INT NOT NULL AUTO_INCREMENT,
nome_autor VARCHAR (45),
rg_autor INT,
PRIMARY KEY (id_autor)
);

CREATE TABLE financiador (
id_financiador INT NOT NULL AUTO_INCREMENT,
nome_fin VARCHAR (45),
cnpj_fin BIGINT,
PRIMARY KEY (id_financiador)
);

CREATE TABLE cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome_cliente VARCHAR(45),
rg_cliente INT,
cpf_cliente INT,
PRIMARY KEY (id_cliente)
);

CREATE TABLE livro (
id_livro INT NOT NULL AUTO_INCREMENT,
isbn_livro BIGINT,
titulo VARCHAR (45),
preco DECIMAL (8.5),
categoria VARCHAR (45),
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
livro_id INT,
cliente_id INT,
PRIMARY KEY (id_pedido),
FOREIGN KEY (livro_id)
REFERENCES livro (id_livro),
FOREIGN KEY (cliente_id)
REFERENCES cliente (id_cliente)
);

INSERT INTO editora 
(nome_editora, razaoSocial_editora, rua_editora, estado_editora, telefone_editora)
VALUES
('Companhia das Letras', 'Editora Schwarcz SA', 'Avenida Orlanda Bergamo, 780, Galpão A', 'Guarulhos SP', 44558833),
('Harper Collings Brasil', 'Editora carlos LTDA', 'Rua da Quitanda, 86, 6º Andar, Sala 601', 'Rio de Janeiro', 22443388),
('Darkside Books', 'DARKSIDE ENTRETENIMENTO LTDA', 'Rua General Roca, 935, Sala 605', 'Tijuca RJ', 99445532),
('Buzz Editora', 'Buzz Editora Ltda', 'Avenida Paulista, 726', 'Bela Vista SP', 22557799),
('Editora Rocco', 'Editora Rocco LTDA', 'Rua Evaristo da Veiga, 65 - Centro', ' Rio de Janeiro', 88662211);

INSERT INTO autor
(nome_autor, rg_autor)
VALUES
('Stephen King', 457812369),
('Matt Haig', 13212359),
('Dawn Kurtagich,', 12633369),
('Jennifer L. Armentrout', 48502249),
(' Sarah A. Parker', 489532669);

INSERT INTO financiador
(nome_fin, cnpj_fin)
VALUES
('Carlos da Silva', 456132189),
('Marcos da Santos', 412454352),
('Julia Martine', 412332189),
('Samanta young', 576435189),
('Andre Andrade', 907132189);

INSERT INTO cliente
(nome_cliente, rg_cliente, cpf_cliente)
VALUES
('João junior', 321789454, 12345497),
('Elis Oliveira', 353789084, 15435497),
('Victor Pereira', 057789544, 43545497),
('Enzo de Davi', 62123454, 86445497),
('Murilo Santos', 427341454, 13845497);

INSERT INTO livro 
(isbn_livro, titulo, preco, categoria, editora_id, autor_id, financiador_id)
VALUES
(9783785746042, 'Shining', 43.27, 'Fantasy Horror', 2, 1, 5),
(1483724746062, 'The Dead House', 112.45, 'Suspense', 4, 3, 2),
(6323785796528, 'A Biblioteca da Meia-Noite', 31.67, 'Ficção científica', 5, 2, 1),
(5273789345422, 'From Blood and Ash', 49.90, 'Romance de amor', 1, 4, 3),
(9213885746091, 'O despertar da lua caída', 89.90, 'Fantasia romântica', 3, 5, 4);

INSERT INTO pedido 
(qtd_pedido, livro_id, cliente_id)
VALUES 
(4, 3, 2),
(1, 5, 4),
(5, 1, 3),
(2, 2, 5),
(3, 5, 1);
