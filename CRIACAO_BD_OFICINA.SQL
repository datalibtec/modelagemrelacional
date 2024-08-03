/*
Curso.............: Modelagem de Banco de Dados Relacionais
Aula..............: Modelo Físico de banco de dados relacionais - Criação de bancos de dados
Autor.............: Rodrigo Saito
Data..............: 02/08/2024
Tecnologia usada..: SQL Server
Arquivo...........: CRIACAO_BD_OFICINA.SQL
*/

CREATE DATABASE OFICINA
GO

USE OFICINA
GO

create table carro (
	chassi	varchar(17) not null,
	marca   varchar(20),
	modelo  varchar(25),
	ano		integer,
	cor		varchar(20),
	placa	char(07),
	constraint pk_chassi primary key(chassi)
)
go

create table reparo (
	chassi varchar(17) not null,
	[data] date not null,
	tipo   varchar(25) not null,
	valor	decimal(10,2),
	oficina varchar(30),
	constraint pk_reparo primary key (chassi,[data],tipo),
	constraint fk_reparochassi foreign key(chassi) references carro(chassi)
)
go
