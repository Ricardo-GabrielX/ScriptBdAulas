SELECT * FROM assuntos;
SELECT * FROM autores;
SELECT * FROM autorias;
SELECT * FROM livros;
SELECT * FROM emprestimos;
SELECT * FROM socios;

-- 1) Selecionar os empréstimos por ordem decrescente de nome do sócio. Exibir idlivro, título, nome do sócio, 
-- data de retirada, data de devolução real e multa.

SELECT e.idlivro, l.titulo, s.nome, e.dtretirada, e.dtdevreal, e.vrmulta
FROM emprestimos e
INNER JOIN socios s ON e.codsocio = s.Codigo
INNER JOIN livros l ON l.id = e.idlivro
ORDER BY s.nome DESC;

-- 2) Selecione os sócios que não moram em Sorocaba e tem a letra 'a' no nome.

SELECT s.nome
FROM socios s
WHERE s.nome LIKE '%a%' AND s.cidade <> 'Sorocaba';

-- 3) Suponha que um livro possa ser cadastrado sem editora. Desenvolva um select que mostre todos os livros 
-- da base de dados, mesmo os que possam ser cadastrados sem editora. Exibir título do livro e nome da editora.

SELECT 
    l.titulo,
    e.nome AS editora
FROM livros l
LEFT JOIN editoras e 
    ON e.ideditora = l.ideditora;


-- 4) Exibir quantos livros cada sócio emprestou em determinada data. Mostrar nome do sócio, data e 
-- quantidade de livros.

SELECT s.nome ,e.DtRetirada ,COUNT(idLivro) AS qtde_livros
FROM livros l
INNER JOIN emprestimos e ON e.IdLivro = l.id
INNER JOIN Socios s ON s.codigo = e.codsocio
WHERE e.DtRetirada = '10/09/12'
GROUP BY s.nome, e.dtretirada;

SELECT * FROM EMPRESTIMOS;

-- 5) Selecionar todos os livros do autor 'Silva, José da'.


SELECT l.titulo
FROM livros l
INNER JOIN autorias a ON a.idLivro = l.id
INNER JOIN autores ator ON ator.codigo = a.codautor
WHERE ator.nome = 'Silva, José da';

-- ALTER TABLE livros ADD editora VARCHAR2(20)

-- TRUNCATE livros;

-- DESC livros;