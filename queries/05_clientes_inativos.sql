WITH ref AS (SELECT MAX(data_pedido) AS hoje FROM pedidos)
SELECT c.nome,
       c.email,
       MAX(r.data_pedido) AS ultima_compra,
       CAST(julianday((SELECT hoje FROM ref)) - julianday(MAX(r.data_pedido)) AS INTEGER) AS dias_inativo
FROM clientes c
LEFT JOIN vw_receita_pedido r ON r.cliente_id = c.id
GROUP BY c.id, c.nome, c.email
HAVING ultima_compra IS NULL
    OR dias_inativo > 90
ORDER BY dias_inativo DESC NULLS FIRST;