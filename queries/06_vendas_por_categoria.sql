SELECT pr.categoria,
       SUM(i.quantidade)                              AS unidades,
       ROUND(SUM(i.quantidade * i.preco_unitario), 2) AS receita,
       ROUND(100.0 * SUM(i.quantidade * i.preco_unitario) /
             (SELECT SUM(quantidade * preco_unitario) FROM itens_pedido), 1) AS pct_receita
FROM itens_pedido i
JOIN produtos pr ON pr.id = i.produto_id
JOIN pedidos p   ON p.id  = i.pedido_id
WHERE p.status <> 'cancelado'
GROUP BY pr.categoria
ORDER BY receita DESC;