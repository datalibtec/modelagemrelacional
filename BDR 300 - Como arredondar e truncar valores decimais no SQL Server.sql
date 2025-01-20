/* 
Data......: 18/01/2025
Autor.....: Datalib Tecnologia e 
			Treinamento em Dados
Título....: Como arredondar e truncar 
			valores decimais no SQL Server
Copyright.: Utilizacao somente para fins 
			educacionais e didaticos com 
			autorizacao do autor.
Referencia: 
Comentario: Scrip disponível em https://github.com/datalibtec/modelagemrelacional
*/
declare @valor decimal(10,4) 
declare @result decimal(10,2)

--avaliacao da 3 cada decimal 
--print('Round')
SET @valor = 12345.6789
SET @result = ROUND(@valor,2)
print(@result)

SET @valor = 12345.6459
SET @result = ROUND(@valor,2)
print(@result)

SET @valor = 12345.6449
SET @result = ROUND(@valor,2)
print(@result)
print('')

print('Trunc')
SET @valor = 12345.6789
SET @result = ROUND(@valor,2,1)
print(@result)

SET @valor = 12345.6489
SET @result = ROUND(@valor,2,1)
print(@result)

/*
	E no banco de dados Oracle?
	Voce sabe se são os mesmos 
	comandos que utilizamos para
	arredondar ou truncar decimais?

	Deixem os seus comentários!
*/


