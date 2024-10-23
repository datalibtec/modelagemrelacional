--Crie um banco de dados com o nome de PrimeiroBanco  No Sql Server. 
CREATE DATABASE PRIMEIROBANCO
GO

USE PRIMEIROBANCO
GO

--Crie as duas tabelas abaixo, conforme o dicionário de dados

CREATE TABLE TIPOS (
  CODIGO	INT			NOT NULL PRIMARY KEY,
  TIPO		VARCHAR(20) NOT NULL,
  UNIDADE	CHAR(02)	NOT NULL,
)
GO

CREATE TABLE PRODUTOS (
  CODPRODUTO	INT NOT NULL,
  DATACADASTRO	DATE,
  DESCRICAO		VARCHAR(20) NOT NULL,
  CODTIPO		INT NOT NULL,
  QUANTIDADE	INT NOT NULL,
  PRECOCUSTO	NUMERIC(5,2) NOT NULL, 
  PRECOVENDA	NUMERIC(5,2) NOT NULL,
  VENCIMENTO	DATE,
  CONSTRAINT    PK_PRODUTOS PRIMARY KEY(CODPRODUTO),
  CONSTRAINT	FK_PRODUTOS_CODTIPO FOREIGN KEY(CODTIPO) REFERENCES TIPOS(CODIGO)
)
GO

-- Cadastre os 3 Tipos e Cinco Produtos usando o comando INSERT.
INSERT INTO TIPOS(CODIGO, TIPO, UNIDADE) VALUES (1, 'Bebidas','LT');
INSERT INTO TIPOS(CODIGO, TIPO, UNIDADE) VALUES (2, 'Enlatados', 'LT');
INSERT INTO TIPOS(CODIGO, TIPO, UNIDADE) VALUES (3, 'Não Pereciveis', 'SC');
SELECT * FROM TIPOS

--FAZER A INSERCAO DA TABELA PRODUTOS
INSERT INTO PRODUTOS (CODPRODUTO,	DATACADASTRO,	DESCRICAO,
					  CODTIPO,	    QUANTIDADE,		PRECOCUSTO,
					  PRECOVENDA) VALUES
(1, '05/26/03', 'Coca-Cola', 1, 50, 2.00, 3.00),
(2, '05/26/03', 'Milho',     2, 15, 1.50, 4.00),
(3, '05/27/03', 'Açúcar',    3, 20, 4.00, 7.50),
(4, '05/28/03', 'Sal',       3, 25, 3.00, 6.00),
(5, '05/28/03', 'Farinha',   3, 23, 2.50, 3.50);
SELECT * FROM PRODUTOS

--	Apague a coluna vencimento  da tabela produtos
ALTER TABLE PRODUTOS DROP COLUMN VENCIMENTO;
SELECT * FROM PRODUTOS

-- Adicione uma coluna qtdeminimo que é inteiro na tabela produtos
ALTER TABLE PRODUTOS ADD QTDEMINIMO INT;
SELECT * FROM PRODUTOS

-- Preencha essa nova coluna (qtdeminimo) com o valor 10 para todos os produtos
UPDATE PRODUTOS SET QTDEMINIMO = 10;
SELECT * FROM PRODUTOS

-- De um aumento no atributo precovenda  para todos os produtos de 10%
SELECT PRECOVENDA, PRECOVENDA * 1.1 FROM PRODUTOS
UPDATE PRODUTOS SET PRECOVENDA = PRECOVENDA * 1.1
SELECT * FROM PRODUTOS

-- De uma redução de 20%  no atributo precocusto para todos os produtos Não Perecíveis
SELECT * FROM TIPOS
SELECT PRECOCUSTO, PRECOCUSTO * 0.8 FROM PRODUTOS WHERE CODPRODUTO = 3

UPDATE PRODUTOS SET PRECOCUSTO = PRECOCUSTO * 0.8 WHERE CODTIPO = 3
SELECT * FROM PRODUTOS



-- Mude o nome de coca-cola para pepsi
UPDATE PRODUTOS SET DESCRICAO = 'Pepsi'
WHERE DESCRICAO = 'Coca-Cola'
SELECT * FROM PRODUTOS

-- Apague o atributo unidade da tabela Tipos
SELECT * FROM TIPOS
ALTER TABLE TIPOS DROP COLUMN UNIDADE
SELECT * FROM TIPOS

--Adicione o atributo Sigla que é um caracter de 2 na tabela Tipos.
ALTER TABLE TIPOS ADD SIGLA CHAR(02)
SELECT * FROM TIPOS

--Altere a Sigla de bebidas para LT, a de enlatados 
-- para LA e a de não Perecíveis para NP
SELECT * FROM TIPOS
UPDATE TIPOS SET SIGLA = 'LT' WHERE TIPO = 'Bebidas';
UPDATE TIPOS SET SIGLA = 'LA' WHERE TIPO = 'Enlatados';
UPDATE TIPOS SET SIGLA = 'NP' WHERE TIPO = 'Não Pereciveis';
SELECT * FROM TIPOS

--Apague o registro do produto SAL
SELECT * FROM PRODUTOS
DELETE FROM PRODUTOS WHERE DESCRICAO = 'Sal'
SELECT * FROM PRODUTOS

--Apague todos os produtos que são Enlatados
SELECT * FROM TIPOS
SELECT * FROM PRODUTOS WHERE CODTIPO = 2
DELETE FROM PRODUTOS WHERE CODTIPO = 2
SELECT * FROM PRODUTOS 
























