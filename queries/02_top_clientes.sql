SELECT nome,
       cidade,
       total_pedidos,
       ROUND(total_gasto, 2) AS total_gasto
FROM vw_cliente_360
WHERE total_pedidos > 0
ORDER BY total_gasto DESC
LIMIT 5;