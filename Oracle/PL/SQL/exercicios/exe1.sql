SELECT * FROM veiculo;
SELECT * FROM multa;
SELECT * FROM tipomulta;
SELECT * FROM motorista;

SET SERVEROUTPUT ON;

-- 1. 
DECLARE 
    v_nome VARCHAR(30) := 'Cirino da Silva';
BEGIN 
   DBMS_OUTPUT.PUT_LINE('Motorista cadastrado: ' || v_nome);
END;
/

-- 2;

DECLARE
    v_nome motorista.nomemot%type;
BEGIN
    SELECT nomeMot INTO v_nome
    FROM motorista
    WHERE carthab = 123456;
    DBMS_OUTPUT.PUT_LINE('motorista: ' || v_nome); 
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('motorista n encontrado'); 
END;
/

-- 3.

-- Pode ser desparado TOO_MANY_ROWS proque WHERE = 'chevrolet' vai retornar vários carros e o select só armazena uma linha.

-- 4.
-- Ele trata o no_data_found, que nunca ira ocorrer porque o COUNT(*) sempre retorna 0 ou mais. Logo, se mesmo que não forá encontrado nenhum
-- dado, o select retorna 0, e nunca cai na exceção no_data_found;

-- 5.

DECLARE
    v_qtde NUMBER; 
    V_nome VARCHAR(60);
BEGIN
    SELECT nomemot INTO v_nome
    FROM motorista 
    WHERE CartHab = 999999;
    
    SELECT COUNT(*) INTO v_qtde
    FROM multa
    WHERE cartHab = 999999; 
    DBMS_OUTPUT.PUT_LINE('Qtde de multas: ' || v_qtde);
    IF v_qtde = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Esta CNH não contém multas');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('CNH nao encontrada');
END;
/

DECLARE
    v_qtde NUMBER;
BEGIN 
    UPDATE motorista
    SET situacao = 'S'
    WHERE cartHab = 123450;
    
    v_qtde := SQL%ROWCOUNT;
    
    IF SQL%ROWCOUNT != 0 THEN 
        DBMS_OUTPUT.PUT_LINE('qtde de linhas afetadas: ' || v_qtde);
     ELSE
        DBMS_OUTPUT.PUT_LINE('Nenhuma linha foi alterada.');
    END IF;
END;
/

-- 7. 

DECLARE
    v_nome VARCHAR2(50);
    v_soma NUMBER;
    v_qtde_linhas NUMBER;
BEGIN
    SELECT nomeMot INTO v_nome
    FROM motorista
    WHERE cartHab = 123450; 
    
    SELECT COUNT(*), NVL(SUM(valormulta), 0) INTO v_qtde_linhas, v_soma
    FROM multa
    WHERE CartHab = 123450;
    
    IF v_qtde_linhas = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Não há multas para esta CNH');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O valor total de multas é: ' || v_soma); 
    END IF;

EXCEPTION 
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Esta CNH não existe');
END;
/


-- 8.

-- TRUNC(MONTHS_BETWEEN(SYSDATE, dataNasc) / 12)
