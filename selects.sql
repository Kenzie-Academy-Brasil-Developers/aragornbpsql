-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
select pe.id, pe.status, pe.cliente_id, p.id, p.nome, p.tipo, round(p.preco :: numeric, 2), p.pts_de_lealdade  
from pedidos pe, produtos p, produtos_pedidos pp
where pp.pedido_id = pe.id
and pp.produto_id = p.id;

-- 2)
select pe.id  from clientes c, pedidos pe, produtos_pedidos pp, produtos p
where c.id = pe.cliente_id
and pe.cliente_id = pp.pedido_id
and pp.produto_id = p.id
and p.nome = 'Fritas';

-- 3)
select c.nome gosto_de_fritas from clientes c, pedidos pe, produtos_pedidos pp, produtos p
where c.id = pe.cliente_id
and pe.cliente_id = pp.pedido_id
and pp.produto_id = p.id
and p.nome = 'Fritas';

-- 4)
select round(sum(p.preco :: numeric), 2) as sum from clientes c, pedidos pe, produtos_pedidos pp, produtos p
where c.id = pe.cliente_id
and pe.id = pp.pedido_id
and pp.produto_id = p.id
and c.nome = 'Laura';

-- 5)
select p.nome, count(prod.id) from produtos p, produtos_pedidos prod where p.id = prod.produto_id group by p.nome;