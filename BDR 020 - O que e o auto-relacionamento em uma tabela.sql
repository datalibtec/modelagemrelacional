/*
Arquivo.....: BDR 020 - O que e o auto-relacionamento em uma tabela.sql
Data........: 09/01/2025
Autor.......: Datalib Tecnologia e Treinamento em Dados (Saito)
Copyright...: Utilização somente para fins educacionais e didaticos com autorização do autor.
Referencias.: 
Comentario..: Utilização do SQL Server 2022
			  Exemplo de criacao de tabela auto-relacionada;
			  Inserção de dados
			  Seleção com Join em uma tabela auto-relacionada
*/

drop database if exists TESTE
go

create database TESTE
go

use TESTE
go


-- Criação da tabela funcionario
if object_id('funcionario', 'U') is not null 
	drop table funcionario
go

create table funcionario (
	cod_fun			int not null,
	nome_fun		varchar(40),
	data_adm_fun	date,
	salario_fun		money,
	cargo_fun		varchar(30),
	gerente_fun		int null,
	constraint pk_funcionario primary key(cod_fun),
	constraint fk_funcionario_gerente foreign key(gerente_fun) 
		references funcionario(cod_fun)
)
go

-- Inserção de dados
select * from funcionario
go

insert into funcionario (cod_fun, nome_fun, data_adm_fun, salario_fun, cargo_fun, gerente_fun) values
	(1,'Jose da Silva','2020-01-10', 25357.65, 'Diretor Geral', null),
	(2,'Ana Maria','2022-05-12', 13435.71, 'Gerente Financeiro', 1),
	(3,'Joao Martins','2021-12-05', 12646.17, 'Gerente de TI', 1),
	(4,'Maria Souza','2021-03-17', 9532.41, 'Dev Ops Sr', 3),
	(5,'Caio Guilherme','2022-07-19', 3566.87, 'Dev Ops Jr', 3),
	(6,'Carla Rodrigues','2020-09-11', 6589.93, 'Analista de Credito Pl', 2),
	(7,'Cicero Toledo','2023-06-22', 3678.65, 'Analista de Cobrança Jr', 2),
	(8,'Andreia Azevedo','2024-05-04', 10658.93, 'DBA Sr', 3)
go

select * from funcionario
go


-- utilizacao para selecao de dados com tabela auto relacionada
select	f.cod_fun,		f.nome_fun,		f.cargo_fun, 
		f.gerente_fun,	g.nome_fun
from	funcionario as f
		 left join funcionario as g
			on f.gerente_fun = g.cod_fun


--tentativa de insercao de dados 
insert into funcionario (cod_fun,		nome_fun,	data_adm_fun, 
						 salario_fun,	cargo_fun,	gerente_fun) values
	(9,'Joao Almeida','2022-05-17', 12853.66, 'Diretor de Mkt', 10);

--insercao de um registro valido
insert into funcionario (cod_fun,		nome_fun,	data_adm_fun, 
						 salario_fun,	cargo_fun,	gerente_fun) values
	(9,'Joao Almeida','2022-05-17', 12853.66, 'Diretor de Mkt', 1);


select * from funcionario


--para apagar o banco de dados TESTE criado
use master

drop database if exists TESTE
go
