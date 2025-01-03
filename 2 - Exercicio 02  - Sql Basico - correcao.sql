--TRABALHO2

--CRIACAO DO BANCO DE DADOS
CREATE DATABASE TRAB2
GO

--UTILIZACAO DO BANCO DE DADOS
USE TRAB2
GO

--CRIACAO DA TABELA PACIENTES
CREATE TABLE PACIENTES (
  CODIGO	INT NOT NULL,
  NOME		VARCHAR(20),
  ENDERECO	VARCHAR(20),
  CIDADE	VARCHAR(20),
  ESTADO	CHAR(02),
  CEP		CHAR(09),
  FONE		CHAR(08),
  CONSTRAINT PK_PACIENTES PRIMARY KEY(CODIGO)
)
GO

--CRIACAO DA TABELA CONSULTAS
CREATE TABLE CONSULTAS (
  IDCONSULTA		INT NOT NULL,
  CODIGOPACIENTE	INT NOT NULL,
  [DATA]			DATE,
  HORA				TIME,
  VALOR				MONEY,
  OBS				VARCHAR(200),
  CONSTRAINT PK_CONSULTAS PRIMARY KEY(IDCONSULTA),
  CONSTRAINT FK_CONSULTAS_CODPACIENTE 
    FOREIGN KEY(CODIGOPACIENTE) REFERENCES
		PACIENTES(CODIGO)
)
GO

--INSERCAO DE DADOS NA TABELA PACIENTE

INSERT INTO PACIENTES (CODIGO, NOME, ENDERECO, CIDADE, ESTADO, CEP, FONE) VALUES
(1, 'Sharon Stone',		'Rua 10',	'Jales',			'SP', '15750-000', '36323535'),
(2,	'Julia Roberts',	'Rua 22',	'Urania',			'SP', '15670-000', '36324678'),
(3,	'Jose da Silva',	'Rua 29',	'Jales',			'SP', '15750-000', '36789000'),
(4,	'Cleo Pires',		'Rua 15',	'Jales',			'SP', '15750-000', '36321213'),
(5,	'Mel Lisboa',		'Rua 18',	'Fernandopolis',	'SP', '15670-000', '36321567'),
(6,	'Vera Fischer',		 NULL,		'Jundiai',			NULL, NULL,		    NULL),		
(7,	'Rita Cadilac',		'Rua 20',	'Valinhos',			'SP', NULL,		    NULL),		
(8,	'Joana Prado',		'Rua 18',	'Louveira',			'Sp', NULL,		    NULL),		
(9,	'Daniela Motoserra','Rua 30',	'Jundiai',			'Sp', NULL,		    NULL),		
(10,'Joao Luis',		'Rua 10',	'Pocos de Caldas',	'MG', NULL,		    NULL)		
GO

SELECT * FROM PACIENTES
GO

--INSERCAO DE DADOS NA TABELA CONSULTA
INSERT INTO CONSULTAS (IDCONSULTA, CODIGOPACIENTE, [DATA], HORA, VALOR) VALUES
(1,	1,	'01/01/2013',	'10:00', 100),
(2,	2,	'03/01/2013',	'11:00', 150),
(3,	3,	'04/10/2013',	'10:00', 100),
(4,	4,	'02/20/2013',	'08:00', 150),
(5,	5,	'02/12/2013',	'15:00', 200),
(6,	6,	'04/15/2013',	'16:00', 100),
(7,	1,	'01/10/2013',	'12:00', 140),
(8,	1,	'01/15/2013',	'13:00', 150)
GO
SELECT * FROM CONSULTAS

--a)Adicionar o atributo email na tabela pacientes
-- COMANDO DDL
ALTER TABLE PACIENTES ADD EMAIL VARCHAR(30)
GO
SELECT * FROM PACIENTES


--b) Adicione um email qualquer para a Mel Lisboa
--COMANDO DML
BEGIN TRANSACTION
UPDATE PACIENTES SET EMAIL = 'mel.lisboa@hotmail.com' WHERE CODIGO = 5
SELECT * FROM PACIENTES
COMMIT
--ROLLBACK

--c) Excluir a Coluna Fone da tabela pacientes
--COMANDO DDL
ALTER TABLE PACIENTES DROP COLUMN FONE
SELECT * FROM PACIENTES


--d) Alterar o Nome do Paciente com o c�digo 3 para �Joaquim Jose�
--COMANDO DML
BEGIN TRAN
UPDATE PACIENTES SET NOME = 'Joaquim Jose' WHERE CODIGO = 3
SELECT * FROM PACIENTES WHERE CODIGO = 3
COMMIT

