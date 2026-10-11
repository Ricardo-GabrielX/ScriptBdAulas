SELECT * FROM veiculo;
SELECT * FROM multa;
SELECT * FROM tipomulta;
SELECT * FROM motorista;

SET SERVEROUTPUT ON;

-- 1;

CREATE OR REPLACE PROCEDURE Consulta_Motorista(pcartHab IN NUMBER)
AS
    v_nome motorista.nomemot%type;
BEGIN
    SELECT nomeMot INTO v_nome
    FROM motorista
    WHERE carthab = pcartHab;
    DBMS_OUTPUT.PUT_LINE('motorista: ' || v_nome); 
EXCEPTION
    WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('motorista n encontrado'); 
END;
/

CREATE OR REPLACE PROCEDURE Suspende_Motorista(pcartHab IN Motorista.carthab%TYPE) 
AS
    v_pontosMulta NUMBER;
    v_existe VARCHAR2(50);
BEGIN
    SELECT nomemot INTO v_existe
    FROM motorista
    WHERE cartHab = pcartHab;
    
    SELECT NVL(SUM(pontosmulta), 0)  INTO v_pontosMulta
    FROM multa
    WHERE cartHab = pcartHab;

    IF v_pontosMulta >= 20 THEN
        UPDATE motorista 
        SET  situacao = 'S'
        WHERE carthab = pcarthab;
        
        DBMS_OUTPUT.PUT_LINE(
            'Motorista suspenso'
        );
        COMMIT; 
    END IF;
EXCEPTION 
    WHEN no_data_found THEN 
        DBMS_OUTPUT.PUT_LINE('Este motorista nao existe');
END;
/

CREATE OR REPLACE PROCEDURE Conta_Multas_Graves(pcarthab IN NUMBER, pqtde OUT NUMBER)
AS
    v_cnh motorista.carthab%type;
    v_qtdeMultas NUMBER;
BEGIN 
    pqtde := 0;
    SELECT carthab INTO v_cnh
    FROM motorista
    WHERE carthab = pcarthab;
    
    SELECT COUNT(*) INTO v_qtdeMultas
    FROM multa
    WHERE carthab = pcarthab;
    
    IF v_qtdeMultas = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('está cnh não possui multas');
    ELSE 
        SELECT COUNT(*) INTO pqtde
        FROM multa
        WHERE carthab = pcarthab AND tipomulta IN ('grave', 'gravíssima') ; 
        DBMS_OUTPUT.PUT_LINE('Multas: ' || pqtde); 
    END IF; 
EXCEPTION 
    WHEN no_data_found THEN 
        pqtde := 0;
        DBMS_OUTPUT.PUT_LINE('motorista nao encontrado'); 
END;
/

SET SERVEROUTPUT ON;

DECLARE
    v_quantidade NUMBER;
BEGIN
    Conta_Multas_Graves(
        pcarthab => 123456789,
        pqtde    => v_quantidade
    );

    DBMS_OUTPUT.PUT_LINE(
        'Quantidade recebida: ' || v_quantidade
    );
END;
/

-- 4 - b

-- 5

CREATE OR REPLACE FUNCTION Fn_PodeDirigir(pcarthab IN NUMBER)
RETURN VARCHAR2
AS
    v_situacao motorista.situacao%TYPE;
BEGIN 
    SELECT situacao INTO v_situacao
    FROM motorista
    WHERE carthab = pcarthab;
    
    IF v_situacao = 'A' THEN 
        DBMS_OUTPUT.PUT_LINE('SIM');
        RETURN 'SIM'; 
    ELSE
        DBMS_OUTPUT.PUT_LINE('NAO');
        RETURN 'NAO';
    END IF;
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('motorista não encontrado');
        RETURN 'NAO ENCONTRADO';
END;
/

SET SERVEROUTPUT ON;

-- Formas de testar:
SELECT Fn_PodeDirigir(123456) FROM dual;
SELECT Fn_PodeDirigir(123450) FROM dual;
SELECT * FROM Motorista;

-- 6.

CREATE OR REPLACE FUNCTION Fn_ValorTotalMultas(pcarthab IN NUMBER) RETURN NUMBER
AS
    v_nome motorista.nomemot%TYPE; 
    v_totalMultas NUMBER; 
BEGIN
    SELECT nomeMot INTO v_nome
    FROM motorista
    WHERE carthab = pcarthab;
    
    SELECT NVL(SUM(valorMulta), 0) INTO v_totalMultas
    FROM multa 
    WHERE carthab = pcarthab; 
    RETURN v_totalMultas;
EXCEPTION 
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('motorista nao encontrado'); 
        RETURN NULL;
END;
/
    
SELECT  
    nomemot, 
    fn_valortotalmultas(carthab) AS valor_total_multas
FROM motorista;Q


SELECT * FROM veiculo;
SELECT * FROM multa;
SELECT * FROM tipomulta;
SELECT * FROM motorista;

-- 7. Acredito que por conta do RETURN, a procedure não retorna lada, ela apenas segue as etapas a fim de atingir algum objeitvo.

-- 8. 
    
    
CREATE OR REPLACE PROCEDURE Resumo_Motorista(pcarthab IN NUMBER, pqtdemultas OUT NUMBER, ppodedirigir OUT VARCHAR2)
AS
    v_cnh motorista.carthab%TYPE; 
    v_situacao motorista.situacao%TYPE;
BEGIN
    pqtdemultas := 0;
    ppodedirigir := 'NAO';
    
    SELECT carthab, situacao INTO v_cnh, v_situacao
    FROM motorista
    WHERE carthab = pcarthab;
    
    SELECT COUNT(*) INTO pqtdemultas
    FROM multa
    WHERE carthab = pcarthab;
    
    IF v_situacao = 'A' THEN 
        ppodedirigir := 'SIM'; 
    ELSE
        DBMS_OUTPUT.PUT_LINE('NAO');
        ppodedirigir := 'NAO';
    END IF;
    
EXCEPTION
    WHEN no_data_found THEN 
        DBMS_OUTPUT.PUT_LINE('Esta cnh nao existe');
END;
/


-- chamar a procedure:


SET SERVEROUTPUT ON;

DECLARE
    v_qtdemultas NUMBER;
    v_podedirigir VARCHAR2(3);
BEGIN
    Resumo_Motorista(
        pcarthab => 123456,
        pqtdemultas => v_qtdemultas,
        ppodedirigir => v_podedirigir
    );

    DBMS_OUTPUT.PUT_LINE('Quantidade de multas: ' || v_qtdemultas);
    DBMS_OUTPUT.PUT_LINE('Pode dirigir: ' || v_podedirigir);
END;
/