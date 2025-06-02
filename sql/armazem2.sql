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

-- EX 24
SELECT p.nomeproduto, p.preco
	FROM produto AS p
WHERE preco IN (
	SELECT DISTINCT MAX(p.preco) 
		FROM produto as p);
    
-- EX 25
SELECT nomecliente
	FROM cliente
WHERE idcliente NOT IN(
SELECT DISTINCT idcliente FROM compras
)
ORDER BY nomecliente; 

-- EX 26
SELECT nomeproduto
	FROM produto
WHERE idproduto NOT IN(
SELECT DISTINCT idproduto 
	FROM compras
WHERE YEAR(dtcompra) = 2025
);

insert into compras (idcompra, idcliente, idproduto, dtcompra, idloja, qtd) values (1001, 177, 1, '2025-06-02', 1, 15);

-- EX 27
CREATE VIEW VW_produto AS 
SELECT p.nomeproduto AS produtos, p.preco AS preco, m.nomemarca AS marca
	FROM produto AS p
		JOIN marca AS m ON p.idmarca = m.idmarca
ORDER BY p.nomeproduto;

SELECT * FROM VW_produto;
	
-- EX 28
CREATE VIEW VW_descricao AS 
SELECT co.idcompra AS idcompra, cl.nomecliente AS cliente, pr.nomeproduto AS produto, mr.nomemarca AS marca, lo.nomeloja AS loja, co.dtcompra AS datanascimento, co.qtd AS quantidade, pr.preco AS preco, SUM(qtd*preco) AS valor_total
	FROM compras AS co
		JOIN cliente AS cl ON cl.idcliente = co.idcliente
        JOIN produto AS pr ON pr.idproduto = co.idproduto
        JOIN marca AS mr ON mr.idmarca = pr.idmarca
        JOIN loja AS lo ON lo.idloja = co.idloja
GROUP BY co.idcompra
ORDER BY co.idcompra;

SELECT * FROM VW_descricao;

-- EX 29
SELECT count(qtd) FROM compras; 

-- EX 30
SELECT SUM(valor_total) FROM VW_descricao;

-- EX 31
SELECT MAX(valor_total) AS maiorcompra, MIN(valor_total) AS menorcompra FROM VW_descricao;

SELECT cliente, valor_total
	FROM VW_descricao 
WHERE valor_total = (
SELECT MAX(valor_total) AS maiorcompra
FROM VW_descricao);

-- EX 32
SELECT ROUND(AVG(valor_total)) AS valor_medio FROM VW_descricao;

-- EX 33
SELECT COUNT(valor_total) AS comprasgrandes
	FROM VW_descricao
WHERE valor_total > (
	SELECT ROUND(AVG(valor_total))
		FROM VW_descricao
);