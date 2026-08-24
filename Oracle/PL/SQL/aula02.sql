-- Procedure.
-- Estrutura de uma procedure em PL/SQL.

CREATE OR REPLACE PROCEDURE SP_CONFERE_NM_FUNCIONARIO (P_ID_FUNCIONARIO NUMBER,
                                                        P_NOME OUT VARCHAR2) IS
   -- Declaração de variáveis
   v_nome VARCHAR2(50)   employees.first_name%TYPE;
   v_idade NUMBER employees.employee_id%TYPE;
BEGIN

    SELECT first_name
    INTO v_nome
    FROM employees
    WHERE employee_id = SP_CONFERE_NM_FUNCIONARIO;

    IF v_nome <> SP_CONFERE_NM_FUNCIONARIO THEN
        DBMS_OUTPUT.PUT_LINE('Nome do funcionário: ' || v_nome);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Funcionário não encontrado.');
    END IF;

-- >, <, =, <>, !=. =<, =>

END SP_CONFERE_NM_FUNCIONARIO;



BEGIN
   -- Chamada da procedure
   SP_CONFERE_NM_FUNCIONARIO(P_ID_FUNCIONARIO => 100,
                             P_NOME => : 'Lex');
END;

SELECT * FROM employees;