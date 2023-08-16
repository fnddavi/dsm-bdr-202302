CREATE DATABASE bd_aula03;

CREATE TABLE tbl_cliente (codigo_cliente NUMBER PRIMARY KEY, Nome TEXT NOT NULL, Cidade TEXT, Endereco TEXT);
CREATE TABLE tbl_titulo (codigo_titulo NUMBER PRIMARY KEY, Titulo TEXT NOT NULL, Descricao VARCHAR[100], Categoria TEXT);
CREATE TABLE tbl_emprestimo (numero_emprestimo NUMBER PRIMARY KEY, codigo_cliente NUMBER NOT NULL, codigo_livro UNIQUE NOT NULL);
CREATE TABLE tbl_livros (cod_livro NUMBER PRIMARY KEY, codigo_titulo NUMBER, status NOT NULL);