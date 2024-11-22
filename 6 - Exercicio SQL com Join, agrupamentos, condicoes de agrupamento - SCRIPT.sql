use master
go


--EXCLUINDO AS TABELAS EM ORDERM CERTA (CASO NECESSARIO) 
/*
drop table movimentacao;
drop table servico;
drop table tipo_movimentacao;
drop table conta;
drop table tipo_conta;
drop table cliente;
drop table agencia;
drop table banco;
drop table cidade;
*/


--CRIACAO DO BANCO DE DADOS
create database Banco_ABC
go

use Banco_ABC
go

--CRIACAO DAS TABELAS
create table cidade(
  cod_cidade int not null,
  cidade     varchar(25),
  uf         char(02),
  constraint pk_cidade primary key(cod_cidade)
)
go

create table banco(
  cod_banco int not null,
  desc_banco varchar(25),
  constraint pk_banco primary key(cod_banco)
)
go

create table agencia(
  cod_banco int not null,
  cod_agencia int not null,
  desc_agencia varchar(30),
  cod_cidade int,
  constraint pk_agencia primary key(cod_banco,cod_agencia),
  constraint fk_agencia_banco foreign key(cod_banco) references banco(cod_banco),
  constraint fk_agencia_cidade foreign key(cod_cidade) references cidade(cod_cidade)
)
go

create table cliente (
  cod_cliente int not null,
  nome_cliente varchar(40),
  cod_titular int,
  cod_cidade int,
  constraint pk_cliente primary key(cod_cliente),
  constraint fk_cliente_cod_titular foreign key(cod_titular) references cliente(cod_cliente),
  constraint fk_cliente_cidade foreign key(cod_cidade) references cidade(cod_cidade)
)
go

create table tipo_conta (
  cod_tipo_conta int not null,
  desc_tipo_conta varchar(25),
  constraint pk_tipo_conta primary key(cod_tipo_conta)
)
go

create table conta (
  cod_banco int not null,
  cod_agencia int not null,
  nr_conta varchar(10) not null,
  data_abertura datetime,
  cod_tipo_conta int,
  cod_cliente int,
  data_encerramento datetime,
  constraint pk_conta primary key(cod_banco,cod_agencia,nr_conta),
  constraint fk_conta foreign key(cod_banco,cod_agencia) references agencia(cod_banco,cod_agencia),
  constraint fk_conta_cod_tipo_conta foreign key(cod_tipo_conta) references tipo_conta(cod_tipo_conta),
  constraint fk_conta_cod_cliente foreign key(cod_cliente) references cliente(cod_cliente)
)
go

create table tipo_movimentacao (
  cod_tipo_movimentacao char(01) not null,
  desc_tipo_movimentacao varchar(25),
  constraint pk_tipo_movimentacao primary key(cod_tipo_movimentacao)
)
go

create table servico (
  cod_servico int not null,
  cod_tipo_movimentacao char(01),
  desc_servico varchar(20),
  constraint pk_servico primary key(cod_servico),
  constraint fk_servico_cod_tipo_movimentacao foreign key(cod_tipo_movimentacao) references tipo_movimentacao(cod_tipo_movimentacao)
)
go

create table movimentacao (
  cod_movimentacao bigint not null,
  cod_banco int not null,
  cod_agencia int not null,
  nr_conta varchar(10) not null,
  data_movimentacao datetime not null,
  cod_servico int,
  valor_movimentacao money,
  constraint pk_movimentacao primary key(cod_movimentacao),
  constraint fk_movimentacao_conta foreign key(cod_banco,cod_agencia,nr_conta) references conta(cod_banco,cod_agencia,nr_conta),
  constraint fk_movimentacao_cod_servico foreign key(cod_servico) references servico(cod_servico)
)
go


--INSERCAO DOS DADOS NAS TABELAS BASICAS
insert into cidade(cod_cidade, cidade, uf)
  values (1,'SAO PAULO','SP'),
         (2,'JUNDIAI','SP'),
         (3,'CAMPINAS','SP'),
         (4,'CAMPO LIMPO PAULISTA','SP'),
         (5,'CABREUVA','SP'),
         (7,'LOUVEIRA','SP')
go

insert into banco (cod_banco,desc_banco) 
  values (001, 'BANCO DE BRASIL SA'),
         (237, 'BRADESCO SA'),
         (341, 'ITAU UNIBANCO SA'),
         (033, 'SANTANDER SA'),
         (104, 'CAIXA ECONOMICA FEDERAL'),
         (389, 'BANCO MERCANTIL DO BRASIL')
go

insert into agencia (cod_banco, cod_agencia, desc_agencia, cod_cidade) 
  values (341,0019,'CENTRO',2),
         (341,0027,'VILA HORTOLANDIA',2),
         (341,0035,'9 DE JUHLO',2),
         (001,0100,'AV. JUNDIAI',2),
         (001,0120,'MAXI SHOPPING',2),
         (237,0154,'BARAO DE JUNDIAI',2),
         (237,0250,'PONTE SAO JOAO',2),
         (033,0420,'AV. JUNDIAI',2),
         (104,0100,'CENTRO JUNDIAI',2),
         (389,0420,'RANGEL PESTANA JND',2),
         (341,0007,'AV PAULISTA',1),
         (341,0009,'LAPA',1),
         (341,0011,'SANTO AMARO',1),
         (033,0452,'MORUMBI',1),
         (033,0058,'PENHA',1),
         (033,0238,'ITAIM BIBI',1),
         (237,2663,'AV DO ESTADO',1),
         (237,0323,'ITAIM BIBI',1),
         (237,0329,'VILA MARIANA',1)
go
 
insert into tipo_conta (cod_tipo_conta, desc_tipo_conta) 
  values (1,'CONTA CORRENTE'),
         (2,'POUPANCA'),
         (3,'INVESTIMENTO')
go
         
insert into tipo_movimentacao (cod_tipo_movimentacao, desc_tipo_movimentacao)         
  values ('D','DEBITO'),
         ('C','CREDITO')
go

insert into servico (cod_servico, cod_tipo_movimentacao, desc_servico)
  values (01,'C','DEP EM DINH'),
         (02,'C','DEP EM CHQ'),
         (03,'C','DOC DEP EM CONTA'),
         (04,'C','TED DEP EM CONTA'),
         (05,'C','REMUNERACAO/SALARIO'),
         (10,'D','SAQUE DINH'),         
         (11,'D','CHQ COMPENSADO'),         
         (12,'D','RSHOP'),         
         (13,'D','INT PAG'),
         (14,'D','TAR TX MANUT')
go

                                        



