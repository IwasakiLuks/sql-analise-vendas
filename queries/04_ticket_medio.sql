SELECT ROUND(AVG(total), 2) AS ticket_medio_geral,
       ROUND(MIN(total), 2) AS menor_pedido,
       ROUND(MAX(total), 2) AS maior_pedido
FROM vw_receita_pedido;