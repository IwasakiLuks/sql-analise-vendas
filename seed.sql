INSERT INTO clientes (nome, email, cidade, criado_em) VALUES
('Ana Souza',       'ana@email.com',       'São Paulo',      '2024-01-15'),
('Bruno Lima',      'bruno@email.com',     'Rio de Janeiro', '2024-02-20'),
('Carla Dias',      'carla@email.com',     'Belo Horizonte', '2024-03-10'),
('Diego Rocha',     'diego@email.com',     'São Paulo',      '2024-04-05'),
('Elisa Martins',   'elisa@email.com',     'Porto Alegre',   '2024-05-12'),
('Felipe Costa',    'felipe@email.com',    'Curitiba',       '2024-06-18'),
('Gabriela Nunes',  'gabriela@email.com',  'Recife',         '2024-07-22'),
('Henrique Alves',  'henrique@email.com',  'São Paulo',      '2024-08-30'),
('Isabela Freitas', 'isabela@email.com',   'Rio de Janeiro', '2024-09-14'),
('João Pereira',    'joao@email.com',      'Belo Horizonte', '2024-10-05');

INSERT INTO produtos (nome, categoria, preco) VALUES
('Teclado Mecânico', 'Periféricos',    350.00),
('Mouse Gamer',      'Periféricos',    180.00),
('Monitor 24"',      'Monitores',      900.00),
('Headset',          'Áudio',          250.00),
('Webcam HD',        'Periféricos',    320.00),
('SSD 1TB',          'Armazenamento',  550.00),
('Cadeira Gamer',    'Móveis',        1200.00),
('Mousepad XL',      'Acessórios',      90.00);

INSERT INTO pedidos (cliente_id, data_pedido, status) VALUES
(1, '2024-01-10', 'pago'),
(2, '2024-01-25', 'pago'),
(3, '2024-02-14', 'enviado'),
(1, '2024-03-05', 'pago'),
(4, '2024-03-22', 'pago'),
(5, '2024-04-18', 'cancelado'),
(2, '2024-05-09', 'pago'),
(6, '2024-05-27', 'pago'),
(3, '2024-06-15', 'pago'),
(7, '2024-07-03', 'pago'),
(1, '2024-07-21', 'pago'),
(8, '2024-08-12', 'enviado'),
(4, '2024-09-08', 'pago'),
(9, '2024-09-25', 'pago'),
(5, '2024-10-11', 'pago'),
(2, '2024-11-02', 'pago'),
(10,'2024-11-19', 'pago'),
(1, '2024-12-07', 'pago'),
(6, '2024-12-20', 'pago'),
(3, '2025-01-08', 'pago'),
(8, '2025-01-23', 'pago'),
(4, '2025-02-05', 'pago'),
(9, '2025-02-18', 'pago'),
(1, '2025-03-04', 'pago'),
(2, '2025-03-15', 'cancelado'),
(10,'2025-03-28', 'pendente'),
(7, '2025-04-10', 'pago'),
(5, '2025-04-22', 'pago'),
(1, '2025-05-06', 'pago'),
(3, '2025-05-20', 'pago');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
-- 1
(1, 1, 1, 350.00), (1, 2, 1, 180.00),
-- 2
(2, 3, 1, 900.00),
-- 3
(3, 4, 2, 250.00),
-- 4
(4, 1, 2, 350.00), (4, 8, 1, 90.00),
-- 5
(5, 6, 1, 550.00),
-- 6 (cancelado)
(6, 7, 1, 1200.00),
-- 7
(7, 2, 1, 180.00), (7, 8, 2, 90.00),
-- 8
(8, 5, 1, 320.00),
-- 9
(9, 3, 1, 900.00), (9, 4, 1, 250.00),
-- 10
(10, 1, 1, 350.00),
-- 11
(11, 6, 1, 550.00), (11, 2, 1, 180.00),
-- 12
(12, 4, 1, 250.00),
-- 13
(13, 3, 1, 900.00),
-- 14
(14, 5, 1, 320.00), (14, 8, 1, 90.00),
-- 15
(15, 1, 1, 350.00), (15, 2, 1, 180.00),
-- 16
(16, 6, 2, 550.00),
-- 17
(17, 7, 1, 1200.00),
-- 18
(18, 3, 1, 900.00), (18, 4, 1, 250.00),
-- 19
(19, 1, 1, 350.00),
-- 20
(20, 2, 2, 180.00), (20, 8, 1, 90.00),
-- 21
(21, 5, 1, 320.00),
-- 22
(22, 6, 1, 550.00),
-- 23
(23, 3, 1, 900.00),
-- 24
(24, 7, 1, 1200.00), (24, 1, 1, 350.00),
-- 25 (cancelado)
(25, 4, 1, 250.00),
-- 26 (pendente)
(26, 2, 1, 180.00),
-- 27
(27, 6, 1, 550.00),
-- 28
(28, 4, 1, 250.00), (28, 8, 2, 90.00),
-- 29
(29, 3, 1, 900.00),
-- 30
(30, 1, 1, 350.00), (30, 5, 1, 320.00);