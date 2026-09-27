-- Criação da tabela de produtos
CREATE TABLE tb_produto (
    codproduto NUMBER(5) PRIMARY KEY,
    descricao VARCHAR2(50) NOT NULL,
    unidade VARCHAR2(5),
    valor_unit NUMBER(6,2),
    qtdestoq NUMBER(5)
);

-- Dados de exemplo para testes (baseados nos exemplos das aulas)
INSERT INTO tb_produto VALUES (1, 'Caneta Azul', 'UN', 2.50, 100);
INSERT INTO tb_produto VALUES (6, 'Caneta', 'CX', 5.00, 30);
INSERT INTO tb_produto VALUES (13, 'Caderno 10 Matérias', 'UN', 18.90, 50);
INSERT INTO tb_produto VALUES (15, 'Lápis Preto HB', 'UN', 1.50, 200);

COMMIT;



CREATE TABLE tb_item_pedido (
    numped NUMBER(5),
    codproduto NUMBER(5),
    quantidade NUMBER(5),
    pco_unit NUMBER(6,2),
    CONSTRAINT fk_item_produto FOREIGN KEY (codproduto) REFERENCES tb_produto(codproduto)
);

-- Inserindo um item associado ao produto 13 para testar a exceção de produto com pedido
INSERT INTO tb_item_pedido VALUES (101, 13, 2, 18.90);
COMMIT;