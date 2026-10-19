SELECT pr.nome, pr.categoria, pr.preco
FROM produtos pr
LEFT JOIN itens_pedido i ON i.produto_id = pr.id
WHERE i.id IS NULL;