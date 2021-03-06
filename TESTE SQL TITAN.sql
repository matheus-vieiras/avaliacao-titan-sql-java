-- Teste de SQL

-- dele??o das tabelas
DROP TABLE T_PRODUTO CASCADE CONSTRAINTS;
DROP TABLE T_ESTOQUE CASCADE CONSTRAINTS;
DROP TABLE T_LOJA CASCADE CONSTRAINTS;

-- CRIACAO DAS TABELAS:

CREATE TABLE T_PRODUTO (
    cod_prod    NUMBER (8) NOT NULL,
    loj_prod    NUMBER (8) NOT NULL,
    desc_prod   VARCHAR(40) NOT NULL,
    dt_inclu_prod DATE      NOT NULL,
    preco_prod  NUMBER(8,3) NOT NULL
);

ALTER TABLE t_produto ADD CONSTRAINT t_produto_pk PRIMARY KEY ( cod_prod );

CREATE TABLE T_ESTOQUE (
    cd_estoque  NUMBER (8) NOT NULL, 
    cod_prod    NUMBER (8) NOT NULL,
    loj_prod    NUMBER (8) NOT NULL,
    qtd_prod    NUMBER (15,3) NOT NULL
);
SELECT * FROM T_ESTOQUE;
INSERT INTO T_ESTOQUE VALUES (1, 200, 1, 100);
INSERT INTO T_ESTOQUE VALUES (2, 210, 2, 15);
INSERT INTO T_ESTOQUE VALUES (3, 220, 1, 30);


ALTER TABLE t_estoque ADD CONSTRAINT t_estoque_pk PRIMARY KEY ( cd_estoque );

CREATE TABLE T_LOJA (
    loj_prod    NUMBER (8)  NOT NULL,
    desc_loj    VARCHAR (40)    NOT NULL
);

ALTER TABLE t_loja ADD CONSTRAINT t_loja_pk PRIMARY KEY ( loj_prod );


-- TESTE 1:

INSERT INTO T_PRODUTO VALUES (
    170,
    2,
    'LEITE CONDESADO MOCOCA',
    TO_DATE ('2010/12/31','YYYY/MM/DD'),
    45.40

);

-- INSERINDO MAIS VALORES NA T_PRODUTO
INSERT INTO T_PRODUTO VALUES (150, 2, 'ARROZ', TO_DATE ('2012/11/30','YYYY/MM/DD'), 20.40);
INSERT INTO T_PRODUTO VALUES (160, 1, 'FEIJAO', TO_DATE ('2011/09/05','YYYY/MM/DD'), 30.20);
INSERT INTO T_PRODUTO VALUES (180, 2, 'MOLHO DE TOMATE', TO_DATE ('2010/10/20','YYYY/MM/DD'), 5.40);
INSERT INTO T_PRODUTO VALUES (190, 1, 'MACARRAO', TO_DATE ('2013/07/01','YYYY/MM/DD'), 12.10);
INSERT INTO T_PRODUTO VALUES (200, 1, 'LIMAO', TO_DATE ('2015/01/21','YYYY/MM/DD'), 2.10);
INSERT INTO T_PRODUTO VALUES (210, 2, 'PICANHA', TO_DATE ('2020/11/03','YYYY/MM/DD'), 102.10);

-- TESTE 2:

UPDATE T_PRODUTO
SET preco_prod = 95.40
WHERE cod_prod = 170;

-- TESTE 3:

SELECT * FROM T_PRODUTO WHERE loj_prod in (1,2);


-- TESTE 4:

SELECT * FROM T_PRODUTO
WHERE dt_inclu_prod = (SELECT MAX(dt_inclu_prod) FROM T_PRODUTO);

SELECT * FROM T_PRODUTO
WHERE dt_inclu_prod = (SELECT MIN(dt_inclu_prod) FROM T_PRODUTO);


-- TESTE 5:

SELECT COUNT(*) FROM T_PRODUTO;

-- TESTE 6:

SELECT * FROM T_PRODUTO WHERE desc_prod LIKE 'L%';

-- TESTE 7:

SELECT loj_prod, SUM(preco_prod) AS total FROM T_PRODUTO GROUP BY loj_prod;

-- TESTE 8:

SELECT * FROM T_PRODUTO WHERE preco_prod > 100.00;

-- TESTE 9:

SELECT T_PRODUTO.cod_loj,
       T_PRODUTO.desc_loj,
       T_PRODUTO.cod_prod,
       T_PRODUTO.desc_prod,
       T_PRODUTO.preco_prod,
       T_ESTOQUE.qtd_prod
FROM T_PRODUTO, T_ESTOQUE 
WHERE T_PRODUTO.cod_prod = T_ESTOQUE.loj_prod;
        
-- TESTE 10: 

SELECT P.cod_prod  "CODIGO PRODUTO",
       P.loj_prod  "Produto Loja",
       P.desc_prod "Descri??o do produto",
       P.dt_inclu_prod "Data produto",
       P.preco_prod "Preco Produto"
FROM T_PRODUTO P, T_ESTOQUE I 
WHERE P.cod_prod = I.cod_prod (+) AND I.cod_prod IS NULL;

-- TESTE 11:

SELECT F.cod_prod  "Codigo produto",
       I.cd_estoque "Codigo estoque",
       I.cod_prod "Codigo produto no estoque",
       I.loj_prod "Estoque produto loja",
       I.qtd_prod "Quantidade Estoque"
FROM T_ESTOQUE I RIGHT OUTER JOIN
     T_PRODUTO F ON ( F.cod_prod = I.cod_prod )
     WHERE I.cod_prod IS NULL;