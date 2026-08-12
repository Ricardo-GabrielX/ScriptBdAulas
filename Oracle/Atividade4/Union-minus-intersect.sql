

SELECT * FROM socios;
SELECT * FROM assuntos;
SELECT * FROM livros;
SELECT * FROM emprestimos;
SELECT * FROM autores;
SELECT * FROM autorias;


-- 1) Listar os títulos dos livros que cujo assunto é “Banco de Dados” ou 
-- que foram lançados por editoras que contenham “a” no nome  
-- Usar union, minus ou intersect
SELECT l.titulo
FROM livros l
JOIN assuntos a ON l.codassunto = a.codigo
WHERE a.nome = 'Banco de Dados'

UNION

SELECT l.titulo
FROM livros l
WHERE l.editora LIKE '%a%';

-- 2) Selecione idlivro e titulo de todos os livros que não foram
-- emprestados
-- Usar union, minus ou intersect

SELECT l.id, l.titulo
FROM livros l

MINUS

SELECT l.id, l.titulo
FROM livros l
JOIN emprestimos e ON e.idlivro = l.id;

-- 3) Quais livros já foram emprestados? Mostrar id do livro
-- Usar union, minus ou intersect....
SELECT id FROM livros

INTERSECT

SELECT idlivro
from emprestimos;

-- 4) Listar o codigo do produto, nome do produto, valor unitário original
-- e o valor unitário aumentado em 10%.


-- a) Criar a tabela Produto (CodProd int, Descrição varchar2(30), vrunitario
-- number(8,2).
CREATE TABLE Produto(
    CodProd INT NOT NULL,
    Descricao VARCHAR2(30),
    vrunitario NUMBER(8,2) NOT NULL,    
    CONSTRAINT pk_produto PRIMARY KEY(CodProd)
);

CREATE SEQUENCE sq_produto;

SELECT * FROM Produto;

-- b) Inserir os produtos arroz, leite, óleo, caneta conforme descrição abaixo.
-- Faltou a descrição para eu poder fazer b,c -> professora esqueceu de enviar....

-- c) Desenvolver o select (usando union) que resulte nos dados abaixo:


