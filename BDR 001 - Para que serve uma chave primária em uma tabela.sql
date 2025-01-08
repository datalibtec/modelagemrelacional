/*
Arquivo.....: BDR 001 - Para que serve uma chave primária em uma tabela.sql
Data........: 05/01/2025
Autor.......: Datalib Tecnologia e Treinamento em Dados (Saito)
Copyright...: Utlização somente para fins educacionais e didaticos com autorização do autor.
Referencias.: https://learn.microsoft.com/pt-br/sql/relational-databases/system-catalog-views/sys-objects-transact-sql?view=sql-server-ver16
  			  https://stackoverflow.com/questions/1140203/how-to-check-existence-of-a-sql-server-object-and-drop-it
Comentario..: Utilização do SQL Server 2022
			  Exemplo de chave primária, envolvendo:
				- Criação de PK Simples, sem definicao do nome
				- Criação de PK Simples, com definicao do nome
				- Tentativa de criação de PK Composta, sem definicao do nome
				- Criação de PK Composta, com definicao do nome
				- Inserção de dados na PK simples
				- Tentativa de violação da PK simples
				- Inserção de dados na PK composta
				- Tentativa de violação da PK composta
*/

drop database if exists TESTE
go

create database TESTE
go

use TESTE
go


-- Criação de PK Simples, sem definicao do nome
if object_id('cliente', 'U') is not null 
	drop table cliente
go

create table cliente (
	cod_cli			int not null primary key,
	nome_cli		varchar(40),
	endereco_cli	varchar(40),
	uf				char(02),
)
go


-- Criação de PK Simples, com definicao do nome
if exists (select * from sysobjects WHERE type = 'U' AND name = 'cliente')
	drop table cliente
go

create table cliente (
	cod_cli			int not null,
	nome_cli		varchar(40),
	endereco_cli	varchar(40),
	uf				char(02),
	constraint pk_cliente primary key(cod_cli)
)
go

-- Tentativa de criação de PK Composta, sem definicao do nome
if object_id('item_nf', 'U') is not null 
	drop table item_nf
go

create table item_nf (
	nr_nf		int not null primary key,
	item_nf		int not null primary key,
	cod_prod	int,
	qtd			int,
	preco_unit	money
)
go

-- Criação de PK Composta, com definicao do nome
if object_id('item_nf', 'U') is not null 
	drop table item_nf
go

create table item_nf (
	nr_nf		int not null,
	item_nf		int not null,
	cod_prod	int,
	qtd			int,
	preco_unit	money,
	constraint pk_item_nf primary key(nr_nf, item_nf)
)
go

-- Inserção de dados na PK simples
select * from cliente
go

insert into cliente (cod_cli, nome_cli, endereco_cli, uf) values
	(1,'Jose da Silva','Avenida Jundiai, 9999','SP'),
	(2,'Ana Maria','Avenida 9 de Julho, 8888','SP'),
	(3,'Joao Martins','Avenida Frederico Ozanam, 7777','SP'),
	(4,'Maria Souza','Avenida dos Ferroviarios, 6666','SP')
go

 
-- Tentativa de violação da PK simples
insert into cliente (cod_cli, nome_cli, endereco_cli, uf) values
	(3,'Antonio Vasconcelos','Rua dos Animais, 5555','SP')
go

-- Inserção de dados na PK composta
insert into item_nf (nr_nf, item_nf, cod_prod, qtd, preco_unit) values
	(1,1,1010,10,15.23),
	(1,2,1020,05,4.85),
	(1,3,1025,08,6.38),
	(2,1,1010,05,15.23),
	(2,2,1010,01,15.23)
go

select * from item_nf
go


-- Tentativa de violação da PK composta
insert into item_nf (nr_nf, item_nf, cod_prod, qtd, preco_unit) values
	(2,1,1010,3,15.23)
go

select * from item_nf
go





--para apagar o banco de dados TESTE criado
use master

drop database if exists TESTE
go
