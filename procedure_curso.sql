CREATE DATABASE curso_matriculas;
USE curso_matriculas;

CREATE TABLE estudante (
	id_estudante INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    matricula INT,
    curso VARCHAR (45),
    cidade VARCHAR (45),
    PRIMARY KEY (id_estudante)
);

INSERT INTO estudante (nome, matricula, curso, cidade)
VALUES
("Carlinho", 123549, "Robotica", "Guarapuava"),
("Maycon", 698549, "Marketing", "São Paulo"),
("Larissa", 163389, "Veterinaria", "Bombinhas"),
("Nicolas", 733349, "Game Developer", "Florianopolis");

INSERT INTO estudante (nome, matricula, curso, cidade)
VALUES
("Carlinho", 123549, "Robotica", "Guarapuava"),
("Maycon", 698549, "Robotica", "São Paulo"),
("Larissa", 163389, "Veterinaria", "Bombinhas"),
("Carlos", 112389, "Veterinaria", "Bombinhas"),
("Cleide", 16432, "Game Developer", "Bombinhas"),
("Nicolas", 733349, "Game Developer", "Florianopolis");

DELIMITER $$
CREATE PROCEDURE atualizar_usuario_select (id_pesquisa INT, at_nome VARCHAR(45), at_matricula INT, at_curso VARCHAR(45), at_cidade VARCHAR(45))
BEGIN
UPDATE estudante
SET nome = at_nome,
	matricula = at_matricula,
    curso = at_curso,
    cidade = at_cidade
WHERE id_estudante = id_pesquisa;
SELECT * FROM estudante;
END;
$$


CALL atualizar_usuario_select(3, 'Elis', 696969, 'Veterinario', 'Floripa');

DELIMITER $$
CREATE PROCEDURE deletar_usuario_select (id_pesquisa INT)
BEGIN
DELETE FROM estudante
WHERE id_estudante = id_pesquisa;
SELECT * FROM estudante;
END;
$$

CALL deletar_usuario_select (3);

DELIMITER $$
CREATE PROCEDURE quantidade_estudante_curso ()
BEGIN
SELECT estudante.curso, count(estudante.curso) AS quantidade_estudantes FROM estudante
GROUP BY estudante.curso;
END;
$$

CALL quantidade_estudante_curso();

