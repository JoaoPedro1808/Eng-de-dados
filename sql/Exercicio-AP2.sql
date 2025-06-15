USE armazen;

-- EX 01
SELECT cl.nomecliente, cl.cidade FROM cliente AS cl
	JOIN compras AS co ON co.idcliente = cl.idcliente
WHERE co.idproduto IN (
SELECT pr.idproduto FROM produto AS pr
	WHERE pr.nomeproduto = "Óleo"
);

-- EX 02
SELECT cl.nomecliente FROM cliente AS cl
WHERE cl.idcliente NOT IN(
	SELECT co.idcliente FROM compras AS co
		JOIN cliente AS cl ON cl.idcliente = co.idcliente
        JOIN loja AS lo ON lo.idloja = co.idloja
	WHERE lo.nomeloja = "Vale Verde"
);

-- EX 03
SELECT nomeproduto, ROUND(AVG(preco)) FROM produto
GROUP BY nomeproduto;

-- EX 04
SELECT pr.nomeproduto, COUNT(qtd) FROM produto AS pr
	JOIN compras AS co ON co.idproduto = pr.idproduto
GROUP BY pr.nomeproduto;

-- EX 05
SELECT pr.nomeproduto, COUNT(qtd) AS quanti
FROM produto AS pr
	JOIN compras AS co ON co.idproduto = pr.idproduto
GROUP BY pr.nomeproduto
    HAVING quanti > "100";
    
-- EX 06
SELECT pr.nomeproduto, mr.nomemarca 
FROM produto AS pr
	LEFT JOIN marca AS mr ON pr.idmarca = mr.idmarca
ORDER BY mr.nomemarca;

-- EX 07
SELECT pr.nomeproduto, ROUND(SUM((co.qtd*pr.preco))) AS faturamento
FROM produto AS pr
	JOIN compras AS co ON co.idproduto = pr.idproduto
GROUP BY nomeproduto
ORDER BY faturamento;