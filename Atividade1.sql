-- 1. Crie uma tabela chamada "Professores" com os campos: Id (int, chave primária), Nome (varchar 50), e Disciplina (varchar 15).
-- 2. Adicione um novo professor com Nome "Ana Oliveira" e Disciplina "Português" à tabela "Professores".
-- 3. Atualize o nome do professor com Id igual a 1 para "Ana Silva".
-- 4. Adicione mais 10 registros, com dados a sua escolha a tabela "Professores"
-- 5. Exclua o professor com Id igual a 2 da tabela "Professores".
-- 6. Crie uma tabela chamada "Turmas" com os campos: Id (int, chave primária), Nome (varchar 50), e ProfessorResponsavel (int chave estrangeira referenciando a tabela "Professores").
-- 7. Adicione uma nova turma com Nome "9A" e ProfessorResponsavel "João da Silva" à tabela "Turmas".
-- 8. Adicione mais 10 registros, com dados a sua escolha a tabela "Turmas"
-- 9. Crie uma tabela chamada "Alunos" com os seguintes campos: Id (int, chave primária), Nome (varchar 50), DataNascimento (date), e TurmaId (int, chave estrangeira referenciando a tabela "Turmas").
-- 10. Adicione um novo aluno com Nome "Maria Souza", DataNascimento "2005-10-15" e TurmaId igual a 1 à tabela "Alunos".
-- 11. Atualize o nome do aluno com Id igual a 1 para "Maria da Silva".
-- 12. Adicione mais 10 registros, com dados a sua escolha a tabela "Alunos"
-- 13. Exclua o aluno com Id igual a 2 da tabela "Alunos".
-- 14. Crie uma tabela chamada "Notas" com os campos: Id (int, chave primária), AlunoId (int, chave estrangeira referenciando a tabela "Alunos"), Disciplina (varchar), e Nota (decimal).
-- 15. Adicione uma nota de 8.5 para o aluno com Id igual a 1 na disciplina "Matemática" à tabela "Notas".
-- 16. Atualize a nota do aluno com Id igual a 1 na disciplina "Matemática" para 9.0.
-- 17. Adicione mais 10 registros, com dados a sua escolha na tabela "Notas"
-- 18. Exclua a nota do aluno com Id igual a 1 na disciplina "Matemática" da tabela "Notas".
-- 19. Crie uma tabela chamada "Matriculas" com os campos: Id (int, chave primária), AlunoId (int, chave estrangeira referenciando a tabela "Alunos"), TurmaId (int, chave estrangeira referenciando a tabela "Turmas"), e DataMatricula (date).
-- 20. Adicione uma matrícula para o aluno com Id igual a 1 na turma com Id igual a 1 com a DataMatricula igual a "2022-02-15" à tabela "Matriculas".
-- 21. Adicione mais 10 registros, com dados a sua escolha na tabela "Matriculas"


-- 1. 
CREATE TABLE professores (
	id int IDENTITY(1,1) PRIMARY KEY not null,
	nome varchar(50),
	disciplina varchar (50),
);

--2 

INSERT INTO  professores  ( nome, disciplina)
VALUES ('Ana Calorina', 'Portugues') ;

-- SELECT * from professores;

-- 4 
UPDATE professores
SET nome = 'Ana Silva'
WHERE id=1;

-- 5 
INSERT INTO professores (nome, disciplina)
VALUES 
('Maria Julia', 'Portugu�s'),
('Jo�o Silva', 'Matem�tica'),
('Maria Oliveira', 'Hist�ria'),
('Carlos Souza', 'Qu�mica'),
('Fernanda Costa', 'Biologia'),
('Rafael Almeida', 'F�sica'),
('Patr�cia Lima', 'Geografia'),
('Lucas Pereira', 'Educa��o F�sica'),
('Beatriz Santos', 'Artes'),
('Ricardo Martins', 'Ingl�s');

-- 6 
DELETE FROM professores WHERE id=2;

-- SELECT * from Turmas;

-- 7
CREATE TABLE Turmas (
	id int PRIMARY KEY not null,
	nome varchar(50),
	Constraint FK_ProfessorResponsavel Foreign key(id)references professores(id)

);
 
 
 -- select * from Turmas

