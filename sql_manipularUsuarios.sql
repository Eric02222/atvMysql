#Mostra todos os usuarios criados
SELECT * FROM mysql.user;

#Cria um usuario com nome e senha
CREATE USER 'Estagiario'@'localhost' IDENTIFIED BY '123'; 

#Define o acesso ao determanado usuario a determanada database e sua tabela, é determina quais ações podem ser feitas
GRANT SELECT ON aula_03_25.* TO 'Estagiario'@'localhost'; 
GRANT INSERT ON aula_03_25.* TO 'Estagiario'@'localhost'; 

GRANT SELECT, INSERT ON banco_brasil.* TO 'Estagiario'@'localhost'; 

GRANT SELECT ON concessionaria.estacionamento TO 'Estagiario'@'localhost'; 

#Remove alguma ação especifica do usuario a determinada database
REVOKE INSERT ON aula_03_25.* FROM 'Estagiario'@'localhost'; 

#Mostra quais ações o usuario pode fazer
SHOW GRANTS FOR 'Estagiario'@'localhost';

#Exclui o usuario
DROP USER 'Estagiario'@'localhost';