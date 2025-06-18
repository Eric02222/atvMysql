CREATE DATABASE cleanMatch;
USE cleanMatch;

CREATE TABLE usuarios (
id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome Varchar (50) NOT NULL,
email VARCHAR (100) UNIQUE,
senha VARCHAR (100) NOT NULL,
contato INT DEFAULT 0000000000,
tipo_conta ENUM('Prestador/a de Serviço', 'Cliente') DEFAULT 'Cliente',
cep INT DEFAULT 00000000,
estado VARCHAR (50) DEFAULT 'Local Indefinido',
cidade VARCHAR (50) DEFAULT 'Local Indefinido',
rua VARCHAR (100) DEFAULT 'Local Indefinido',
valor_min DECIMAL (8, 2) DEFAULT 150,
valor_max DECIMAL (8, 2) DEFAULT 700,
cargaHoraria_inicio TIME DEFAULT '8:00',
cargaHoraria_fim TIME DEFAULT '16:00',
descricao VARCHAR (500)
);
