INSERT INTO tabela_de_vendedores(
	MATRICULA,
    NOME,
    PERCENTUAL_COMISSAO
) VALUES('00235', 'Márcio Almeida Silva', 0.08);

INSERT INTO tabela_de_vendedores(
	MATRICULA,
    NOME,
    PERCENTUAL_COMISSAO
) VALUES('00236', 'Cláudia Morais', 0.08);

SELECT * FROM tabela_de_vendedores;

UPDATE tabela_de_vendedores SET PERCENTUAL_COMISSAO = 0.10
WHERE MATRICULA = '00233';

UPDATE tabela_de_vendedores SET PERCENTUAL_COMISSAO = 0.11
WHERE MATRICULA = '00236';

UPDATE tabela_de_vendedores SET NOME = 'José Geraldo da Fonseca Junior'
WHERE MATRICULA = '00233';

DELETE FROM tabela_de_vendedores WHERE MATRICULA = '00233';

SELECT * FROM tabela_de_vendedores;

ALTER TABLE tabela_de_vendedores ADD PRIMARY KEY (MATRICULA);
ALTER TABLE tabela_de_vendedores ADD COLUMN (DATA_ADMISSAO DATE);
ALTER TABLE tabela_de_vendedores ADD COLUMN (DE_FERIAS BIT);

DELETE FROM tabela_de_vendedores WHERE MATRICULA = '00235';
DELETE FROM tabela_de_vendedores WHERE MATRICULA = '00236';

INSERT INTO tabela_de_vendedores (
	MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS
) VALUES (
	'00235', 'Márcio Almeida Silva', 0.08, '2014-08-15', 0
);

INSERT INTO tabela_de_vendedores (
	MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS
) VALUES (
	'00236', 'Cláudia Morais', 0.08, '2013-09-17', 1
);

INSERT INTO tabela_de_vendedores (
	MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS
) VALUES (
	'00237', 'Roberta Martins', 0.11, '2017-03-18', 1
);

INSERT INTO tabela_de_vendedores (
	MATRICULA, NOME, PERCENTUAL_COMISSAO, DATA_ADMISSAO, DE_FERIAS
) VALUES (
	'00238', 'Péricles Alves', 0.11, '2016-08-21', 0
);

SELECT NOME, MATRICULA FROM tabela_de_vendedores;

SELECT * FROM tabela_de_vendedores WHERE NOME = 'CLAUDIA MORAIS';

select * from tabela_de_vendedores where PERCENTUAL_COMISSAO > 0.1;

SELECT * FROM tabela_de_vendedores WHERE YEAR(DATA_ADMISSAO) >= '2016';

SELECT * FROM tabela_de_vendedores WHERE (DE_FERIAS = 1)
	AND (YEAR(DATA_ADMISSAO) < 2016);