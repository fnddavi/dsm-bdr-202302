--ALTER TABLE tbl_titulo
--	ALTER COLUMN categoria SET DEFAULT 'DRAMA';
--	
--CREATE DOMAIN chk_status TEXT CHECK (VALUE IN ('ALUGADO, DISPONIVEL');


CREATE DATABASE bd_aula04;

\c bd_aula04
CREATE TABLE tbl_cliente 
(codigo_cliente INTEGER PRIMARY KEY, 
nome TEXT NOT NULL, 
cidade TEXT, 
endereco TEXT);

CREATE TABLE tbl_titulo 
(codigo_titulo INTEGER PRIMARY KEY, 
titulo TEXT NOT NULL, 
descricao TEXT, 
categoria chk_categoria);

INSERT INTO tbl_cliente VALUES (1, 'Joao da Silva', 'Sao Paulo', 'Rua A, 123');
INSERT INTO tbl_cliente VALUES (2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456');
INSERT INTO tbl_cliente VALUES (3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789');
INSERT INTO tbl_cliente VALUES (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011');
INSERT INTO tbl_cliente VALUES (5, 'Carlos Lima', 'Brasilia', 'Rua E, 1213');

INSERT INTO tbl_titulo VALUES (1, 'Aventuras Urbanas', 'Uma Historia Emocionante', 'DRAMA');
INSERT INTO tbl_titulo VALUES (2, 'Misterios Antigos', 'Enigmas por resolver', 'COMEDIA');
INSERT INTO tbl_titulo VALUES (3, 'Amor nas Etrelas', 'Um romance intergalatico', 'DRAMA');
INSERT INTO tbl_titulo VALUES (4, 'Código Enigmatico', 'Segredos Ocultos', 'COMEDIA');
INSERT INTO tbl_titulo VALUES (5, 'Historias Perdidas', 'Contos esquecidos', 'DRAMA');

SELECT * FROM tbl_cliente;
SELECT nome FROM tbl_cliente WHERE cidade = 'Sao Paulo';
SELECT codigo_cliente FROM tbl_cliente WHERE codigo_cliente > 3;
SELECT * FROM tbl_titulo;

CREATE TABLE tbl_cliente2 (
codigo INTEGER);

INSERT INTO tbl_cliente2 (
codigo)
SELECT codigo_cliente
FROM tbl_cliente;

select * from tbl_cliente2;

