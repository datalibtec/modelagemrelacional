/* 
Data......: 20/01/2025
Autor.....: Datalib Tecnologia
			e Treinamento em Dados
Título....: Como formatar datas no 
			SQL Server
Copyright.: Utilizacao somente para fins 
			educacionais e didaticos 
			com autorizacao do autor.
Referencia: https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16
Comentario: Scrip disponível em 
			https://github.com/datalibtec/modelagemrelacional
*/

--Usando CONVERT 

--Padrao americano mm/dd/aaaa
print(CONVERT(VARCHAR(10), GetDate(), 101))

--Padrao americano mm/dd/aa
print(CONVERT(VARCHAR(10), GetDate(), 10))

--Padrao Britanico/Frances  dd/mm/aaaa
print(CONVERT(VARCHAR(10), GetDate(), 103))

--Padrao Alemão dd.mm.aaaa
print(CONVERT(VARCHAR(10), GetDate(), 104))

--Padrao Japones aaaa/mm/dd
print(CONVERT(VARCHAR(10), GetDate(), 111))


--Utilizando o Cast
--Mais utilizado para transformar outros
--tipos de dados em strings e vice-versa

print(CAST(GetDate() AS VARCHAR(20)))

print(CAST('20250120' AS DATE))

print(CAST('2025/01/20' AS DATE))


/*
	E no banco de dados Oracle?
	Voce sabe se são os mesmos 
	comandos para fazer formatação 
	de Datas?

	Deixe seus comentários!
*/

