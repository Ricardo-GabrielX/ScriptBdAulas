-- Exemplo 1: Criando Blocos anônimos

-- a- Inicialmente criar a tabela: 
CREATE TABLE tab_erro( 
    dataerro DATE,
    mensagem VARCHAR2(50)
);

-- b- Criar o bloco anônimo abaixo (como não especifica um nome não será gravado no catálogo)
-- Este bloco faz: obter o valor unitario do produto de codigo =15.
-- Se o valor unitario for NULO atualizar para 100.00 reais.
SELECT * FROM tb_produto;
DECLARE
    v_preco tb_produto.valor_unit%TYPE;
BEGIN
    SELECT valor_unit INTO V_preco
    FROM tb_produto 
    WHERE codproduto = 100;
    DBMS_OUTPUT.PUT_LINE('O preço do produto 15 é: R$ ' || v_preco);
    
    IF v_preco IS NULL THEN 
        DBMS_OUTPUT.PUT_LINE('O valor é NULO! Atualizando para 100...');
        UPDATE tb_produto
        SET valor_unit = 100
        WHERE codproduto = 100;
        
    END IF;
    
    COMMIT;
EXCEPTION 
    -- Se o SELECT não encontrar o produto 15, o Oracle dispara o erro 'NO_DATA_FOUND'
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('ERRO: Produto não encontrado no banco!');
    INSERT INTO tab_erro values(sysdate, 'Produto nao encontrado');
END;

INSERT INTO tb_produto VALUES (100, 'Item Teste', 'UN', NULL, 10);
SET SERVEROUTPUT ON;

SELECT codproduto, descricao, valor_unit FROM tb_produto WHERE codproduto = 100;




-- Criacao  da procedure.

CREATE PROCEDURE SP_AtualizaPreco(Pcodprod IN NUMBER) AS
 -- declaração de variáveis, fica entre 'AS' e 'BEGIN' (Sem a palavra DECLARE) 
 v_preco tb_produto.valor_unit%type;
BEGIN
    SELECT valor_unit INTO v_preco
    FROM tb_produto
    WHERE codproduto = Pcodprod;
    
    DBMS_OUTPUT.PUT_LINE('O preco atual do produto ' || Pcodprod || ' é: R$: ' || v_preco);
    
    -- Se o valor for NULO, atualiza pra 100
    
    IF v_preco IS NULL THEN
        DBMS_OUTPUT.PUT_LINE(' O valor era NULO, Atualizando para 100...');
    
        UPDATE tb_produto
        SET valor_unit = 100
        WHERE codproduto = Pcodprod;
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Produto ' || Pcodprod || ' não encontrado'); 
        INSERT INTO tab_erro VALUES( sysdate, 'Produto não encotrado' || Pcodprod );
END SP_AtualizaPreco;



-- para testar:


EXEC SP_AtualizaPreco(100);
EXEC SP_AtualizaPreco(15);
EXEC SP_AtualizaPreco(99);



BEGIN SP_AtualizaPreco(100); END;
