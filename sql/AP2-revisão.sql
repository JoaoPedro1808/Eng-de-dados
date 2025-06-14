USE armazen;
-- ---------------------------------------------------
-- SELECT

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
SELECT nomecliente, estado,estadocivil
FROM cliente;

-- EX 05
SELECT * FROM cliente;

-- --------------------------------------------------------
-- JOIN 

-- EX 24
SELECT pr.nomeproduto, pr.preco, mr.nomemarca
FROM produto AS pr
	JOIN marca AS mr ON mr.idmarca = pr.idmarca
ORDER BY preco DESC;

-- EX 25
SELECT mr.nomemarca, co.dtcompra, co.qtd
FROM marca AS mr
	JOIN produto AS pr ON pr.idmarca = mr.idmarca
    JOIN compras AS co ON co.idproduto = pr.idproduto
ORDER BY qtd DESC;

-- EX 26
SELECT cl.nomecliente, pr.nomeproduto, co.qtd
FROM cliente AS cl
	JOIN compras AS co ON cl.idcliente = co.idcliente
    JOIN produto AS pr ON co.idproduto = pr.idproduto
ORDER BY qtd DESC;

-- -----------------------------------------------------------
-- Funções
SELECT * FROM compras;
SELECT * FROM produto;

-- EX 01
SELECT MAX(preco)
FROM produto;

-- EX 02
SELECT MIN(qtd)
FROM compras;

-- EX 03
SELECT ROUND (AVG(qtd))
FROM compras;

-- EX 04
SELECT COUNT(*)
FROM cliente
WHERE estado = "Rio de Janeiro";

-- EX 05
SELECT ROUND (AVG(preco))
FROM produto;

-- EX 06
SELECT COUNT(qtd) AS qtd_BomPrato
FROM compras
	JOIN produto ON produto.idproduto = compras.idproduto
WHERE idmarca = "1";

-- EX 07
SELECT COUNT(qtd) AS qtd_ValeVerde
FROM compras AS co
	JOIN loja AS lo ON co.idloja = lo.idloja
WHERE nomeloja = "Vale Verde";

-- EX 08
SELECT SUM(qtd) AS qtd_minas
FROM compras AS co
	JOIN loja AS lo ON lo.idloja = co.idloja
WHERE uf = "MG";

-- EX 09
SELECT COUNT(qtd) AS qtd_totalMarcarrão
FROM compras AS co
	JOIN produto AS pr ON pr.idproduto = co.idproduto
WHERE nomeproduto = "Marcarrão";

-- EX 10
SELECT SUM(qtd)
FROM compras;

-- EX 11
SELECT COUNT(idcliente), estado
FROM cliente
GROUP BY estado;

-- EX 12
SELECT COUNT(*), uf
FROM loja
GROUP BY uf;

-- EX 13
SELECT COUNT(*), nomemarca
FROM produto AS pr
	JOIN marca AS mr ON mr.idmarca = pr.idmarca
GROUP BY nomemarca;

-- EX 14
SELECT ROUND (SUM(co.qtd * pr.preco)), mr.nomemarca
FROM compras AS co
	JOIN produto AS pr ON co.idproduto = pr.idproduto
    JOIN marca AS mr ON mr.idmarca = pr.idmarca
GROUP BY nomemarca;

-- ---------------------------------
-- ORDER BY

-- EX 06
SELECT nomecliente, estadocivil
FROM cliente
ORDER BY nomecliente;

-- EX 07 
SELECT nomeproduto, preco
FROM produto
ORDER BY preco DESC;

-- EX 08
SELECT nomecliente, estado, cidade
FROM cliente
ORDER BY estado, cidade;

-- ----------------------------------------------------
-- SUBQUERY

-- EX 24
SELECT nomeproduto, preco FROM produto
WHERE preco IN (
	SELECT MAX(preco) FROM produto
);

-- EX 25
SELECT nomecliente FROM cliente 
WHERE idcliente NOT IN (
	SELECT idcliente FROM compras
);

-- EX 26
SELECT nomeproduto FROM produto
WHERE idproduto NOT IN (
	SELECT idproduto FROM compras
		WHERE YEAR(dtcompra) = "2025"
);