SELECT pr.nome,
       pr.categoria,
       SUM(i.quantidade)                     AS unidades,
       ROUND(SUM(i.quantidade * i.preco_unitario), 2) AS receita
FROM itens_pedido i
JOIN produtos pr ON pr.id = i.produto_id
JOIN pedidos p   ON p.id  = i.pedido_id
WHERE p.status <> 'cancelado'
GROUP BY pr.id, pr.nome, pr.categoria
ORDER BY unidades DESC;