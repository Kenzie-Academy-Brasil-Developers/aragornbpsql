-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
    insert into clientes(nome, lealdade)
    values 
    ('Georgia', 0);


-- 2)
    insert into pedidos(status, cliente_id)
    values 
    ('Recebido', 6);


-- 3)
    insert into produtos_pedidos(pedido_id, produto_id)
    values
    (6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8);


-- Leitura

-- 1)
    select pe.id, pe.status, pe.cliente_id, p.id, p.nome, p.tipo, round(p.preco :: numeric, 2), p.pts_de_lealdade 
        from clientes c, pedidos pe, produtos_pedidos pp, produtos p
        where c.id = pe.cliente_id
        and pe.id = pp.pedido_id
        and pp.produto_id = p.id
        and c.nome = 'Georgia';


-- Atualização

-- 1)
    update clientes set lealdade = (select sum(p.pts_de_lealdade)
        from clientes c, pedidos pe, produtos_pedidos pp, produtos p 
        where c.id = pe.cliente_id
        and pe.id = pp.pedido_id
        and pp.produto_id = p.id
        and c.nome = 'Georgia')
        where clientes.id = 6;


-- Deleção
    delete from clientes where clientes.nome = 'Marcelo';
-- 1)


