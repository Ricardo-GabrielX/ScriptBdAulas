USE LP2;

-- Select From com duas ou mais tabelas

SELECT Funcionario.PRIMEIRO_NOME,Funcionario.SALARIO,Setor.NOME_SETOR FROM Funcionario, Setor;

SELECT * FROM Funcionario;

SELECT Funcionario.PRIMEIRO_NOME,Funcionario.SALARIO,Setor.NOME_SETOR FROM Funcionario, Setor WHERE Funcionario.COD_SETOR = Setor.COD_SETOR;

SELECT f.PRIMEIRO_NOME, f.SALARIO, s.NOME_SETOR FROM Funcionario f, Setor s WHERE f.COD_SETOR = s.COD_SETOR;

-- INNER JOINS

SELECT f.PRIMEIRO_NOME, f.SALARIO, s.NOME_SETOR FROM Funcionario f Inner Join Setor s on f.COD_SETOR = s.COD_SETOR;

SELECT  c.Nome_cliente, p.Num_pedido FROM cliente c Inner Join pedido p on c.Cod_cliente = p.cod_cliente;

-- LEFT OUTER JOINS

SELECT c.Nome_cliente, p.Num_pedido FROM cliente c Left outer join pedido p on c.Cod_cliente = p.cod_cliente;

-- LEFT EXCLUDING JOINS 

SELECT c.Nome_cliente, p.Num_pedido FROM cliente c Left outer join pedido p on p.cod_cliente = c.Cod_cliente WHERE p.cod_cliente is null;


SELECT  f.PRIMEIRO_NOME, f.SALARIO, s.NOME_SETOR FROM Funcionario f right outer join Setor s on f.COD_SETOR = s.COD_SETOR

-- FULL OUTER JOIN 

SELECT c.Nome_cliente, p.Num_pedido FROM cliente c full outer join pedido p on c.Cod_cliente = p.cod_cliente

SELECT f.PRIMEIRO_NOME, f.SALARIO, s.NOME_SETOR FROM Funcionario f full outer join Setor s on f.COD_SETOR = s.COD_SETOR;

-- FULL EXLUDING JOIN

SELECT f.PRIMEIRO_NOME, f.SALARIO, s.NOME_SETOR FROM Funcionario f full outer join Setor s on f.COD_SETOR = s.COD_SETOR WHERE f.COD_SETOR is null or s.COD_SETOR is null;

SELECT c.Nome_cliente, p.Num_pedido FROM cliente c full outer join pedido p on c.Cod_cliente = p.cod_cliente WHERE c.Cod_cliente is null or p.cod_cliente is null;

-- CROSS JOIN 

SELECT f.PRIMEIRO_NOME, f.SALARIO, s.NOME_SETOR
FROM Funcionario f
CROSS JOIN Setor s
ORDER BY f.PRIMEIRO_NOME

SELECT c.Nome_cliente, p.Num_pedido
FROM cliente c
CROSS JOIN pedido p 
ORDER BY c.Nome_cliente


-- FUNÇÕES AGREGADAS 

SELECT min(salario_fixo) AS 'MENOR SALARIO', max(salario_fixo) AS 'MAIOR SALARIO'
FROM vendedor;

-- Mostrar a quantidade total pedida para o produto de codigo '3'
SELECT sum(quantidade)
FROM item_pedido
WHERE cod_produto = 3;

-- Calcula a média dos salarios dos funcionarios
SELECT AVG(salario_fixo) AS 'Média Salario'  
FROM vendedor;

-- Count -- quantos vendedores ganha acima de R$ 2.500,00
SELECT count (*) from vendedor
WHERE salario_fixo > 2500.00;


