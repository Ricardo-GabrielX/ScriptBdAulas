-- 1. Crie uma tabela chamada "Tbl_Clientes" com os seguintes campos: Id (int, chave primária), Nome (varchar 50), Email (varchar 100), e Telefone (varchar 15).
-- 2. Adicione um novo cliente com Id "1", Nome "João Silva", Email "joao@email.com" e Telefone "(11) 1234-5678" à tabela "Tbl_Clientes".
-- 3. Adicione mais 10 registros, com dados a sua escolha a tabela "Tbl_Clientes"
-- 4. Atualize o telefone do cliente com Id igual a 1 para "(11) 8765-4321".
-- 5. Crie uma tabela chamada "Tbl_Produtos" com os campos: Id (int, chave primária), Nome (varchar 50), Preco (decimal), e Estoque (int).
-- 6. Adicione um novo produto com Nome "Camiseta", Preco 29.99 e Estoque 100 à tabela "Tbl_Produtos".
-- 7. Adicione mais 10 registros, com dados a sua escolha a tabela "Tbl_Produtos"
-- 8. Atualize o preço do produto com Id igual a 1 para 39.99.
-- 9. Crie uma tabela chamada "Tbl_Pedidos" com os campos: Id (int, chave primária), ClienteId (int, chave estrangeira referenciando a tabela "Clientes"), ProdutoId (int, chave estrangeira referenciando a tabela "Produtos"), Quantidade (int), e DataPedido (date).
-- 10. Adicione um novo pedido para o cliente com Id igual a 1, referente ao produto com Id igual a 1, com Quantidade 2 e DataPedido igual a hoje à tabela "Tbl_Pedidos".
-- 11. Atualize a quantidade do pedido com Id igual a 1 para 3.
-- 12. Adicione mais 10 registros, com dados a sua escolha a tabela "Tbl_Pedidos"
-- 13. Crie uma tabela chamada "Tbl_Funcionarios" com os campos: Id (int, chave primária), Nome (varchar 50), Cargo (varchar 50), e Salario (decimal).
-- 14. Adicione um novo funcionário com Nome "Maria Santos", Cargo "Gerente" e Salario 5000 à tabela "Funcionarios".
-- 15. Atualize o salário do funcionário com Id igual a 1 para 6000.
-- 16. Adicione mais 10 registros, com dados a sua escolha a tabela "Tbl_Funcionarios"
-- 17. Crie uma tabela chamada "Tbl_Vendas" com os campos: Id (int, chave primária), ProdutoId (int, chave estrangeira referenciando a tabela "Produtos"), Quantidade (int), ValorTotal (decimal), e DataVenda (date).
-- 18. Adicione uma nova venda referente ao produto com Id igual a 1, com Quantidade 2, ValorTotal 79.98 e DataVenda igual a hoje à tabela "Tbl_Vendas".
-- 19. Exclua a venda com Id igual a 1 da tabela "Tbl_Vendas".
-- 20. Adicione mais 10 registros, com dados a sua escolha a tabela "Tbl_Vendas"



USE LP2;

-- 1
CREATE TABLE Tbl_Clientes(
	Id int primary key,
	Nome VARCHAR(50),
	Email VARCHAR(100),
	Telefone VARCHAR(15)	
);


-- 2

INSERT INTO Tbl_Clientes ( Id, Nome, Email, Telefone )
Values ('1', 'Jo�o Silva', 'joao@email.com', '11 1234-5678')

-- SELECT * FROM Tbl_Clientes

-- 3 
INSERT INTO Tbl_Clientes (Id, Nome, Email, Telefone) 
VALUES 
('2', 'Maria Oliveira', 'maria@email.com', '11 2345-6789'),
('3', 'Carlos Souza', 'carlos@email.com', '21 3456-7890'),
('4', 'Ana Pereira', 'ana@email.com', '31 4567-8901'),
('5', 'Fernando Almeida', 'fernando@email.com', '41 5678-9012'),
('6', 'Juliana Santos', 'juliana@email.com', '51 6789-0123'),
('7', 'Roberto Lima', 'roberto@email.com', '61 7890-1234'),
('8', 'Camila Rocha', 'camila@email.com', '71 8901-2345'),
('9', 'Bruno Costa', 'bruno@email.com', '81 9012-3456'),
('10', 'Patr�cia Mendes', 'patricia@email.com', '91 0123-4567'),
('11', 'Eduardo Ferreira', 'eduardo@email.com', '12 1234-5678');

-- 4 

UPDATE Tbl_Clientes
SET Telefone = '11 8765-4321'
WHERE id=1;

-- 5

CREATE TABLE Tbl_Produtos(
	Id int IDENTITY(1,1) primary key,
	Nome VARCHAR(50),
	Preco decimal(8,2),
	Estoque int
);

-- 6 
-- DROP TABLE Tbl_Produtos
INSERT INTO Tbl_Produtos (Nome, Preco, Estoque) 
VALUES ( 'Camiseta', 29.99 , '100' );

