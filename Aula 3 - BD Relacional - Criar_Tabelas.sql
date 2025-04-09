USE LP2;

create table cliente (
Cod_cliente int Primary Key,
Nome_cliente varchar(50) not null,
Endereco varchar (50),
Cidade varchar(20),
Cep char(8),
UF char(2),
CPF char(14),
IE char(12));

create table vendedor (
cod_vendedor int,
nome_vendedor varchar (50) not null,
faixa_comissao char(1),
salario_fixo decimal(10,2),
CONSTRAINT PK_VENDEDOR PRIMARY KEY (COD_VENDEDOR));


create table produto (
cod_produto int Primary Key,
descricao varchar(20),
Unidade char(2),
Valor_unitario decimal(10,2));


create table pedido (
Num_pedido int,
data_compra datetime,
data_entrega datetime,
cod_cliente int not null,
cod_vendedor int not null ,
FOREIGN KEY(cod_cliente) REFERENCES CLIENTE(Cod_cliente),
FOREIGN KEY(cod_vendedor) REFERENCES VENDEDOR(Cod_vendedor),
PRIMARY KEY(Num_pedido)
);


create table item_pedido (
num_pedido int references pedido,
cod_produto int references produto,
quantidade int,
primary key(num_pedido, cod_produto) )

SELECT * FROM Cliente;

SELECT * FROM pedido;

-- não repete a mesma coisa
SELECT DISTINCT cod_vendedor FROM pedido;

SELECT * FROM Cidade;

SELECT Codcidade, NomeCidade from Cidade;

-- Listar o código e o nome de cada cliente
SELECT 'Código do Cliente', Cod_cliente, 'Nome do Cliente', Nome_cliente FROM Cliente;

-- Coloca em cima o texto escrito, correspondendo ao campo.
SELECT Cod_cliente as 'Código do Cliente', Nome_cliente as 'Nome do Cliente' FROM Cliente;

SELECT nome, salario, salario+300 aumento_salario FROM empregado

SELECT nome_vendedor, salario_fixo, salario_fixo+3 aumento_salario FROM vendedor

SELECT 'Funcionario: ' + nome_vendedor+ ' / Salario: ' + CONVERT(VARCHAR, salario_fixo), salario_fixo, nome_vendedor FROM vendedor

SELECT num_pedido, cod_produto, quantidade FROM item_pedido WHERE quantidade = 45