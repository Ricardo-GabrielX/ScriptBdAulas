-- 1) Crie a tabela Setor,

CREATE TABLE Setor (
	COD_SETOR INT primary key,
	NOME_SETOR VARCHAR(30)
);

-- DROP TABLE Setor;

-- 2) Crie a tabela Funcionario
-- 3) Crie as chaves prim�rias e estrangeiras das tabelas

CREATE TABLE Funcionario (
	NRMATRICULA INT primary key identity(1,1),
	PRIMEIRO_NOME VARCHAR(20),
	ULTIMO_NOME VARCHAR(50),
	EMAIL VARCHAR(200),
	TELEFONE VARCHAR(20),
	DATA_ADMISSAO DATETIME,
	SALARIO FLOAT,
	COD_SETOR INT
	
	Constraint FK_COD_SETOR Foreign key(COD_SETOR) references Setor(COD_SETOR),
);


-- DROP TABLE Funcionario;

-- 4) Fa�a 5 comandos inserts para inserir dados na tabela setor

INSERT INTO setor (COD_SETOR,NOME_SETOR)
VALUES 
	(1, 'Assistente'),
	(2, 'Gest�o'),
	(3, 'RH'),
	(4, 'TI'),
	(5, 'STAFF');

-- SELECT * FROM Setor;
-- SELECT * FROM Funcionario;
-- DROP TABLE Funcionario;

-- 5) Fa�a 8 comandos inserts para inserir dados na tabela funcionario
INSERT INTO Funcionario (PRIMEIRO_NOME, ULTIMO_NOME, EMAIL, TELEFONE, DATA_ADMISSAO, SALARIO, COD_SETOR)
VALUES 
    ('Lucas', 'Silva', 'lucas.silva@example.com', '(11) 99999-1234', '15-01-2023', 3500.00, 1),
    ('Ana', 'Oliveira', 'ana.oliveira@example.com', '(11) 98888-5678', '10-10-2022', 1200.00, 2),
    ('Carlos', 'Costa', 'carlos.costa@example.com', '(21) 97777-9876', '20-05-2021', 5000.00, 3),
    ('Mariana', 'Lima', 'mariana.lima@example.com', '(31) 96666-4321', '05-08-2020', 6000.00, 4),
    ('Jorge', 'Santos', 'jorge.santos@example.com', '(41) 95555-6789', '12-02-2023', 1200.00, 5),
    ('Fernanda', 'Pereira', 'fernanda.pereira@example.com', '(21) 94444-8765', '15-06-2009', 4500.00, 1),
    ('Roberto', 'Almeida', 'roberto.almeida@example.com', '(11) 93333-1122', '25-12-2002', 8000.00, 4),
    ('Juliana', 'Gomes', 'juliana.gomes@example.com', '(51) 92222-3344', '18-03-1990', 1700.00, 3);

-- 6) Exibir o primeiro nome, �ltimo nome e o sal�rio dos funcion�rios que recebem mais de 2500,00.

SELECT PRIMEIRO_NOME, ULTIMO_NOME 
FROM Funcionario
WHERE SALARIO > 2500;

-- 7) Exibir o primeiro nome, �ltimo nome e c�digo do departamento para o n�mero de matr�cula=7 

SELECT PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR 
FROM Funcionario
WHERE NRMATRICULA = 7;

-- 8) Exibir o primeiro nome, �ltimo nome e o sal�rio dos funcion�rios cujo sal�rio n�o esteja na faixa de 1500,00 a 3000,00

SELECT PRIMEIRO_NOME, ULTIMO_NOME
FROM Funcionario
WHERE SALARIO BETWEEN 1500.00 AND 3000.00;

-- 9) Exibir oprimeiro nome, �ltimo nome, c�digo do setor e data de admiss�o dos funcion�rios admitidos desde de 2009. Ordene pela data de admiss�o.

SELECT PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR
FROM Funcionario
WHERE DATA_ADMISSAO >= '01-01-2009'
ORDER BY DATA_ADMISSAO;

-- 10) Exibir os funcion�rios que perten�am ao departamento de TI e RH por ordem num�rica.

SELECT F.PRIMEIRO_NOME, F.ULTIMO_NOME, F.COD_SETOR
FROM Funcionario F
JOIN Setor S ON F.COD_SETOR = S.COD_SETOR
WHERE S.NOME_SETOR IN ('TI', 'RH')
ORDER BY F.COD_SETOR;

-- 11) Exiba os nomes dos funcion�rios que tenham um "a" como a segunda letra do nome.

SELECT PRIMEIRO_NOME, ULTIMO_NOME
FROM Funcionario
WHERE PRIMEIRO_NOME LIKE '_a%';

-- 12) Exiba os nomes dos funcion�rios que tenham uma letra "a" e uma letra "e" no nome

SELECT PRIMEIRO_NOME, ULTIMO_NOME
FROM Funcionario
WHERE PRIMEIRO_NOME LIKE '%a%' AND PRIMEIRO_NOME LIKE '%e%';

-- 13)Exibir os dados dos funcion�rios, que perten�am ao setor 2 por ordem de nome

SELECT PRIMEIRO_NOME, ULTIMO_NOME
FROM Funcionario
WHERE COD_SETOR = 2
ORDER BY PRIMEIRO_NOME;

-- 14) Exibir os funcion�rios que perten�am aos departamentos 2 e 5

SELECT PRIMEIRO_NOME, ULTIMO_NOME
FROM Funcionario
WHERE COD_SETOR = 2 OR COD_SETOR = 5;

-- 15) Exibir os funcion�rios que tenham sal�rio maior que 2300 e perten�am ao setor 3

SELECT PRIMEIRO_NOME, ULTIMO_NOME
FROM Funcionario
WHERE SALARIO >= 2300 AND COD_SETOR = 3;

-- 16) Desenvolva as seguintes consultas:

-- a. Exiba os c�digos de setores exclusivos da tabela funcion�rio (n�o repetir o c�digo do setor)

SELECT DISTINCT COD_SETOR
FROM Funcionario;

-- b. Exiba o sobrenome concatenado com o c�digo do setor, separado por v�rgula e espa�o, e nomeie a coluna como Empregado e Setor


SELECT ULTIMO_NOME + ', ' + CAST(COD_SETOR AS VARCHAR) AS [Empregado e Setor] FROM Funcionario;

