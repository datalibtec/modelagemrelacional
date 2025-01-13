/*
Arquivo.....: BDR 060 - Qual a diferença de campo Unique e uma Chave Primaria_Pt1.sql
Data........: 12/01/2025
Autor.......: Datalib Tecnologia e Treinamento em Dados (Rodrigo Saito)
Copyright...: Utlizacao somente para fins educacionais e didaticos com autorizacao do autor.
Referencias.:	https://learn.microsoft.com/en-us/sql/relational-databases/tables/create-unique-constraints?view=sql-server-ver16
Comentario..: 	Utilizacao do SQL Server 2022
	----------------------
	-Parte 1 (SQL Server)-
	----------------------
		Criacao de tabela com chave primaria e chave unica no SQL Server
		Tentativa de insercao de dados na Unique com mais de 1 NULL
		Criacao de chave Unica not null
		Criacao de chave unica com mais de um campo
		Tentativa de insercao de dados na chave unica com mais de um campo
		Tentativa de usar a chave unica relacionada a FK
	Parte 2 (Oracle)
		Criacao de tabela com chave primaria e chave unica no SQL Server
		Tentativa de insercao de dados na Unique com mais de 1 NULL
*/
use master

drop database if exists TESTE
go

create database TESTE
go

use TESTE
go


-- Criacao da tabela cliente
if object_id('cliente', 'U') is not null 
	drop table cliente
go

--com uma chave primaria e uma Unique que pode conter 1 nulo
create table cliente (
	cod_cli			int not null,
	nome_cli		varchar(35),
	cpf_cli			char(11),
	pis_cli			char(11),
	constraint pk_cliente primary key(cod_cli),
	constraint u_cliente Unique(cpf_cli)
)
go

--Insercao normal de dados
insert into cliente (cod_cli, nome_cli, cpf_cli, pis_cli) values
	(1,'JOAO DA SILVA','11111111111','99911111111'),
	(2,'MARIA JOSE','22222222222','99922222222'),
	(3,'ANA PEREIRA','33333333333','99933333333')
go

--Insercao de dados null no campo unique
insert into cliente (cod_cli, nome_cli, cpf_cli, pis_cli) values
	(4,'JOSE DE SOUZA', NULL, '99944444444')
go

select * from cliente 
go

--tentativa de insercao de dados null pela 2 vez no campo unique
insert into cliente (cod_cli, nome_cli, cpf_cli, pis_cli) values
	(5,'ANTONIO AMARAL', NULL, '99955555555')
go

--insercao de dados em 2 linhas com o pis_cli igual a NULL
insert into cliente (cod_cli, nome_cli, cpf_cli, pis_cli) values
	(6,'MARIA FRANCA', '66666666666', NULL)
go

insert into cliente (cod_cli, nome_cli, cpf_cli, pis_cli) values
	(7,'ANA PEREIRA', '77777777777', NULL)
go

--tentativa de insercao da unique
insert into cliente (cod_cli, nome_cli, cpf_cli, pis_cli) values
	(8,'RICARDO CARDOSO', '77777777777', NULL)
go

select * from cliente


-------------------------------------------------------------
--criacao de tabela para relacionar a Unique como estrangeira
-------------------------------------------------------------
create table venda (
	venda_id	int not null,
	[data]		date,
	cpf_cli		char(11),
	constraint  pk_venda primary key(venda_id),
	constraint  fk_venda_cpf_cli foreign key(cpf_cli) references cliente(cpf_cli)
)
go

--insercao de dados na tabela venda
insert into venda(venda_id, [data], cpf_cli) values
	(1,'20250112','11111111111'),
	(2,'20250112','22222222222')
go

--tentativa de violacao na insercao da venda
insert into venda(venda_id, [data], cpf_cli) values
	(3,'20250112','99999999999')
go



--criacao de tabela aula com Unique composto
create table aula (
	aula_id		int not null,
	professor	varchar(20),
	disciplina	varchar(20),
	turma		varchar(10),
	constraint pk_aula primary key(aula_id),
	constraint u_aula  unique(professor, disciplina, turma)
)
go

--insercao de dados simples
insert into aula (aula_id, professor, disciplina, turma) values
	(1,'JOAO','ALGORITMOS','TURMA 1A'),
	(2,'JOSE','LOGICA','TURMA 1A'),
	(3,'ANA','PORTUGUES','TURMA 1A')
GO

select * from aula

--tentativa de inserção de dados com dados já existentes
insert into aula (aula_id, professor, disciplina, turma) values
	(4,'JOAO','ALGORITMOS','TURMA 1A')
GO

--outra insercao de dados não existente
insert into aula (aula_id, professor, disciplina, turma) values
	(4,'JOAO','BANCO DADOS','TURMA 1A')
GO


--selecao da tabela de aulas
select * from aula


--apagando a tabela criada
if object_id('venda', 'U') is not null 
	drop table venda
go

if object_id('cliente', 'U') is not null 
	drop table cliente
go



--para apagar o banco de dados TESTE criado
use master


drop database if exists TESTE
go



