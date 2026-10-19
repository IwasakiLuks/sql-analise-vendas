DROP VIEW IF EXISTS vw_receita_pedido;
CREATE VIEW vw_receita_pedido AS
SELECT p.id            AS pedido_id,
       p.cliente_id,
       p.data_pedido,
       p.status,
       SUM(i.quantidade * i.preco_unitario) AS total
FROM pedidos p
JOIN itens_pedido i ON i.pedido_id = p.id
WHERE p.status <> 'cancelado'
GROUP BY p.id, p.cliente_id, p.data_pedido, p.status;

DROP VIEW IF EXISTS vw_cliente_360;
CREATE VIEW vw_cliente_360 AS
SELECT c.id,
       c.nome,
       c.cidade,
       COUNT(DISTINCT r.pedido_id)     AS total_pedidos,
       COALESCE(SUM(r.total), 0)       AS total_gasto,
       MAX(r.data_pedido)              AS ultima_compra
FROM clientes c
LEFT JOIN vw_receita_pedido r ON r.cliente_id = c.id
GROUP BY c.id, c.nome, c.cidade;