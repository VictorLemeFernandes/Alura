USE sucos;

UPDATE tbproduto SET EMBALAGEM = 'Lata',
PRECO_LISTA = 2.47 WHERE PRODUTO = '544931';

UPDATE tbproduto SET EMBALAGEM = 'Garrafa' 
WHERE PRODUTO = '1078680';

SELECT * FROM tbproduto;