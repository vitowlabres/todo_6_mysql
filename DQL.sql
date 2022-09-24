use Vitrine_Virtual;

# 1. Quais os 3 produtos mais caros?
SELECT 
    *
FROM
    Produto
ORDER BY preco DESC
LIMIT 3;

# 2. Quantas avaliações cada cliente realizou?
SELECT 
    id_cliente, COUNT(id_avaliacao)
FROM
    avaliacao
GROUP BY id_cliente;

# 3. Qual a média das avaliações de cada produto?
SELECT 
    id_produto, AVG(nota)
FROM
    avaliacao
GROUP BY id_produto;

# 4. Qual a data da avaliação mais recente de cada produto?
SELECT 
    id_produto, MAX(data_avaliacao)
FROM
    avaliacao
GROUP BY id_produto;

# 5. Quais as clientes cujo o nome se inicia com Joana?
SELECT 
    nome
FROM
    cliente
WHERE
    nome LIKE 'Joana%';
    
# 6. Qual o produto que recebeu a menor avaliação?
SELECT 
    id_produto, MIN(nota) AS notaMin
FROM
    avaliacao
GROUP BY id_produto
ORDER BY notaMin
LIMIT 1;

# 7. Quais são os produtos cuja a avaliação mais recente é anterior à 30 dias, liste-os como “Avaliação desatualizada”?
SELECT 
    id_produto, MAX(data_avaliacao) AS `Avaliação desatualizada`
FROM
    avaliacao
GROUP BY id_produto
HAVING
`Avaliação desatualizada` < date_sub(CURDATE(), INTERVAL 30 DAY);