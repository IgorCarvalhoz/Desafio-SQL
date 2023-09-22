-- 1 Buscar o nome e o ano dos filmes - OK
Select Nome, Ano From Filmes

-- 2 Buscar o nome e o ano dos filmes ordenado pela ordem crescente por ano - OK
Select Nome, Ano From Filmes Order By Ano Asc

-- 3  Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração - OK
Select * From Filmes Where Id = 28

-- 4 Buscar os filmes lançados em 1997 - OK
Select * From Filmes Where Ano = 1997

-- 5 Buscar os filmes lançados APÓS o ano 2000 - OK
Select * From Filmes Where Ano > 2000

-- 6 Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente - OK
Select * From Filmes Where Duracao > 100 AND Duracao < 150
	Order By Duracao Asc

-- 7 Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, 
       COUNT(*) AS QuantidadeDeFilmes,
	   SUM (Duracao) DuracaoTotal
FROM Filmes
WHERE Ano >= 1954
GROUP BY Ano
ORDER BY DuracaoTotal DESC;

-- 8 Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome - OK
Select PrimeiroNome, UltimoNome, Genero From Atores Where Genero = 'M'

-- 9 Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome - OK
Select PrimeiroNome, UltimoNome, Genero From Atores Where Genero = 'F'
Order By PrimeiroNome Asc

-- 10 Buscar o nome do filme e o gênero - OK
Select 
	Nome, Genero
	From Filmes  
Inner Join FilmesGenero On Filmes.Id = FilmesGenero.IdFilme
Inner Join Generos On FilmesGenero.IdGenero = Generos.Id

-- 11 Buscar o nome do filme e o gênero do tipo "Mistério" - OK
Select 
	Nome, Genero
	From Filmes  
Inner Join FilmesGenero On Filmes.Id = FilmesGenero.IdFilme
Inner Join Generos On FilmesGenero.IdGenero = Generos.Id
Where Genero = 'Mistério'

-- 12 Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel - OK
Select Nome, PrimeiroNome, UltimoNome, Papel
From Filmes
Inner Join ElencoFilme On Filmes.Id = ElencoFilme.IdFilme
Inner Join Atores On ElencoFilme.IdAtor = Atores.Id
