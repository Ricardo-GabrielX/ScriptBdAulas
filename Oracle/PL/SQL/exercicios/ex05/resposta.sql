-- PDR 05: Triggers.

-- Exemplo 1: Este gatilho grava um registro na tabela logteste, toda vez que um
-- registro foi excluido da tabela produto.

create table logteste(
    nrlog number primary key,
    Dttrans date not null,
    Usuario varchar2(20) not null,
    Tabela varchar2(30),
    Opera char(1) check (opera in('I','A','E')),
    Linhas Number(5) not Null check(linhas >=0)
);

-- Criando uma sequência automática para ser usada como PK na tabela de Log.
create sequence seqlog;

select seqlog.currval from dual;
select seqlog.nextval from dual;

insert into tb_produto values (6,'Caneta','CX', 5,30);
SELECT * FROM tb_produto;

-- Criando o Trigger (toda vez que deletar um produto grava log

CREATE OR REPLACE TRIGGER EliminaProduto
BEFORE DELETE ON tb_produto
FOR EACH ROW
BEGIN
    INSERT INTO logteste VALUES (seqlog.nextval, sysdate, user, 'produto', 'E' , 1 );
END EliminaProduto;

DELETE tb_produto WHERE codproduto = 6;

SELECT * FROM logteste;


/*
Exemplo 2: Este gatilho não permite que os usuários atualizem ou
eliminem registros de pacientes antes das 7:00 da manhã e depois
das 14:00
*/

CREATE OR REPLACE TRIGGER ChecaHora
BEFORE UPDATE OR DELETE ON paciente
BEGIN
    IF to_number(to_char(sysdate, 'HH24')) NOT BETWEEN 7 and 14
THEN 
    raise_application_error(-20400,'Alterações não permitidas');
    END IF;
END ChecaHora; 
/    

UPDATE paciente
SET nompaciente = 'xex'
WHERE codpaciente = 1;

SELECT * FROM paciente;

-- Exemplo 3 - igual ao exemplo 2 porém identificando se o
-- usuário tentou fazer update ou delete.

Create or Replace Trigger ChecaHora2
before update or delete on paciente
begin
	if to_char(sysdate, 'HH24') not between 7 and 9 then
		if updating then
			raise_application_error(-20400, 'Update não permitido');
		elsif deleting then
			raise_application_error(-20410, 'Delete não permitido');
		end if;
	end if;
end ChecaHora2;
/

-- Para desablitar ou habilitar um trigger usa-se:

ALTER TRIGGER nome_da_trigger DISABLE;
ALTER TRIGGER nomda_da_trigger ENABLE;


-- Usando os qualificadores :NEW e :OLD

-- Exemplo 4 – Usando :NEW e :OLD
-- Ao ser inserida uma linha na tabela de Pedido, mudar o prazo de
-- entrega para mais 15 dias.

CREATE OR REPLACE TRIGGER Troca_data
BEFORE INSERT ON tb_pedido
FOR EACH ROW
BEGIN
    :NEW.prazo_entrega := SYSDATE + 15;
END;
/
-- Para testar:

ALTER TABLE tb_pedido ADD prazo_entrega DATE

INSERT INTO tb_pedido VALUES (999, TO_DATE('30/10/2021', 'DD/MM/YYYY'), 31, 25, NULL);
SELECT * FROM tb_pedido;


DROP TABLE TabLog

CREATE OR REPLACE TRIGGER AplicaDesconto

SET SERVEROUTPUT ON; 
BEGIN 
    -- O contador 'i' é criado e incrementado automaticamente de 1 até 5 
    FOR i IN 1..5 LOOP 
        DBMS_OUTPUT.PUT_LINE('Executando o ciclo número: ' || i);
    END LOOP; 
    
END; 

BEGIN 
    -- O contador 'i' é criado e incrementado automaticamente de 1 até 5 
    FOR i IN REVERSE 1..5 LOOP 
        DBMS_OUTPUT.PUT_LINE('Executando o ciclo número: ' || i);
    END LOOP; 
    
END; 


-- 1. 

DECLARE
    v_total NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        v_total := v_total + i;
        DBMS_OUTPUT.PUT_LINE('iteração: ' || i || ' Resultado: ' || v_total );
    END LOOP;
END; 


-- 4.

SELECT * FROM tb_produto;

DECLARE 
    v_preco tb_produto.valor_unit%TYPE;
BEGIN
    SELECT valor_unit INTO v_preco 
    FROM tb_produto
    WHERE codproduto = 10; 
    DBMS_OUTPUT.PUT_LINE('Feito. Valor_unit: ' || v_preco);
EXCEPTION 
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('produto não econtrado'); 
END;

-- 5. 

SELECT * FROM vendedor; 

DECLARE
    v_nome VARCHAR2(100);
    v_comissao NUMBER; 
BEGIN
    SELECT nomevendedor, comissao INTO v_nome, v_comissao
    FROM vendedor
    WHERE codvendedor = 1;
    IF v_comissao IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('comissao nao definida');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Vendedor: ' || v_nome || ' - Comissão: ' || v_comissao);
    END IF;
END;    

UPDATE vendedor
SET comissao = 10
WHERE codvendedor =1;

-- 6.

DECLARE
    v_qtdePedidos NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_qtdePedidos
    FROM tb_pedido
    WHERE codcliente = 31;
     DBMS_OUTPUT.PUT_LINE('qtde: ' || v_qtdePedidos); 
EXCEPTION 
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Nennhum pedido associado a este cliente'); 
END;
    
SELECT * FROM tb_pedido;

-- 7. Essa aqui eu nao entendi sobre qual dos exercíco de médicos vc se refere.
SELECT * FROM tb_produto;

FOR i IN 1..20 LOOP
    IF codproduto = i THEN
        DBMS_OUTPUT.PUT_LINE(descricao || ' e ' || valor_unit); 
    ELSE
        DBMS_OUTPUT.PUT_LINE('produto de codigo n cadastrado');
    END IF; 
    
-- 9.
CREATE OR REPLACE PROCEDURE SP_ConsultaPreco(pcodprod NUMBER)
AS 
    v_preco tb_produto.valor_unit%TYPE;
BEGIN
    SELECT valor_unit INTO v_preco 
    FROM tb_produto
    WHERE codproduto = pcodprod; 
    DBMS_OUTPUT.PUT_LINE('Feito. Valor_unit: ' || v_preco);
EXCEPTION 
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('produto não econtrado'); 
END;

-- 10.
CREATE OR REPLACE PROCEDURE SP_AtualizaComissao(pcodvendedor IN NUMBER, pnovacomissao IN NUMBER)
AS 
    v_rows_updated NUMBER;
BEGIN
    UPDATE vendedor
    SET comissao = pnovacomissao
    WHERE codvendedor = pcodvendedor;
    
    v_rows_updated := SQL%ROWCOUNT;
    
    IF v_rows_updated = 0 THEN
        DBMS_OUTPUT.PUT_LINE('vendedor não encontrado');
    END IF;
END SP_AtualizaComissao;    
/

Create table TabLog
(datalog date,
campo1 varchar2(60),
campo2 varchar2(60));


SELECT * FROM tb_item_pedido;


CREATE OR REPLACE PROCEDURE CalcComissao(pcodvendedor IN NUMBER)
AS
    v_existe NUMBER;
    v_soma   NUMBER;
    v_perc   NUMBER;
BEGIN
    -- existe esse vendedor?
    SELECT COUNT(*) INTO v_existe
    FROM vendedor
    WHERE codvendedor = pcodvendedor;

    IF v_existe = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Vendedor nao encontrado: ' || pcodvendedor);
        RETURN;
    END IF;

    -- item a: soma do valor de todos os pedidos (faturas) do vendedor
    SELECT NVL(SUM(i.qtde * i.valor), 0) INTO v_soma
    FROM fatura f
    JOIN itens_fatura i ON i.nrfatura = f.nrfatura
    WHERE f.codvendedor = pcodvendedor;

    -- itens b e c: faixas de comissao
    IF v_soma = 0 THEN
        v_perc := 0;
    ELSIF v_soma > 0 AND v_soma < 100 THEN
        v_perc := 10;
    ELSIF v_soma >= 100 AND v_soma <= 1000 THEN
        v_perc := 15;
    ELSE
        v_perc := 20;
    END IF;

    UPDATE vendedor
    SET comissao = v_perc
    WHERE codvendedor = pcodvendedor;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Vendedor: ' || pcodvendedor || ' - Soma: ' || v_soma || ' - Percentual: ' || v_perc);
END CalcComissao;
/

SELECT * FROM FATURA;    
    
SELECT * FROM tb_pedido;

SELECT * FROM vendedor;



SELECT * FROM tb_item_pedido;
SELECT * FROM tb_pedido;


CREATE OR REPLACE TRIGGER DescCliente
BEFORE INSERT ON tb_item_pedido
FOR EACH ROW
DECLARE
    v_qtde NUMBER;
    v_codcliente tb_pedido.codcliente%TYPE; 
BEGIN
    SELECT codcliente INTO v_codcliente
    FROM tb_pedido
    WHERE numped = :NEW.numped;

    SELECT COUNT(*) INTO v_qtde
    FROM tb_pedido
    WHERE codcliente = v_codcliente;
    
    IF v_qtde > 2 THEN 
        :NEW.pco_unit :=  :NEW.pco_unit * 0.85;
    END IF;
    
    
EXCEPTION 
    WHEN no_data_found THEN 
        DBMS_OUTPUT.PUT_LINE('cliente nao encontrado'); 
END DescCliente;        
/

INSERT INTO tb_cliente (codcliente, nome) VALUES (100, 'Cliente Novo');
    

INSERT INTO tb_cliente (codcliente, nome) VALUES (200, 'Cliente Fiel');

INSERT INTO tb_produto (codproduto, descricao, valor_unit) VALUES (10, 'Teclado Gamer', 100.00);


-- Pedido do Cliente 100 (Total: 1 pedido) 
INSERT INTO tb_pedido (numped, dataped, codcliente, codvendedor) 
VALUES (1001, SYSDATE, 100, 1); 

-- Pedidos do Cliente 200 (Total: 3 pedidos) 
INSERT INTO tb_pedido (numped, dataped, codcliente, codvendedor) 
VALUES (2001, SYSDATE, 200, 1); 

INSERT INTO tb_pedido (numped, dataped, codcliente, codvendedor) 
VALUES (2002, SYSDATE, 200, 1); 

INSERT INTO tb_pedido (numped, dataped, codcliente, codvendedor) 
VALUES (2003, SYSDATE, 200, 1); 

COMMIT;


-- PASSO 3: Inserir os Itens (Testando o Disparo da Trigger!) 
-- ======================================================= 

-- TESTE 1: Inserindo item no Pedido 1001 (Cliente 100 - tem 1 pedido) 
-- Preço informado: 100.00 -> Esperado: Continuar 100.00 (sem desconto) 
INSERT INTO tb_item_pedido (numped, codproduto, quantidade, pco_unit) 
VALUES (1001, 10, 1, 100.00); 

-- TESTE 2: Inserindo item no Pedido 2003 (Cliente 200 - tem 3 pedidos) 
-- Preço informado: 100.00 -> Esperado: Gravar 85.00 (15% de desconto!) 
INSERT INTO tb_item_pedido (numped, codproduto, quantidade, pco_unit) 
VALUES (2003, 10, 1, 100.00); 

SELECT * FROM tb_item_pedido;
SELECT ip.numped, p.codcliente, ip.codproduto, ip.quantidade, ip.pco_unit AS preco_gravado FROM tb_item_pedido ip JOIN tb_pedido p ON p.numped = ip.numped WHERE ip.numped IN (1001, 2003);
COMMIT;


--- 
SELECT * FROM veiculo;
SELECT * FROM multa;
SELECT * FROM tipomulta;
SELECT * FROM motorista;

CREATE OR REPLACE PROCEDURE EX_cnh(ncnh IN NUMBER )
AS
    v_linhas_afetadas NUMBER;
BEGIN 
    SELECT COUNT(*) INTO v_linhas_afetadas
    FROM multa 
    WHERE cnh = ncnh;

    IF v_linhas_afetadas != 0 THEN
        INSERT INTO tablog VALUES (SYSDATE, 'Número de multas ' || v_linhas_afetadas);
    ELSE
        DBMS_OUTPUT.PUT_LINE('CNH não possui multas ou não existe.');
    END IF;
   
    
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('cnh nao existe'); 
        
    COMMIT;
END;
/

DROP TABLE tablog;

Create table TabLog
(datalog date,
campo1 varchar2(60),
campo2 varchar2(60))



SELECT * FROM veiculo;
SELECT * FROM multa;
SELECT * FROM tipomulta;
SELECT * FROM motorista;

-- Q1 — Procedure com veículo (variação do padrão que você já domina)

CREATE OR REPLACE PROCEDURE CalcLimite(PplacaVeic IN Veiculo.placaveic%TYPE)
AS
    v_existe veiculo.placaveic%TYPE;
    v_soma  NUMBER; 
BEGIN
    SELECT placaveic INTO v_existe
    FROM veiculo
    WHERE placaveic = PplacaVeic;
    
    SELECT NVL(SUM(valormulta), 0 ) INTO v_soma
    FROM multa
    WHERE placaveiculo = PplacaVeic; 
    
    IF v_soma > 3000 THEN 
        INSERT INTO tablog (datalog,campo1) VALUES(SYSDATE ,'Veiculo com multas acima do limite: ' || v_soma);
        COMMIT;
    END IF; 
    
        
EXCEPTION 
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('Placa não encontrada');
END CalcLimite;
/
SELECT * FROM veiculo;
SELECT * FROM multa;
SELECT * FROM tipomulta;
SELECT * FROM motorista;
CREATE OR REPLACE PROCEDURE  EncontraSuspesa(Pcarthab IN motorista.carthab%TYPE)
AS
    v_existe motorista.carthab%TYPE;
    v_multas NUMBER;
BEGIN
    SELECT carthab INTO v_existe
    FROM motorista 
    WHERE carthab = pcarthab;
    
    SELECT NVL(SUM(pontosmulta), 0) INTO v_multas
    FROM multa
    WHERE carthab = pcarthab;
    
    IF v_multas >= 20 THEN
        UPDATE motorista
        SET situacao = 'S'
        WHERE carthab = pcarthab;
        
        COMMIT;
    END IF;
EXCEPTION 
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('cnh nao encontrada');
END;
/

