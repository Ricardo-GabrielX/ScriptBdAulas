-- CONTINUAÇÂO DA AULA

SELECT nome_vendedor, salario_fixo FROM vendedor WHERE salario_fixo between 1500 and 2000;

SELECT Valor_unitario, cod_produto, descricao FROM produto WHERE Valor_unitario between 0.32 and 2.00;

-- uso de LIKE
-- Listar todos os funcionários que tenham a letra M em qualquer parte do nome
SELECT nome_vendedor, salario_fixo, cod_vendedor FROM vendedor WHERE nome_vendedor LIKE '%M%';

-- Listar Nomes que começa com a letra M
SELECT nome_vendedor, salario_fixo, cod_vendedor FROM vendedor WHERE nome_vendedor LIKE 'M%';

-- Listar todos os proudtos que tenham a sua unidade começando por K
SELECT cod_produto, descricao, Unidade FROM produto WHERE Unidade LIKE 'K%'

-- Listar os vendedores que têm A ou B na faixa de comissão
SELECT nome_vendedor FROM vendedor WHERE faixa_comissao IN ('A', 'B');

-- listar os vendedor que nao tem A ou B na faixa de comissão
SELECT nome_vendedor FROM vendedor WHERE faixa_comissao NOT IN ('A', 'B');

-- Mostrar os clientes que tenham inscrição estadual
SELECT * FROM cliente  WHERE ie IS NOT NULL;

-- Mostrar todos os vendedores que tem um salario maior que 1000 e codigo vendedor maior ou igual a 3
SELECT * FROM vendedor WHERE salario_fixo >  1000 AND cod_vendedor >= 3

-- listar os produtos que tenham unidade igaul a 'LT' e valor unitario igual a R$ 70,20
SELECT descricao FROM produto WHERE unidade = 'LT' and Valor_unitario = 70.20;

--Listar os produtos que tenham unidade igual a 'UN' e valor unitario igual a R$ 4,00
SELECT descricao FROM produto WHERE unidade = 'UN' and Valor_unitario = 4;

-- Mostrar todos os vendedores que tem um salario maior que 2500 ou codigo de vendedor igual a 4
SELECT * FROM vendedor WHERE salario_fixo > 2500 or cod_vendedor = 4;
