# Dicionário de dados

## clientes
| coluna | tipo | descrição |
|---|---|---|
| id | INTEGER PK | Identificador |
| nome | TEXT | Nome do cliente |
| email | TEXT UNIQUE | Email |
| cidade | TEXT | Cidade |
| criado_em | DATE | Data de cadastro |

## produtos
| coluna | tipo | descrição |
|---|---|---|
| id | INTEGER PK | Identificador |
| nome | TEXT | Nome do produto |
| categoria | TEXT | Categoria |
| preco | REAL | Preço atual (>= 0) |

## pedidos
| coluna | tipo | descrição |
|---|---|---|
| id | INTEGER PK | Identificador |
| cliente_id | INTEGER FK | Referência a `clientes` |
| data_pedido | DATE | Data do pedido |
| status | TEXT | `pendente` / `pago` / `enviado` / `cancelado` |

## itens_pedido
| coluna | tipo | descrição |
|---|---|---|
| id | INTEGER PK | Identificador |
| pedido_id | INTEGER FK | Referência a `pedidos` |
| produto_id | INTEGER FK | Referência a `produtos` |
| quantidade | INTEGER | > 0 |
| preco_unitario | REAL | Preço no momento da compra (snapshot) |