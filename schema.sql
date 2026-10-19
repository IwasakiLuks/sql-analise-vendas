PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    nome       TEXT    NOT NULL,
    email      TEXT    NOT NULL UNIQUE,
    cidade     TEXT    NOT NULL,
    criado_em  DATE    NOT NULL DEFAULT (DATE('now'))
);

CREATE TABLE produtos (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    nome       TEXT    NOT NULL,
    categoria  TEXT    NOT NULL,
    preco      REAL    NOT NULL CHECK (preco >= 0)
);

CREATE TABLE pedidos (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id   INTEGER NOT NULL,
    data_pedido  DATE    NOT NULL,
    status       TEXT    NOT NULL DEFAULT 'pendente'
                 CHECK (status IN ('pendente','pago','enviado','cancelado')),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE itens_pedido (
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    pedido_id      INTEGER NOT NULL,
    produto_id     INTEGER NOT NULL,
    quantidade     INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario REAL    NOT NULL CHECK (preco_unitario >= 0),
    FOREIGN KEY (pedido_id)  REFERENCES pedidos(id)  ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

CREATE INDEX idx_pedidos_cliente  ON pedidos(cliente_id);
CREATE INDEX idx_pedidos_data     ON pedidos(data_pedido);
CREATE INDEX idx_pedidos_status   ON pedidos(status);
CREATE INDEX idx_itens_pedido     ON itens_pedido(pedido_id);
CREATE INDEX idx_itens_produto    ON itens_pedido(produto_id);