--e) Alterar o estado para UF e o endere�o para Rua 24 da Vera Fischer
--COMANDO DML
SELECT * FROM PACIENTES WHERE NOME = 'Vera Fischer'
BEGIN TRAN
UPDATE PACIENTES SET ESTADO='UF', ENDERECO = 'Rua 24' WHERE CODIGO = 6
SELECT * FROM PACIENTES WHERE NOME = 'Vera Fischer'
COMMIT

--f) Alterar o CEP para 15700000 de todas os pacientes que morem na cidade de Jales
--COMANDO DML
SELECT * FROM PACIENTES WHERE CIDADE = 'JALES'
BEGIN TRAN
UPDATE PACIENTES SET CEP = '15700000' WHERE CIDADE = 'JALES'
SELECT * FROM PACIENTES WHERE CIDADE = 'JALES'
COMMIT

--g) Remover o atributo OBS na tabela consultas.
--COMANDO DDL
SELECT * FROM CONSULTAS
BEGIN TRAN
ALTER TABLE CONSULTAS DROP COLUMN OBS
SELECT * FROM CONSULTAS
--ROLLBACK
COMMIT


--h) Aumente o valor das consultas em 10% das datas do m�s de Abril de 2013
--COMANDO DDL
SELECT * FROM CONSULTAS WHERE [DATA] >= '20130401' AND [DATA] <= '20130430'
SELECT VALOR, VALOR * 1.1 FROM CONSULTAS WHERE [DATA] BETWEEN '20130401' AND '20130430'
BEGIN TRAN
UPDATE CONSULTAS SET VALOR = VALOR * 1.1 WHERE [DATA] BETWEEN '20130401' AND '20130430'
SELECT * FROM CONSULTAS WHERE [DATA] >= '20130401' AND [DATA] <= '20130430'
COMMIT

--i) Alterar o valor das consultas para 200 cujo c�digo do pacientes seja 1,3,6
--COMANDO DML
SELECT * FROM CONSULTAS WHERE CODIGOPACIENTE IN (1,3,6)
BEGIN TRAN
UPDATE CONSULTAS SET VALOR = 200 WHERE CODIGOPACIENTE IN (1,3,6)
SELECT * FROM CONSULTAS WHERE CODIGOPACIENTE IN (1,3,6)
COMMIT

--j) Diminua o valor das consultas em 20% , mas somente as consultas que foram as 10:00 da manha
--COMANDO DML

SELECT * FROM CONSULTAS WHERE HORA = '10:00:00.0000000'
SELECT VALOR, VALOR * 0.80 FROM CONSULTAS WHERE HORA = '10:00:00.0000000'

BEGIN TRAN
UPDATE CONSULTAS SET VALOR = VALOR * 0.80 WHERE HORA = '10:00:00.0000000'
SELECT * FROM CONSULTAS WHERE HORA = '10:00:00.0000000'
COMMIT

--k) Fa�a uma exclus�o dos pacientes que moram na cidade de Valinhos.
--COMANDO DML
SELECT * FROM PACIENTES WHERE CIDADE = 'Valinhos'

BEGIN TRAN
DELETE FROM PACIENTES WHERE CIDADE = 'Valinhos'
SELECT * FROM PACIENTES WHERE CIDADE = 'Valinhos'
COMMIT



--l) Fa�a uma exclus�o dos pacientes que moram na cidade de Louveira ou na Rua 30.
--COMANDO DML
SELECT * FROM PACIENTES WHERE CIDADE = 'Louveira' OR ENDERECO = 'Rua 30'

BEGIN TRAN
DELETE FROM PACIENTES WHERE CIDADE = 'Louveira' OR ENDERECO = 'Rua 30'
SELECT * FROM PACIENTES WHERE CIDADE = 'Louveira' OR ENDERECO = 'Rua 30'
COMMIT



--m) Fa�a uma exclus�o de todas as consultas feitas entre o dia 10/01/2003 e 15/01/2003.
--COMANDO DML
SELECT * FROM CONSULTAS WHERE [DATA] BETWEEN '20030110' AND '20030115'

--n) Deletar todos os pacientes do estado de MG	
--COMANDO DML
SELECT * FROM PACIENTES WHERE ESTADO = 'MG'

BEGIN TRAN
DELETE FROM PACIENTES WHERE CODIGO = 10
SELECT * FROM PACIENTES WHERE ESTADO = 'MG'
COMMIT


--TESTE PARA VERIFICAR CONSISTENCIA ENTRE TABELAS
SELECT * FROM CONSULTAS
BEGIN TRAN
DELETE FROM PACIENTES WHERE CODIGO = 1
ROLLBACK












