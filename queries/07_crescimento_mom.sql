WITH mensal AS (
    SELECT strftime('%Y-%m', data_pedido) AS mes,
           SUM(total)                     AS receita
    FROM vw_receita_pedido
    GROUP BY mes
)
SELECT mes,
       ROUND(receita, 2)                                          AS receita,
       ROUND(LAG(receita) OVER (ORDER BY mes), 2)                 AS receita_mes_anterior,
       ROUND(100.0 * (receita - LAG(receita) OVER (ORDER BY mes))
             / NULLIF(LAG(receita) OVER (ORDER BY mes), 0), 1)    AS cresc_pct
FROM mensal
ORDER BY mes;