WITH primeira_compra AS (
    SELECT cliente_id,
           MIN(strftime('%Y-%m', data_pedido)) AS coorte
    FROM vw_receita_pedido
    GROUP BY cliente_id
),
compras AS (
    SELECT DISTINCT r.cliente_id,
           p.coorte,
           strftime('%Y-%m', r.data_pedido) AS mes_compra
    FROM vw_receita_pedido r
    JOIN primeira_compra p ON p.cliente_id = r.cliente_id
),
coorte_base AS (
    SELECT coorte, COUNT(*) AS tamanho
    FROM primeira_compra
    GROUP BY coorte
)
SELECT c.coorte,
       b.tamanho                          AS clientes_coorte,
       c.mes_compra,
       COUNT(DISTINCT c.cliente_id)       AS clientes_ativos,
       ROUND(100.0 * COUNT(DISTINCT c.cliente_id) / b.tamanho, 1) AS pct_retencao
FROM compras c
JOIN coorte_base b ON b.coorte = c.coorte
GROUP BY c.coorte, b.tamanho, c.mes_compra
ORDER BY c.coorte, c.mes_compra;