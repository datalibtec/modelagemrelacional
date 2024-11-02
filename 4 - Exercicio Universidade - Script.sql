--SCRIPT ADAPTADO E CEDIDO DO PROFESSOR RODRIGO STEIN - UNIVERSIDADE

SET DATEFORMAT MDY;


CREATE DATABASE UNIVERSIDADE
GO

USE UNIVERSIDADE
GO

--CRIACAO DA TABELA CURSOS
CREATE TABLE CURSO (
        NUMCURSO INT NOT NULL,
        NOME VARCHAR(25),
        TOTALCREDITOS INT,
PRIMARY KEY (NUMCURSO) );
GO


--CRIACAO DA TABELA PROFESSOR
CREATE TABLE PROFESSOR ( 
        NUMFUNC INT NOT NULL,
        NOME VARCHAR(30),
        ADMISSAO DATETIME,
        AREAPESQUISA CHAR(30),
PRIMARY KEY (NUMFUNC));
go

--CRIACAO DA TABELA ALUNO
CREATE TABLE ALUNO (
        NUMALUNO INT NOT NULL,
        NOME VARCHAR(30),
        ENDERECO CHAR(30),
        CIDADE CHAR(30),
        TELEFONE VARCHAR(15),
        NUMCURSO INT,
PRIMARY KEY (NUMALUNO),
FOREIGN KEY (NUMCURSO) REFERENCES CURSO(NUMCURSO) );
GO

--CRIACAO DA TABELA DISCIPLINA
CREATE TABLE DISCIPLINA (
        NUMDISP INT NOT NULL,
        NOME VARCHAR(25),
        QUANTCREDITOS INT,
PRIMARY KEY (NUMDISP) );
GO

--CRIACAO DA TABELA DISCIPLINA_CURSO
CREATE TABLE DISCIPLINACURSO (
        NUMDISP INT NOT NULL,
        NUMCURSO INT NOT NULL,
PRIMARY KEY (NUMDISP, NUMCURSO),
FOREIGN KEY (NUMDISP) REFERENCES DISCIPLINA(NUMDISP),
FOREIGN KEY (NUMCURSO) REFERENCES CURSO(NUMCURSO) );
GO

--CRIACAO DA TABELA AULA
CREATE TABLE AULA (
        NUMALUNO INT NOT NULL,
        NUMDISP INT NOT NULL,
        NUMFUNC INT NOT NULL,
        SEMESTRE CHAR(7) NOT NULL,
        NOTA DECIMAL(4,2),
PRIMARY KEY (NUMALUNO, NUMDISP, NUMFUNC, SEMESTRE),
FOREIGN KEY (NUMALUNO) REFERENCES ALUNO(NUMALUNO),
FOREIGN KEY (NUMDISP) REFERENCES DISCIPLINA(NUMDISP),
FOREIGN KEY (NUMFUNC) REFERENCES PROFESSOR(NUMFUNC) );
GO



--INSERCAO DE DADOS

--INSERÇÃO NA TABELA CURSO
INSERT INTO CURSO(NumCurso, Nome, TotalCreditos)
VALUES ( 2142, 'Engenharia Civil', 1500);
go
INSERT INTO CURSO(NumCurso, Nome, TotalCreditos)
VALUES (2143, 'Ciencia da Computacao', 2000);
GO
INSERT INTO CURSO(NumCurso, Nome, TotalCreditos)
VALUES (2144, 'Direito', 1750);
GO
INSERT INTO CURSO(NumCurso, Nome, TotalCreditos)
VALUES (2145, 'Pedagogia', 1500);
GO
INSERT INTO CURSO(NumCurso, Nome, TotalCreditos)
VALUES (2146, 'Odontologia', 1600);
GO

--INSERÇÃO NA TABELA PROFESSOR
INSERT INTO PROFESSOR (NumFunc, Nome, Admissao, AreaPesquisa)
VALUES ( 45675, 'Abgair Simon Ferreira', '04-10-1992', 'Banco de Dados'); 
GO
INSERT INTO PROFESSOR (NumFunc, Nome, Admissao, AreaPesquisa)
VALUES (45690, 'Ramon Travanti', '05-20-1993', 'Direito Romano'); 
GO
INSERT INTO PROFESSOR (NumFunc, Nome, Admissao, AreaPesquisa)
VALUES (45691, 'Gustavo Golveia Netto', '04-05-1993', 'Sociologia'); 
GO
INSERT INTO PROFESSOR (NumFunc, Nome, Admissao, AreaPesquisa)
VALUES (45692, 'Marcos Salvador', '03-31-1993', 'Matematica Financeira'); 
GO
INSERT INTO PROFESSOR (NumFunc, Nome, Admissao, AreaPesquisa)
VALUES (45693, 'Cintia Falcao', '02-15-1993', 'Engenharia Software'); 
GO

