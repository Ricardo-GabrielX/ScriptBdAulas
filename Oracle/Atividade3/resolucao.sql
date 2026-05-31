DROP TABLE clientes; 
DROP TABLE filiais;

CREATE TABLE filiais(
    codigo CHAR(1) NOT NULL, 
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    constraint pk_codigo primary key(codigo)
);

CREATE TABLE clientes(
    codigo NUMBER NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sexo char(1) NOT NULL,
    limite NUMBER NOT NULL,
    filial CHAR(1),
    constraint pk_codigo_cliente primary key(codigo),
    constraint fk_filial foreign key(filial) references filiais(codigo)
);

-- Inserts

-- FILIAIS

INSERT INTO FILIAIS VALUES ('A', 'Centro', '3332-2020');
INSERT INTO FILIAIS VALUES ('B', 'Shopping', '3333-1010');
INSERT INTO FILIAIS VALUES ('C', 'Votorantim', '3243-1515');
INSERT INTO FILIAIS VALUES ('D', 'Itu', '9321-8345');


-- CLIENTES
SELECT * FROM clientes;

INSERT INTO CLIENTES VALUES (5,  'JOÃO',     'F', 500, 'A');
INSERT INTO CLIENTES VALUES (28, 'MARIA',    'F', 300, 'C');
INSERT INTO CLIENTES VALUES (4,  'PEDRO',    'M', 700, 'A');
INSERT INTO CLIENTES VALUES (32, 'PAULO',    'M', 800, 'A');
INSERT INTO CLIENTES VALUES (16, 'ANA',      'F', 900, 'C');
INSERT INTO CLIENTES VALUES (15, 'JOSÉ',     'M', 500, 'B');
INSERT INTO CLIENTES VALUES (22, 'ANTONIO',  'M', 500, NULL);
INSERT INTO CLIENTES VALUES (19, 'CLÁUDIA',  'F', 900, 'B');

COMMIT;


-- Updates, deletes, inserções.

SELECT * FROM clientes;
SELECT * FROM filiais;


-- apagar a ana e editar maria, para apagar o filiais = c.

--delete ana
DELETE FROM clientes WHERE codigo = 16;

UPDATE clientes 
SET limite = 600
WHERE codigo = 5;

-- atualiza a cliente maria para outra filial e outro limite.
UPDATE clientes
SET limite = 400, filial = 'B'
WHERE codigo = 28;

-- deleta Filial Votorantim.
DELETE FROM filiais WHERE codigo = 'C';

INSERT INTO filiais VALUES('E', 'Salto', '8343-9383');

UPDATE filiais
SET filiais.telefone = '3333-3030'
WHERE codigo = 'B';

UPDATE clientes
SET limite = 1000
WHERE codigo = '19';

INSERT INTO clientes VALUES(25, 'ROBERTA', 'F', 800, 'E');