-- SELECT * FROM Tbl_Produtos

-- 7 

INSERT INTO Tbl_Produtos (Nome, Preco, Estoque) 
VALUES 
('Cal�a Jeans', '89.90', '50'),
('T�nis Esportivo', '199.99', '30'),
('Jaqueta de Couro', '249.90', '20'),
('Rel�gio Digital', '149.99', '40'),
('Bon�', '39.90', '60'),
('�culos de Sol', '99.99', '35'),
('Mochila Escolar', '120.00', '25'),
('Fone de Ouvido', '79.90', '70'),
('Carteira de Couro', '59.99', '80'),
('Meia Esportiva', '19.99', '200');

-- 8 

UPDATE Tbl_Produtos
SET Preco = 39.99
WHERE Id=1;

-- 9 

CREATE TABLE Tbl_Pedidos(
	Id int IDENTITY(1,1) PRIMARY KEY,
	ClienteId int NOT NULL, 
	ProdutoId int NOT NULL,

	Quantidade int,
	DataPedido date,

	Constraint FK_ClienteId Foreign key(ClienteId) references Tbl_Clientes(Id),
	Constraint FK_ProdutoId Foreign key(ProdutoId) references Tbl_Produtos(Id)
);


-- SELECT * FROM Tbl_Pedidos;

-- 10 

INSERT INTO Tbl_Pedidos (ClienteId ,ProdutoId, Quantidade, DataPedido) 
VALUES ( 1, 1 , 2, '12-03-2025' );

-- 11

UPDATE Tbl_Pedidos
SET Quantidade = 3
WHERE id=1;

-- 12 

INSERT INTO Tbl_Pedidos (ClienteId, ProdutoId, Quantidade, DataPedido) 
VALUES 
(2, 3, 1, '12-03-2025'),
(3, 5, 2, '12-03-2025'),
(4, 2, 1, '12-03-2025'),
(5, 7, 3, '12-03-2025'),
(6, 4, 2, '12-03-2025'),
(7, 8, 1, '12-03-2025'),
(8, 6, 4, '12-03-2025'),
(9, 10, 2, '12-03-2025'),
(10, 9, 1, '12-03-2025'),
(11, 5, 3, '12-03-2025');

-- 13 

CREATE TABLE Tbl_Funcionarios(
	Id int IDENTITY(1,1) primary key,
	Nome VARCHAR(50),
	Cargo VARCHAR(50),
	Salario DECIMAL(8,2)
);

-- 14 

INSERT INTO Tbl_Funcionarios (Nome, Cargo, Salario)
VALUES ('Maria Santos' , 'Gerente' , 5000)

-- SELECT * FROM Tbl_Funcionarios;

-- 15

UPDATE Tbl_Funcionarios
SET Salario = 6000
WHERE id=1;

-- 16 

INSERT INTO Tbl_Funcionarios (Nome, Cargo, Salario) 
VALUES 
('Jo�o Oliveira', 'Atendente', 2500),
('Carlos Mendes', 'Supervisor', 4000),
('Ana Pereira', 'Auxiliar Administrativo', 2800),
('Fernando Souza', 'Analista Financeiro', 4500),
('Juliana Lima', 'Recepcionista', 2300),
('Roberto Costa', 'T�cnico de TI', 3500),
('Camila Rocha', 'Coordenador de Vendas', 4200),
('Bruno Fernandes', 'Auxiliar de Limpeza', 2000),
('Patr�cia Mendes', 'Secret�ria', 2700),
('Eduardo Ferreira', 'Vendedor', 3200);

-- 17

CREATE TABLE Tbl_Vendas(
	Id int IDENTITY(1,1) primary key,
	ProdutoId int,
	quantidade int,
	ValorTotal DECIMAL(8,2),
	DataVenda DATETIME

	Constraint FK_ProdutoIdVendas Foreign key(ProdutoId) references Tbl_Produtos(Id),
);


-- 18 
INSERT INTO Tbl_Vendas (ProdutoId, quantidade, ValorTotal, DataVenda )
VALUES ('1' , '2' , 79.98, '19-03-2025')

-- DROP TABLE Tbl_Vendas;

SELECT * FROM Tbl_Vendas;

-- 19 
DELETE FROM Tbl_Vendas WHERE id = 1;

-- 20

INSERT INTO Tbl_Vendas (ProdutoId, quantidade, ValorTotal, DataVenda )
VALUES 
	('2' , '20' , 79.98, '19-03-2025'),
	('3' , '24' , 123.23, '19-03-2025'),
	('4' , '21' , 10.30, '19-03-2025'),
	('5' , '12' , 55.55, '19-03-2025'),
	('6' , '8' , 64.98, '19-03-2025'),
	('7' , '70' , 520.22, '19-03-2025'),
	('8' , '88' , 900.32, '19-03-2025'),
	('9' , '66' , 52.32, '19-03-2025'),
	('10' , '53' , 321.32, '19-03-2025'),
	('11' , '29' , 69.32, '19-03-2025');