--INSERÇÃO NA TABELA ALUNO
INSERT INTO ALUNO  (NumAluno, Nome, Endereco, Cidade, Telefone, NumCurso)
VALUES ( 111, 'Edvaldo Carlos Silva', 'Av.Sao Carlos, 186', 'Sao Carlos - SP', '(017) 276-9999', 2143);
GO
INSERT INTO ALUNO  (NumAluno, Nome, Endereco, Cidade, Telefone, NumCurso)
VALUES (112, 'Joao Benedito Scapin', 'R.Jose Bonifacio, 70', 'Sao Carlos - SP', '(017) 273-8974', 2142);
GO
INSERT INTO ALUNO  (NumAluno, Nome, Endereco, Cidade, Telefone, NumCurso)
VALUES (113, 'Carol Antonia Silveira', 'R.Luiz Camoes, 120', 'Ibate - SP', '(017) 278-8568', 2145);
GO
INSERT INTO ALUNO  (NumAluno, Nome, Endereco, Cidade, Telefone, NumCurso)
VALUES (114, 'Marcos Joao Casanova', 'Av. Sao Carlos, 176', 'Sao Carlos - SP', '(017) 274-9874', 2143);
GO
INSERT INTO ALUNO  (NumAluno, Nome, Endereco, Cidade, Telefone, NumCurso)
VALUES (115, 'Simone Cristina Lima', 'R.Raul Junior, 180', 'Sao Carlos - SP', '(017) 273-9865', 2144);
GO
INSERT INTO ALUNO  (NumAluno, Nome, Endereco, Cidade, Telefone, NumCurso)
VALUES (116, 'Ailton Castro', 'R.Antonio Carlos, 120', 'Ibate - SP', '(017) 278-8568', 2142);
GO
INSERT INTO ALUNO  (NumAluno, Nome, Endereco, Cidade, Telefone, NumCurso)
VALUES (117, 'Jose Paulo Figueira', 'R. XV Novembro, 871', 'Sao Carlos - SP', '(017) 274-9874', 2145);
GO


--INSERÇÃO NA TABELA DISCIPLINA
INSERT INTO DISCIPLINA (NumDisp, Nome, QuantCreditos)
VALUES ( 1, 'Banco de Dados', 30);
GO
INSERT INTO DISCIPLINA (NumDisp, Nome, QuantCreditos)
VALUES (2, 'Estrutura de Dados', 30);
GO
INSERT INTO DISCIPLINA (NumDisp, Nome, QuantCreditos)
VALUES (3, 'Direito Penal', 25);
GO
INSERT INTO DISCIPLINA (NumDisp, Nome, QuantCreditos)
VALUES (4, 'Calculo Numerico', 30);
GO
INSERT INTO DISCIPLINA (NumDisp, Nome, QuantCreditos)
VALUES (5, 'Psicologia Infantil', 25);
GO
INSERT INTO DISCIPLINA (NumDisp, Nome, QuantCreditos)
VALUES (6, 'Direito Tributario', 33);
GO
INSERT INTO DISCIPLINA (NumDisp, Nome, QuantCreditos)
VALUES (7, 'Engenharia Software', 27);
GO

--INSERÇÃO NA TABELA AULA
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES ( 111, 1, 45675, '01/1998', 8.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (111, 2, 45675, '01/1998', 6.0);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (111, 2, 45675, '02/1998', 7.0);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (115, 3, 45690, '01/1998', 4.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (115, 3, 45690, '02/1998', 7.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (111, 4, 45692, '01/1998', 8.0);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (112, 4, 45692, '01/1998', 7.0);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (113, 5, 45691, '01/1998', 7.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (115, 6, 45690, '01/1998', 9.0);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (111, 7, 45693, '01/1998', 10.0);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (112, 7, 45693, '01/1998', 5.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (112, 7, 45693, '02/1998', 10.0);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (114, 1, 45675, '01/1998', 7.0);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (114, 2, 45675, '01/1998', 8.0);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (114, 4, 45692, '01/1998', 6.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (114, 4, 45692, '02/1998', 8.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (116, 4, 45692, '01/1998', 3.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (116, 4, 45692, '02/1998', 9.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (114, 7, 45693, '01/1998', 9.5);
GO
INSERT INTO AULA (NumAluno,  NumDisp,  NumFunc, Semestre, Nota)
VALUES (116, 7, 45693, '01/1998', 8.5);
GO

--INSERÇÃO NA TABELA DISCIPLINA_CURSO
INSERT INTO DISCIPLINACURSO(NumDisp, NumCurso)
VALUES (1, 2143);
GO
INSERT INTO DISCIPLINACURSO(NumDisp, NumCurso)
VALUES (2, 2143);
GO
INSERT INTO DISCIPLINACURSO(NumDisp, NumCurso)
VALUES (3, 2144);
GO
INSERT INTO DISCIPLINACURSO(NumDisp, NumCurso)
VALUES (4, 2143);
GO
INSERT INTO DISCIPLINACURSO(NumDisp, NumCurso)
VALUES (4, 2142);
GO
INSERT INTO DISCIPLINACURSO(NumDisp, NumCurso)
VALUES (5, 2145);
GO
INSERT INTO DISCIPLINACURSO(NumDisp, NumCurso)
VALUES (6, 2144);
GO
INSERT INTO DISCIPLINACURSO(NumDisp, NumCurso)
VALUES (7, 2143);
GO
INSERT INTO DISCIPLINACURSO(NumDisp, NumCurso)
VALUES (7, 2142);
GO





