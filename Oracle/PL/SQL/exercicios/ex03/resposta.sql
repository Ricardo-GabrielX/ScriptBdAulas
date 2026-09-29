-- Provocando um no_data_found

SET SERVEROUTPUT ON;
DECLARE
    V_nome tb_cliente.nome%type;
BEGIN
    SELECT nome INTO V_nome
    FROM tb_cliente
    WHERE codcliente = 11;
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('Erro: no_data_found');

END;
/


-- Bloco Anônimo (Provocando e tratando `TOO_MANY_ROWS`)

SELECT * FROM tb_produto;

DECLARE
    V_prod tb_produto.valor_unit%type;
BEGIN
    SELECT codproduto INTO V_prod
    FROM tb_produto;
EXCEPTION
    WHEN too_many_rows THEN 
    DBMS_OUTPUT.PUT_LINE('error: too_many_rows');
END;
/


-- Exercício 2: Bloco Anônimo (`SQL%ROWCOUNT` \+ `RAISE_APPLICATION_ERROR`)
SELECT * FROM tb_produto;
BEGIN
    UPDATE tb_produto
    SET valor_unit = valor_unit * 1.1
    WHERE codproduto = 1;
    
    IF SQL%ROWCOUNT = 0 THEN 
        RAISE_APPLICATION_ERROR(-20002, 'produto nao encontrado');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('reajuste de 10% aplicado'); 
    END IF;
END;


-- Exercício 3: Stored Procedure completa (Parâmetros + Validação + Exceção)

CREATE OR REPLACE PROCEDURE SP_AplicaDesconto(Pcodprod number, Ppercentual number)
AS 
    v_preco  tb_produto.valor_unit%type;
    v_novo_preco tb_produto.valor_unit%type;
BEGIN
    SELECT valor_unit INTO v_preco
    FROM tb_produto
    WHERE codproduto = Pcodprod;

    v_novo_preco := v_preco - (v_preco * (Ppercentual / 100));
    
    UPDATE tb_produto
    SET valor_unit = v_novo_preco
    WHERE codproduto = Pcodprod;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Desconto aplicado! Novo preço: R$ ' || v_novo_preco);
    
EXCEPTION 
    WHEN no_data_found THEN 
    INSERT INTO tab_erro VALUES (sysdate, 'Produto inexistente para desconto: ' || Pcodprod);
    COMMIT; 
    DBMS_OUTPUT.PUT_LINE('Produto ' || Pcodprod || ' não encontrado.'); 
    
END SP_AplicaDesconto;
    
    
    
-- Teste 1: Aplicando 10% de desconto no produto 100 (existente)
EXEC SP_AplicaDesconto(100, 10);

-- Teste 2: Tentando aplicar desconto no produto 9999 (inexistente)
EXEC SP_AplicaDesconto(9999, 10);
-- Verifique se o erro do Teste 2 foi gravado na tabela
SELECT * FROM tab_erro;
SELECT * FROM tb_produto;
    

    