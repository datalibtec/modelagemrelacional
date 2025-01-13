/*
Arquivo.....: BDR 060 - Qual a diferença de campo Unique e uma Chave Primaria_Pt2.sql
Data........: 12/01/2025
Autor.......: Datalib Tecnologia e Treinamento em Dados (Rodrigo Saito)
Copyright...: Utlizacao somente para fins educacionais e didaticos com autorizacao do autor.
Referencias.:	https://learn.microsoft.com/en-us/sql/relational-databases/tables/create-unique-constraints?view=sql-server-ver16
Comentario..: 	Utilizacao do SQL Server 2022
	Parte 1 (SQL Server)	
		Criacao de tabela com chave primaria e chave unica no SQL Server
		Tentativa de insercao de dados na Unique com mais de 1 NULL
		Criacao de chave Unica not null
		Criacao de chave unica com mais de um campo
		Tentativa de insercao de dados na chave unica com mais de um campo
		Tentativa de usar a chave unica relacionada a FK
   ------------------	
   -Parte 2 (Oracle)-
   ------------------
		Criacao de tabela com chave primaria e chave unica no SQL Server
		Tentativa de insercao de dados na Unique com mais de 1 NULL
*/

create table cliente (
	cod_cli			number not null,
	nome_cli		varchar2(35),
	cpf_cli			char(11),
	pis_cli			char(11),
	constraint pk_cliente primary key(cod_cli),
	constraint u_cliente Unique(cpf_cli)
);

--Insercao normal de dados
insert into cliente (cod_cli, nome_cli, cpf_cli, pis_cli) values
	(1,'JOAO DA SILVA','11111111111','99911111111'),
	(2,'MARIA JOSE','22222222222','99922222222'),
	(3,'ANA PEREIRA','33333333333','99933333333');
    
commit;

--Insercao de dados null no campo unique
insert into cliente (cod_cli, nome_cli, cpf_cli, pis_cli) values
	(4,'JOSE DE SOUZA', NULL, '99944444444');

commit;

--tentativa de insercao de dados null pela 2 vez no campo unique
insert into cliente (cod_cli, nome_cli, cpf_cli, pis_cli) values
	(5,'ANTONIO AMARAL', NULL, '99955555555');
commit;

select * from cliente;


--exclusao da tabela cliente
drop table cliente;





