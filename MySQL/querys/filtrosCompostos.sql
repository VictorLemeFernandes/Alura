SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;

SELECT * FROM tbproduto WHERE PRECO_LISTA >= 16.007 AND PRECO_LISTA <= 16.009;

SELECT * FROM tbcliente WHERE IDADE >= 18 AND IDADE <= 22 AND SEXO = 'M';

SELECT * FROM tbcliente WHERE CIDADE = 'RIO DE JANEIRO' OR BAIRRO = 'JARDINS';

SELECT * FROM tbcliente WHERE (IDADE >= 18 AND IDADE <= 22) OR
	(CIDADE = 'RIO DE JANEIRO' OR BAIRRO = 'JARDINS');