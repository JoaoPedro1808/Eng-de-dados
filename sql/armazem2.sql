USE armazen;

-- EX 01
SELECT MAX(preco) FROM produto;

-- EX 02
SELECT MIN(qtd) FROM compras;

-- EX 03
SELECT ROUND (AVG(qtd)) FROM compras;

-- EX 04
SELECT estado, COUNT(*) FROM cliente
	WHERE estado = 'Rio de Janeiro';

-- EX 05
SELECT ROUND (AVG(preco)) FROM produto;

-- EX 06
SELECT nomemarca, COUNT(co.qtd) AS qtdcompras 
FROM compras AS co
JOIN produto AS pr ON pr.idproduto = co.idproduto
JOIN marca AS mr ON mr.idmarca = pr.idmarca
WHERE nomemarca = 'Bom Prato';

-- EX 07
SELECT nomeloja, COUNT(co.qtd) AS qtdcompras
FROM compras AS co
JOIN loja AS lo ON co.idloja = lo.idloja
WHERE nomeloja = 'Vale Verde';

-- EX 08
SELECT uf, SUM(qtd) AS sumqtdcompras
FROM compras AS pr
JOIN loja AS lo ON pr.idloja = lo.idloja
WHERE uf = 'MG';

-- EX 09
UPDATE produto SET nomeproduto = 'Macarrão'
WHERE idproduto = 5;

SELECT nomeproduto, SUM(qtd) AS sumqtdcompras
FROM compras AS co
JOIN produto AS pr ON pr.idproduto = co.idproduto
WHERE nomeproduto = 'Macarrão';

-- EX 10
SELECT COUNT(qtd) FROM compras;

-- EX 11
SELECT estado, COUNT(*) as qtdcli
	FROM cliente
GROUP BY estado;

-- EX 12
SELECT uf, COUNT(*) as qtdlo
	FROM loja
GROUP BY uf;

-- EX 13
SELECT nomemarca, COUNT(*) as qtdpr
	FROM produto AS pr
    JOIN marca AS mr ON pr.idmarca = mr.idmarca
GROUP BY nomemarca;

-- EX 14
SELECT nomemarca, SUM(pr.preco*co.qtd) AS valortotal
	FROM compras AS co
		JOIN produto AS pr ON pr.idproduto = co.idproduto
		JOIN marca AS mr ON mr.idmarca = pr.idmarca
GROUP BY nomemarca;

-- EX 15
SELECT nomeproduto, ROUND(AVG(co.qtd)) AS vendasproduto
	FROM compras AS co
		JOIN produto AS pr ON pr.idproduto = co.idproduto
GROUP BY nomeproduto
ORDER BY vendasproduto DESC;

-- EX 16
SELECT nomeloja, SUM(pr.preco*co.qtd) AS faturamento
	FROM compras AS co
		JOIN loja AS lo ON lo.idloja = co.idloja
        JOIN produto AS pr ON pr.idproduto = co.idproduto
GROUP BY nomeloja;

-- EX 17
SELECT nomecliente, COUNT(co.qtd) AS numprodutos
	FROM compras AS co
		JOIN cliente AS cl ON co.idcliente = cl.idcliente
GROUP BY nomecliente;

-- EX 18
SELECT cidade, COUNT(cl.cidade) AS clienteporcidade
	FROM cliente AS cl
GROUP BY cidade
ORDER BY clienteporcidade DESC LIMIT 5;

-- EX 19
SELECT nomeproduto, SUM(co.qtd) AS produtovendidos
	FROM compras AS co
		JOIN produto AS pr ON pr.idproduto = co.idproduto
GROUP BY nomeproduto
ORDER BY produtovendidos DESC;

-- EX 20
SELECT nomecliente, SUM(pr.preco*co.qtd) AS gastos
	FROM cliente AS cl
		JOIN compras AS co ON co.idcliente = cl.idcliente
        JOIN produto AS pr ON pr.idproduto = co.idproduto
GROUP BY nomecliente
ORDER BY gastos DESC LIMIT 5;

-- EX 21
SELECT estado, COUNT(cl.estado) AS clientesporestado
	FROM cliente AS cl
GROUP BY estado
	HAVING clientesporestado > 50
ORDER BY clientesporestado DESC;
    
-- EX 22
SELECT nomemarca, SUM(pr.preco*co.qtd) AS faturamento
	FROM compras AS co
		JOIN produto AS pr ON co.idproduto = pr.idproduto
        JOIN marca AS mr On mr.idmarca = pr.idmarca
GROUP BY nomemarca
	HAVING faturamento > 25000
ORDER BY faturamento DESC;

-- EX 23
SELECT nomecliente, COUNT(co.qtd) AS quantidade
	FROM cliente AS cl
		JOIN compras AS co ON co.idcliente = cl.idcliente
GROUP BY nomecliente
	HAVING quantidade < 5;
