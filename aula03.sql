CREATE DATABASE bd_aula03;

CREATE TABLE tbl_cliente (

codigo_cliente integer PRIMARY KEY,
nome text NOT NULL,
cidade text,
endereco text);

CREATE TABLE tbl_titulo (

codigo_titulo integer PRIMARY KEY,
titulo text NOT NULL,
descricao text,
categoria text);

CREATE TABLE tbl_emprestimo (

numero_emprestimo integer PRIMARY KEY,
codigo_client int,
codigo_livro int);

CREATE TABLE tbl_livros (

cod_livro integer PRIMARY KEY,
codigo_titulo int,
status text);