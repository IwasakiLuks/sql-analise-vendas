SELECT strftime('%Y-%m', data_pedido) AS mes,
       COUNT(*)                       AS pedidos,
       ROUND(SUM(total), 2)           AS receita
FROM vw_receita_pedido
GROUP BY mes
ORDER BY mes;