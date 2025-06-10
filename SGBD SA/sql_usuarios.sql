CREATE DATABASE sa_limpeza;
USE sa_limpeza;

CREATE TABLE usuarios (
id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome Varchar (50) NOT NULL,
email VARCHAR (100),
senha VARCHAR (100),
contato INT,
tipo_conta ENUM('Prestador/a de Serviço', 'Cliente') DEFAULT 'Cliente',
cep INT,
estado VARCHAR (50),
cidade VARCHAR (50),
rua VARCHAR (100),
valor_min DECIMAL (8, 2),
valor_max DECIMAL (8, 2),
cargaHoraria_inicio TIME,
cargaHoraria_fim TIME,
descricao VARCHAR (500)
);