-- Exemplo 1: Função que calcula o dobro de um número.

CREATE OR REPLACE FUNCTION calc_dobro( p1 IN NUMBER) RETURN NUMBER
AS
p2 NUMBER;
BEGIN
    p2 := p1 * 2; 
    RETURN p2;
END;

-- Como ativar a função:
-- Insert into medico values (888,'dr. João Marcos',CalcDobro(50));
SELECT codproduto, calc_dobro(valor_unit) from tb_produto;
SELECT * FROM tb_produto;

CREATE OR REPLACE FUNCTION Fn_devolve_descricao(Pcodprod tb_produto.codproduto%TYPE)
RETURN varchar2
AS
Vdesc tb_produto.descricao%TYPE;
BEGIN
    SELECT descricao INTO Vdesc
    FROM tb_produto
    WHERE tb_produto.codproduto = Pcodprod;
    RETURN (Vdesc);
END Fn_devolve_descricao;


-- Para evocar uma função:
-- 1. Forma:
-- Rodar com F5.
variable resultado varchar2(20);
execute :resultado := fn_devolve_descricao (11);
print :resultado