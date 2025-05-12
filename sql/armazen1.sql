CREATE SCHEMA armazen;

USE armazen;

-- EX 01
SELECT nomecliente, genero
FROM cliente;

-- EX 02
SELECT nomeproduto, preco
FROM produto; 

-- EX 03
SELECT idcompra, dtcompra
FROM compras;

-- EX 04 
SELECT nomecliente, cidade, estado
FROM cliente;

-- EX 05 
SELECT c.* FROM cliente AS c;

DESC cliente; -- Uma descrição sobre as colunas e tabelas e suas caracteristicas.

-- EX 06
SELECT nomecliente, estado
FROM cliente
ORDER BY nomecliente ASC;

-- EX 07
SELECT nomeproduto, preco
FROM produto
ORDER BY preco DESC, nomeproduto ASC; -- Condição de desempate.

-- EX 08
SELECT nomecliente
FROM cliente
ORDER BY estado, cidade ASC;

-- EX 09
SELECT DISTINCT estado 
FROM cliente
ORDER BY estado; -- ou tmc pode usra o "1" representando o primeiro item do select distinct.

-- EX 10
SELECT DISTINCT dtcompra
FROM compras
ORDER BY dtcompra;

-- EX 11
SELECT nomeproduto
FROM produto
WHERE preco > 5;

-- EX 12
SELECT nomecliente, estado
FROM cliente
WHERE genero = "F";

-- EX 13
SELECT nomecliente, cidade
FROM cliente
WHERE estado = "Rio de Janeiro";

-- EX 14
SELECT DISTINCT nomecliente, TIMESTAMPDIFF(YEAR, dtnascimento, CURDATE()) AS idade
FROM cliente
WHERE TIMESTAMPDIFF(YEAR, dtnascimento, CURDATE()) > 40
ORDER BY idade DESC;

-- EX 15
SELECT DISTINCT idcliente, YEAR(dtcompra) AS ano
FROM compras
WHERE YEAR(dtcompra) = "2021"
ORDER BY ano;

-- EX 16
SELECT DISTINCT idcliente, YEAR(dtcompra)
FROM compras
WHERE EXTRACT(YEAR FROM dtcompra) = "2020"
ORDER BY idcliente ASC;

-- ou

SELECT DISTINCT idcliente, dtcompra
FROM compras
WHERE EXTRACT(YEAR FROM dtcompra) = "2020"
ORDER BY idcliente ASC;

-- EX 17
SELECT nomecliente
FROM cliente
WHERE nomecliente LIKE "a%";

-- EX 18
SELECT nomecliente
FROM cliente
WHERE nomecliente LIKE "%ana%";

-- EX 19
SELECT nomecliente, estadocivil, estado
FROM cliente
WHERE estado IN ("Rio de Janeiro", "São Paulo", "Minas Gerais", "Espírito Santo")
ORDER BY estado ASC;

SELECT DISTINCT estadocivil FROM cliente;

-- EX 20
SELECT nomecliente,
CASE 
WHEN estadocivil = "D" THEN "Divorciado/a"
WHEN estadocivil = "V" THEN "Viúvo/a"
WHEN estadocivil = "C" THEN "Divorciado/a"
WHEN estadocivil = "S" THEN "Solteiro/a"
ELSE "Não definido"
END as estadocivil
FROM cliente;

	SELECT * FROM produto AS p
INNER JOIN marca AS m
	ON p.idmarca = m.idmarca;
    
SELECT cl.nomecliente, pr.nomeproduto, lo.nomeloja
FROM compras AS co
JOIN cliente AS cl ON co.idcliente = cl.idcliente
JOIN produto AS pr ON co.idproduto = pr.idproduto
JOIN loja AS lo ON co.idloja = lo.idloja;


