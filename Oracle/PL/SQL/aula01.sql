-- Estrutura básica de um bloco PL/SQL

DECLARE
   -- Declaração de variáveis
   v_nome VARCHAR2(50)   employees.first_name%TYPE;
   v_idade NUMBER employees.employee_id%TYPE;
BEGIN

    SELECT first_name
    INTO v_nome
    FROM employees
    WHERE employee_id = 100;

    IF v_nome IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Nome do funcionário: ' || v_nome);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Funcionário não encontrado.');
    END IF;

-- >, <, =, <>, !=. =<, =>

END;