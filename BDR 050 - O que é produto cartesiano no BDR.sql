/*
Arquivo.....: BDR 050 - O que e produto cartesiano no BDR.sql
Data........: 11/01/2025
Autor.......: Datalib Tecnologia e Treinamento em Dados (Rodrigo Saito)
Copyright...: Utlizacao somente para fins educacionais e didaticos com autorizacao do autor.
Referencias.:	https://learn.microsoft.com/pt-br/sql/t-sql/data-types/time-transact-sql?view=sql-server-ver16 
Comentario..: 	Utilizacao do SQL Server 2022
		Explicacao do cenario	
		Construcao das tabelas
		Inserção de dados
		Explicação do funcionamento do produto cartesiano
*/

drop database if exists TESTE
go

create database TESTE
go

use TESTE
go


-- Criacao da tabela calendario
if object_id('calendario', 'U') is not null 
	drop table calendario
go

create table calendario (
	[data]			date not null,
	dia_sem			varchar(20),
	feriado_nac		char(1),
	feriado_est		char(1),
	feriado_mun		char(1),
	constraint pk_calendario primary key([data])
)
go

create table ubs (
	cod_ubs		int not null,
	descricao	varchar(25),
	endereco	varchar(40)
	constraint pk_ubs primary key(cod_ubs)
)
go


--insercao de dados na tabela calendario
insert into calendario ([data], dia_sem, feriado_nac, feriado_est, feriado_mun) values 
	('20241224','TERCA-FEIRA','N','N','N'),
	('20241225','QUARTA-FEIRA','S','N','N'),
	('20241226','QUINTA-FEIRA','N','N','N'),
	('20241227','SEXTA-FEIRA','N','N','N'),
	('20241228','SABADO','N','N','N'),
	('20241229','DOMINGO','N','N','N'),
	('20241230','SEGUNDA-FEIRA','N','N','N'),
	('20241231','TERCA-FEIRA','N','N','N'),
	('20250101','QUARTA-FEIRA','S','N','N'),
	('20250102','QUINTA-FEIRA','N','N','N'),
	('20250103','SEXTA-FEIRA','N','N','N'),
	('20250104','SABADO','N','N','N'),
	('20250105','DOMINGO','N','N','N'),
	('20250106','SEGUNDA-FEIRA','N','N','N'),
	('20250107','TERCA-FEIRA','N','N','N'),
	('20250108','QUARTA-FEIRA','N','N','N'),
	('20250109','QUINTA-FEIRA','N','N','N'),
	('20250110','SEXTA-FEIRA','N','N','N'),
	('20250111','SABADO','N','N','N'),
	('20250112','DOMINGO','N','N','N')
go

--selecionando dados do calendario
select [data], dia_sem from calendario

--inserindo dados na tabela UBS
insert into ubs (cod_ubs, descricao, endereco) values
	(100,'UBS CENTRAL','AV. ANTONIO SEGRE, 71'),
	(101,'UBS RETIRO','R. MARIA LUCIA DE ALMEIDA, 100'),
	(102,'UBS FAZENDA GRANDE','R. DANIEL DA SILVA, 158'),
	(103,'UBS STA GERTRUDES','RUA ALICE GUIMARAES PELEGRINI, 780'),
	(104,'UBS COLONIA','PROFA BENEDITA SIQUEIRA DE GODOI, 11')
go

--selecionando dados das UBS
select * from ubs

--criando tabela de horario de atendimento

create table horario_atendimento
(	
	horario	time(0)
	constraint pk_horario_atendimento primary key(horario)
)
go

--insercao na tabela de horario_atendimento
insert into horario_atendimento (horario) values
	('08:00'),
	('09:00'),
	('10:00'),
	('11:00'),
	('13:00'),
	('14:00'),
	('15:00'),
	('16:00'),
	('17:00'),
	('18:00')
go

--selecao da tabela de horario de atendimento
select * from horario_atendimento




--selecionando datas que não sejam feriados
select [data], dia_sem
from	calendario
where	feriado_nac = 'N' and feriado_est = 'N' and feriado_mun = 'N'
		and dia_sem not in ('SABADO','DOMINGO')


--aplicando o produto cartesiano
select  cod_ubs, descricao, endereco, [data], dia_sem 
from	ubs, calendario
where	feriado_nac = 'N' and feriado_est = 'N' and feriado_mun = 'N'
		and dia_sem not in ('SABADO','DOMINGO')

--outro modo de aplicar o produto cartesiano
select cod_ubs, descricao, endereco, [data], dia_sem 
from	ubs
		cross join calendario
where	feriado_nac = 'N' and feriado_est = 'N' and feriado_mun = 'N'
		and dia_sem not in ('SABADO','DOMINGO')


--colocando a tabela horario_atendimento no select
select cod_ubs, descricao, endereco, [data], dia_sem, horario 
from	ubs
		cross join calendario
		cross join horario_atendimento
where	feriado_nac = 'N' and feriado_est = 'N' and feriado_mun = 'N'
		and dia_sem not in ('SABADO','DOMINGO')


--necessário ordenar os campos
select cod_ubs, descricao, endereco, [data], dia_sem, horario 
from	ubs
		cross join calendario
		cross join horario_atendimento
where	feriado_nac = 'N' and feriado_est = 'N' and feriado_mun = 'N'
		and dia_sem not in ('SABADO','DOMINGO')
order by cod_ubs, descricao, endereco, [data], horario


--apagando a tabela criada
if object_id('calendario', 'U') is not null 
	drop table calendario
go

if object_id('ubs', 'U') is not null 
	drop table ubs
go

if object_id('horario_atendimento', 'U') is not null 
	drop table horario_atendimento
go


--para apagar o banco de dados TESTE criado
use master


drop database if exists TESTE
go