-- 8 
INSERT INTO Turmas (nome, id )
Values ('9A', '3')

-- 9
INSERT INTO Turmas (nome, id) 
VALUES 
('9B', '4'),
('9C', '5'),
('9D', '6'),
('9E', '7'),
('9F', '8'),
('9G', '9'),
('9H', '10'),
('9I', '11'),
('9J', '1');

-- drop table Alunos;

-- 10
CREATE TABLE Alunos (
	idAluno int IDENTITY(1,1) PRIMARY KEY not null,
	nome varchar(50),
	DataNascimento date,
  	idTurma int not null,

	Constraint FK_TurmaID Foreign key(idTurma)references Turmas(id)
);

-- SELECT * FROM Alunos;

-- 11
INSERT INTO Alunos (nome, DataNascimento, idTurma )
Values ('Mari Souza', '2005-10-15', '1')

-- 12
UPDATE Alunos
SET nome = 'Maria da Silva'
WHERE idAluno=1;

-- 13
INSERT INTO Alunos (nome, DataNascimento, idTurma)
Values ('Maria Juniho', '2055-10-15', '3' ),
		('Jo�o Silva', '2006-03-22', '6'),
		('Ana Oliveira', '2005-06-10', '3'),
		('Carlos Pereira', '2005-12-05', '4'),
		('Fernanda Costa', '2006-01-18', '5'),
		('Lucas Almeida', '2005-07-30', '6'),
		('Julia Santos', '2006-02-25', '7'),
		('Rafael Lima', '2005-09-12', '8'),
		('Larissa Martins', '2006-04-03', '9'),
		('Gustavo Rocha', '2005-11-20', '10'),
		('Gustavo Louco', '2005-11-20', '11');

-- SELECT * from Alunos

-- 14
DELETE FROM Alunos WHERE idAluno=2;
-- SELECT * from Alunos;

-- 15
CREATE TABLE Notas (
	idNota int IDENTITY(1,1) PRIMARY KEY not null,
	disciplina varchar(50),
	nota decimal(4,2),
	idAluno int not null,

	Constraint FK_AlunoID Foreign key(idAluno) references Alunos(idAluno)
);

-- SELECT * FROM Notas;
-- DROP TABLE Notas;

--16
INSERT INTO Notas (nota, idAluno, disciplina)
Values ('8.5', '1', 'Matem�tica' );

--17
UPDATE Notas
SET nota = '9.0'
WHERE idNota=1

--18
INSERT INTO Notas (nota, idAluno, disciplina) 
VALUES 
	('9.0', '3', 'Geografia'),
	('6.5', '4', 'Biologia'),
	('7.5', '5', 'Qu�mica'),
	('8.0', '6', 'F�sica'),
	('9.5', '7', 'Artes'),
	('7.0', '8', 'Educa��o F�sica'),
	('8.0', '9', 'Ingl�s'),
	('6.0', '10', 'Literatura'),
	('6.0', '11', 'Literatura');
    
-- 19
DELETE FROM Notas WHERE idNota=1;
-- SELECT * from Notas;

-- 20 
CREATE TABLE Matriculas (
	idMatricula int IDENTITY(1,1) PRIMARY KEY not null,
	dataMatricula date,
	alunoId int not null, 
	turmaID int not null,

	Constraint FK_AlunoID_Matriculas Foreign key(alunoId) references Alunos(idAluno),
	Constraint FK_idTurma Foreign key(turmaID) references Turmas(id)
);

-- DROP TABLE Matriculas

-- 21
INSERT INTO Matriculas (alunoId, turmaID, dataMatricula)
Values ('1', '1', '2022-02-15' );

-- select * from Matriculas

-- 22
INSERT INTO Matriculas (alunoId, turmaID, dataMatricula) 
VALUES
	('3', '3', '2022-02-16'),
	('4', '4', '2022-03-01'),
	('5', '5', '2022-03-02'),
	('6', '6', '2022-04-10'),
	('7', '7', '2022-04-12'),
	('8', '8', '2022-05-05'),
	('9', '9', '2022-05-06'),
	('10', '10', '2022-06-20'),
	('11', '11', '2022-06-21');