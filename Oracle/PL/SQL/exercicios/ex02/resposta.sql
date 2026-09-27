
-- PDF 02: Inserir item

CREATE OR REPLACE PROCEDURE Inserir_item(PnumPed number, Pcodprod number, Pquant number)
AS
    v_preco tb_produto.valor_unit%type;
    
BEGIN
    SELECT valor_unit INTO v_preco
    from tb_produto WHERE codProduto = Pcodprod;

    INSERT INTO tb_item_pedido VALUES(Pnumped,Pcodprod, Pquant, v_preco);
    
EXCEPTION
    WHEN no_data_found THEN 
        INSERT INTO tab_erro VALUES (sysdate, 'Produto inexistente ' || Pcodprod);
        
END;
/

-- Realizando testes sobreo o procedimento criado. 

SELECT * FROM tb_produto;
SELECT * FROM tb_pedido;
SELECT * FROM tb_cliente;
-- Insere um cliente e um pedido para associar os itens 
INSERT INTO tb_cliente VALUES (31, 'Cliente Teste', 'Rua A', 'Sorocaba', '18000-000', 'SP'); 
INSERT INTO tb_pedido VALUES (15, TO_DATE('14/06/2020', 'DD/MM/YYYY'), 31, 25);

-- Teste 1: Produto existente (ex: código 13) 
EXEC Inserir_item(15, 13, 2); 
SELECT * FROM tb_item_pedido;

-- Teste 2: Produto inexistente (dispara o EXCEPTION) 
EXEC Inserir_item(15, 111, 2);
SELECT * FROM tab_erro;

-- As procedures criadas podem ser visualizadas usando-se a tabela do Oracle USER_OBJECTS
Select * from user_source;

-- exibir só o texto da procedure
select text from user_source where name ='INSERIR_ITEM';

-- sugestão criar um visão ver_procedures.
CREATE VIEW ver_procedures AS
SELECT object_name from user_objects
WHERE object_type = 'PROCEDURE';

select * from ver_procedures

-- B - Uso da variável SQL%Rowcount

-- SQL%rowcount => variável usada pelo oracle para indicar o número de linhas
-- do último comando SQL.
-- Útil para delete e update pois este comandos não fazem o fluxo de execução
-- desviar para o “no_data_found” qdo devolvem zero linhas.


-- Exemplo 1: Usando SQL%rowcount em um bloco anônimo


SET SERVEROUTPUT ON;
DECLARE
    i NUMBER;
BEGIN
    UPDATE paciente
    SET desconto = 'N'
    WHERE datanasc > '01-01-1990';

    i := SQL%ROWCOUNT;
    
    -- note que a atribuição tem que preceder o COMMIT
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(i);
END;
/


-- Exemplo 2: Abaixo temos um procedimento para excluir um cliente cujo
-- código foi passado como parâmetro


CREATE OR REPLACE PROCEDURE excluir_cliente (pcodcli number)
AS
BEGIN
    INSERT INTO tab_erro
    VALUES (sysdate, '1-Pedido de exclusão do cliente ' || pcodcli);

    DELETE tb_cliente
    WHERE codcliente = pcodcli;

    IF sql%rowcount = 0 THEN
        INSERT INTO tab_erro
        VALUES (sysdate, '2-Cliente a ser excluído não existe ' || pcodcli);
    ELSE
        INSERT INTO tab_erro
        VALUES (sysdate, '3- Cliente excluído com sucesso ' || pcodcli);
    END IF;
END excluir_cliente;
COMMIT;
END;
/

-- testar com cliente que não existe
EXEC excluir_cliente(123)

select * from tab_erro;
-- testar com cliente que existe mas não tem pedido

select * from Tb_cliente
select * from tb_pedido

-- preparando a base de dados para os testes; incluindo com cliente sem pedidos
insert into tb_cliente values (40,'Maria','Rua x','Sorocaba', '12222-1','SP');
exec excluir_cliente(40);
select * from tab_erro;

-- testar com cliente que exista e tenha pedidos
exec excluir_cliente(55)
insert into tb_cliente values (55,'Maria','Rua x','Sorocaba', '12222-1','SP');
INSERT INTO tb_pedido VALUES( 16, '14-06-2020', 55, 25);
-- dará erro, é claro. FK não permite que delete um registro que tenha vínculo com outra tabela. 

-- Exemplo 3: Procedure excluir_cliente alterada para tratar a integridade
-- referencial. Excluir um cliente mas antes testar se não existem pedidos
-- para ele.

create or replace procedure excluir_cliente_FK (pcodcli number)
as
    vtotal number;
    vcod tb_cliente.codcliente%type;
begin
    insert into tab_erro values (sysdate, '1-Pedido de exclusão do
    cliente ' || pcodcli);

    select codcliente
      into vcod
      from tb_cliente
     where codcliente = pcodcli;

    select count(*)
      into vtotal
      from tb_pedido
     where codcliente = pcodcli;

    if vtotal > 0 then
        insert into tab_erro values (sysdate, '4- cliente tem pedido não
        pode ser excluido ' || pcodcli);
    else
        delete from tb_cliente
         where codcliente = pcodcli;

        insert into tab_erro values (sysdate, '3- Cliente excluído com
        sucesso ' || pcodcli);
    end if;

    commit;
exception
    when no_data_found then
        insert into tab_erro values (sysdate, '2-Cliente a ser excluído
        não existe' || pcodcli);
    -- rollback;
end;
/