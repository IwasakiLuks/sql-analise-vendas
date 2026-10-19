WITH ref AS (SELECT MAX(data_pedido) AS hoje FROM pedidos),
base AS (
    SELECT r.cliente_id,
           CAST(julianday((SELECT hoje FROM ref)) - julianday(MAX(r.data_pedido)) AS INTEGER) AS recency,
           COUNT(r.pedido_id) AS frequency,
           SUM(r.total)       AS monetary
    FROM vw_receita_pedido r
    GROUP BY r.cliente_id
),
scores AS (
    SELECT cliente_id, recency, frequency, monetary,
           NTILE(5) OVER (ORDER BY recency ASC)  AS r_score,
           NTILE(5) OVER (ORDER BY frequency DESC) AS f_score,
           NTILE(5) OVER (ORDER BY monetary DESC)  AS m_score
    FROM base
)
SELECT c.nome,
       s.recency  AS dias_desde_ultima,
       s.frequency AS pedidos,
       ROUND(s.monetary, 2) AS total_gasto,
       s.r_score, s.f_score, s.m_score,
       (s.r_score + s.f_score + s.m_score) AS rfm_total,
       CASE
           WHEN s.r_score >= 4 AND s.f_score >= 4 AND s.m_score >= 4 THEN 'Campeão'
           WHEN s.r_score >= 3 AND s.f_score >= 3                    THEN 'Leal'
           WHEN s.r_score <= 2 AND s.f_score >= 3                    THEN 'Em risco'
           WHEN s.r_score <= 2 AND s.f_score <= 2                    THEN 'Perdido'
           ELSE 'Regular'
       END AS segmento
FROM scores s
JOIN clientes c ON c.id = s.cliente_id
ORDER BY rfm_total DESC;