CREATE DATABASE bd_sistema_bancario;
\l 							/*lista BDs existentes*/
\c bd_sistema_bancario; 	/* '\c' seleciona um banco específico*/
\dt 						/*lista todas as tabelas dum BD*/

CREATE TABLE tabela01 (codigo INTEGER);
CREATE TABLE tabela02 (codigo INTEGER, Nome VARCHAR, Idade INTEGER, Curso VARCHAR, Cidade TEXT, Peso FLOAT, DataCadastro DATE);
CREATE TABLE tabela03 (Id INTEGER, Nome VARCHAR, Idade INTEGER);
CREATE TABLE tabela04 (ID INTEGER, Contato REAL);
CREATE TABLE tabela05 (Referencia INTEGER, PlacaCarro TEXT);

CREATE TABLE Cliente (NomeCliente VARCHAR[50], Cidade_Cliente VARCHAR [30], Endereco VARCHAR[30]);
CREATE TABLE Conta (Numero_Conta REAL[12], Nome_Agencia TEXT[11], Saldo FLOAT);
CREATE TABLE Emprestimo (Numero_Emprestimo INTEGER, NomeAgencia VARCHAR[12], Valor FLOAT);
CREATE TABLE Agencia (Nome_Agencia TEXT, Cidade_Agencia VARCHAR[50], Depositos INTEGER);

DROP TABLE tabela01, tabela02, tabela03, tabela04, tabela05;

ALTER TABLE Cliente RENAME TO tbi_cliente;
ALTER TABLE tbi_cliente ADD COLUMN Idade INTEGER;
ALTER TABLE tbi_cliente ADD COLUMN CPF INTEGER[11];
ALTER TABLE tbi_cliente RENAME COLUMN NomeCliente TO Nome_Cliente;
ALTER TABLE tbi_cliente RENAME COLUMN Idade TO Idades;
ALTER TABLE tbi_cliente DROP COLUMN Idades;
/**/
ALTER TABLE Conta RENAME TO tbl_Conta;
/**/
ALTER TABLE Emprestimo RENAME TO tbl_emprestimo;
ALTER TABLE tbl_emprestimo RENAME COLUMN NomeAgencia TO Nome_Agencia;
/**/
ALTER TABLE Agencia RENAME TO tbl_agencia;
ALTER TABLE tbl_agencia RENAME COLUMN Cidade_agencia TO Endereco_agencia;
/**/