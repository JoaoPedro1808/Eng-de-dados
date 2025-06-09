USE armazen;

SELECT DISTINCT * FROM loja; 

-- EX 01
SELECT * FROM 
(
SELECT estado FROM cliente
UNION 
SELECT CASE 
		WHEN uf = 'RJ' THEN 'Rio de Janeiro'
        WHEN uf = 'MG' THEN 'Minas Gerais'
        WHEN uf = 'PA' THEN 'Paraiba'
        WHEN uf = 'GO' THEN 'Goiás'
        WHEN uf = 'RS' THEN 'Rio Grande do Sul'
        WHEN uf = 'AM' THEN 'Amazonas'
        WHEN uf = 'PE' THEN 'Pernambuco'
        WHEN uf = 'CE' THEN 'Ceará'
        END AS estado
FROM loja
)AS r
ORDER BY estado;

-- EX 02
SELECT * FROM
(
SELECT estado FROM cliente
	WHERE genero = "F" 
    AND idcliente NOT IN (
    SELECT idcliente
		FROM compras )
UNION ALL
SELECT CASE 
		WHEN uf = 'RJ' THEN 'Rio de Janeiro'
        WHEN uf = 'MG' THEN 'Minas Gerais'
        WHEN uf = 'PA' THEN 'Paraiba'
        WHEN uf = 'GO' THEN 'Goiás'
        WHEN uf = 'RS' THEN 'Rio Grande do Sul'
        WHEN uf = 'AM' THEN 'Amazonas'
        WHEN uf = 'PE' THEN 'Pernambuco'
        WHEN uf = 'CE' THEN 'Ceará'
        END AS estado
FROM loja
) AS s
ORDER BY estado;

-- EX 03 
SELECT DISTINCT estado FROM cliente
WHERE estado IN (
SELECT DISTINCT CASE 
		WHEN uf = 'RJ' THEN 'Rio de Janeiro'
        WHEN uf = 'MG' THEN 'Minas Gerais'
        WHEN uf = 'PA' THEN 'Paraiba'
        WHEN uf = 'GO' THEN 'Goiás'
        WHEN uf = 'RS' THEN 'Rio Grande do Sul'
        WHEN uf = 'AM' THEN 'Amazonas'
        WHEN uf = 'PE' THEN 'Pernambuco'
        WHEN uf = 'CE' THEN 'Ceará'
        END AS estado
FROM loja
);

-- EX 04
SELECT nomecliente, estado FROM cliente
WHERE estado IN (
'Rio de Janeiro', 'São Paulo', 'Minas Gerais'
) AND idcliente IN (
    SELECT idcliente
		FROM compras
);

-- EX 05
SELECT nomemarca FROM marca
	WHERE idmarca NOT IN (
    SELECT idmarca FROM produto
    );
    
-- EX 06
SELECT nomecliente FROM cliente
	WHERE genero = "F" 
    AND idcliente NOT IN (
    SELECT idcliente FROM compras
    );




