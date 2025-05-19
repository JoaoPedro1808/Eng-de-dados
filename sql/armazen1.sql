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

-- EX 21
SELECT pr.nomeproduto, mr.nomemarca
FROM produto AS pr, marca AS mr
WHERE pr.idmarca = mr.idmarca;

-- EX 22
SELECT cl.nomecliente, pr.nomeproduto
FROM compras AS cs, cliente AS cl, produto AS pr
WHERE cl.idcliente = cs.idcliente
AND cs.idproduto = pr.idproduto;

SELECT COUNT(*) FROM compras;

-- EX 23
SELECT cl.nomecliente, cl.estado, lj.nomeloja, lj.uf
FROM compras AS cs, cliente AS cl, loja AS lj
WHERE cs.idcliente = cl.idcliente
AND cs.idloja = lj.idloja
AND qtd > '40';

-- EX 24 
SELECT pr.nomeproduto, pr.preco, mr.nomemarca
FROM produto AS pr
JOIN marca AS mr ON pr.idmarca = mr.idmarca;

-- EX 25
SELECT mr.nomemarca, cs.dtcompra, cs.qtd
FROM produto AS pr
JOIN marca AS mr ON pr.idmarca = mr.idmarca
JOIN compras AS cs ON pr.idproduto = cs.idproduto;

-- EX 26
SELECT cl.nomecliente, pr.nomeproduto, cs.qtd
FROM compras AS cs
JOIN produto AS pr ON pr.idproduto = cs.idproduto
JOIN cliente AS cl ON cl.idcliente = cs.idcliente;

INSERT INTO cliente
(idcliente,nomecliente,genero,estadocivil,dtnascimento,cidade,estado)
VALUES
(501, 'Alba', 'F', 'V', '1982/10/25', 'Duque de Caxias','Rio de Janeiro'),
(502, 'Solimar', 'F', 'V', '1972/11/25', 'Niterói','Rio de Janeiro'),
(503, 'Pablo', 'M', 'C', '1999/03/01', 'Nova Iguaçu','Rio de Janeiro'),
(504, 'Solange', 'F', 'S', '1979/06/05', 'Salvador', 'Bahia'),
(505, 'Mário', 'M', 'S', '1985/07/22', 'Bragança Paulista', 'São Paulo');

-- EX 27 
SELECT cl.nomecliente, cs.idcompra
FROM cliente AS cl
LEFT JOIN compras AS cs ON cl.idcliente = cs.idcliente;

INSERT INTO marca (idmarca,nomemarca)
VALUES
(6,'Delícia de Prato'),
(7,'Pajé');

-- EX 28
SELECT mr.nomemarca, pr.nomeproduto
FROM produto AS pr 
RIGHT JOIN marca AS mr ON mr.idmarca = pr.idmarca;

-- EX 29
SELECT cl.nomecliente, mr.nomemarca FROM cliente AS cl
LEFT JOIN compras AS cs ON cl.idcliente = cs.idcliente
LEFT JOIN produto AS pr ON cs.idproduto = pr.idproduto
LEFT JOIN marca AS mr ON pr.idmarca = mr.idmarca

UNION

SELECT cl.nomecliente, mr.nomemarca
FROM cliente AS cl
RIGHT JOIN compras AS cs ON cl.idcliente = cs.idcliente
RIGHT JOIN produto AS pr ON cs.idproduto = pr.idproduto
RIGHT JOIN marca AS mr ON pr.idmarca = mr.idmarca;







