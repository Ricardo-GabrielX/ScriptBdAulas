-- a) Crie uma consulta para o departamento de recursos humanos a fim de obter seu endereço completo.

SELECT l.endereco, l.CEP, l.cidade, l.UF, l.pais
FROM localizacao l
INNER JOIN departamento d ON d.idlocalizacao = l.idlocalizacao
WHERE d.nomedepto = 'RH';

-- b) O departamento de recursos humanos precisa de um relatório de todos os 
-- funcionários de todos os setores. Crie uma consulta para exibir o sobrenome, 
-- o número do departamento e o nome do departamento de todos os 
-- funcionários.

-- sobrenome do empregado, n do depto, nome do departamento
-- Left join -> Diz: todos os funcionários, isso inclui func com iddepto = null.

SELECT e.ultimo_nome, d.iddepto, d.nomedepto
FROM empregado e 
LEFT JOIN departamento d ON d.iddepto = e.iddepto;

-- c) Crie um relatório dos funcionários de Santos. Exiba o sobrenome, o cargo, o 
-- número do departamento e o nome do departamento de todos os 
-- funcionários que trabalham em Santos.

-- empregado -> sobrenome
-- cargo -> nomecargo
-- localizao -> where Santos
-- departamento -> numero, nome

SELECT e.ultimo_nome, c.nomecargo, d.nomedepto, d.iddepto
FROM empregado e
INNER JOIN cargo1 c ON c.idcargo = e.idcargo
INNER JOIN departamento d ON d.iddepto = e.iddepto
INNER JOIN localizacao l ON l.idLocalizacao = d.idlocalizacao
WHERE l.cidade = 'Santos';

SELECT * FROM departamento;
SELECT * FROM empregado;

-- d) Crie um relatório para exibir o sobrenome e o número dos funcionários, bem 
-- como o sobrenome e o número dos respectivos gerentes.



-- e) Modifique a consulta d para exibir todos os funcionários, inclusive os que 
-- não possuem gerente.

-- Desenvolver o selects f usando a tabela Disciplina:
-- f) Selecionar nome da disciplina e nome da disciplina pre-requisito (se existir)
