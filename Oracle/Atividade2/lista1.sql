-- a) Encontre o maior, menor, a soma e a média dos salários de todos os empregados. 
-- Nomeie a coluna para Máximo, Mínimo, Soma e Média

SELECT MAX(salario) AS Máximo,
    MIN(salario) AS Mínimo,
    SUM(salario) Soma,
    AVG(salario) AS Média
FROM empregado;

-- b) Altere a consulta a de modo que mostre o mínimo, máximo, soma e média dos 
-- salários dos funcionários por idcargo.
-- 

SELECT 
    idcargo,
    MAX(salario) AS Máximo,
    MIN(salario) AS Mínimo,
    SUM(salario) AS Soma,
    AVG(salario) AS Média
FROM empregado
GROUP BY idcargo
ORDER BY idcargo;

-- c) Escreva uma consulta que mostre a quantidade de empregados de mesmo idcargo

SELECT idcargo, COUNT(idempregado) AS quantidade
FROM empregado
GROUP BY idcargo
ORDER BY idcargo;

-- d) Mostre a quantidade de gerentes cadastrados.

SELECT COUNT(DISTINCT idgerente) AS QTDEGERENTE
FROM empregado
WHERE idgerente IS NOT NULL;

-- e) Mostre a diferença entre o maior e menor salário

SELECT (MAX(salario) - MIN(salario)) AS diferenca
FROM empregado;

-- f) Selecione o idgerente e o menor salário de seus empregados. Mas mostrar 
-- somente os gerentes cujo menor salario seja maior ou igual a 6000. Classifique a 
-- saída em ordem decrescente de salário

SELECT idgerente, MIN(salario) AS menor_salario
FROM empregado
WHERE idgerente IS NOT NULL
GROUP BY idgerente
HAVING MIN(salario) >= 6000
ORDER BY menor_salario DESC;s