/*
Arquivo.....: BDR 040 - Quando usar os tipos de campos char e varchar.sql
Data........: 10/01/2025
Autor.......: Datalib Tecnologia e Treinamento em Dados (Saito)
Copyright...: Utlizacao somente para fins educacionais e didaticos com autorizacao do autor.
Referencias.: https://learn.microsoft.com/pt-br/sql/t-sql/functions/datalength-transact-sql?view=sql-server-ver16
			  https://learn.microsoft.com/pt-br/sql/t-sql/functions/len-transact-sql?view=sql-server-ver16
Comentario..: Utilizacao do SQL Server 2022
*/

drop database if exists TESTE
go

create database TESTE
go

use TESTE
go


-- Criacao da tabela funcionario
if object_id('funcionario', 'U') is not null 
	drop table funcionario
go

create table funcionario (
	codigo			int not null,
	nome			varchar(30),
	endereco		varchar(40),
	bairro			varchar(25),
	cidade			varchar(20),
	uf				char(02),
	cep				char(08),
	nascimento		date,
	constraint pk_conta primary key(codigo),
)
go


--insercao de dados na tabela conta
insert into funcionario (codigo, nome, endereco, bairro, cidade, uf, cep, nascimento) values 
	(10000, 'JOAO DA SILVA', 'RUA CICA, 1223', 'CENTRO', 'SAO PAULO', 'SP', '05421325', '2005-05-01'),
	(10001, 'ANA MARIA', 'RUA VIEIRA SOUTO, 22', 'SANTO ANTONIO', 'CAMPINAS', 'SP', '25426982', '2001-08-14'),
	(123456, 'JOSE ROSSI', 'AVENIDA SAO PAULO, 56', 'PIRES SOARES','VALINHOS','SP', '19584984', '2000-06-06'),
	(1234567, 'JOANA FIGUEIRA', 'TRAVESSA MAUA, 5633', 'SOUZA CRUZ','JUNDIAI','SP', '13256745', '1998-05-13'),
	(12345678, 'APARECIDO SANTOS', 'RIO AMAZONAS, 123', 'SAINT PIERRE','JUNDIAI','S', '13200', '1997-03-11')
go


--selecionando dados de funcionarios
select * from funcionario

select	codigo,   LEN(codigo) as tamCodigo,		DATALENGTH(codigo)as tamByteCodigo, 
	nome,	  LEN(nome) as tamNome,			DATALENGTH(nome)as tamByteNome, 
	endereco, LEN(endereco) as tamEndereco,		DATALENGTH(endereco)as tamByteEndereco, 
	bairro,	  LEN(bairro)as tamBairro,		DATALENGTH(bairro)as tamByteBairro, 
	cidade,	  LEN(cidade)as tamCidade,		DATALENGTH(cidade)as tamByteCidade, 
	uf,	  LEN(uf)as tamUF,			DATALENGTH(uf)as tamByteUF, 
	cep,	  LEN(cep)as tamCep,			DATALENGTH(cep)as tamByteCep
from funcionario


--apagando a tabela criada
if object_id('funcionario', 'U') is not null 
	drop table funcionario
go


--para apagar o banco de dados TESTE criado
use master

drop database if exists TESTE
go



