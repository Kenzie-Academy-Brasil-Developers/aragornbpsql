-- Aqui você deve colocar os códigos SQL referentes à

-- Criação das tabelas

-- Tabela clientes
    create table if not exists clientes(
        id bigserial primary key,
        nome varchar(50) not null,
        lealdade int not null
    );
-- Tabela endereços
    create table if not exists enderecos(
        id bigserial primary key,
        cep varchar(9) not null,
        rua varchar(50) not null,
        numero int not null,
        bairro varchar(50) not null,
        complemento varchar(100),
        cliente_id int unique not null,
        foreign key (cliente_id) references clientes(id) 
        
    );

    alter table enderecos drop column cliente_id;
    alter table enderecos add column cliente_id int unique not null;
    alter table enderecos add constraint cliente_id foreign key (cliente_id) references clientes(id) on delete cascade;

-- Tabela pedidos
    create table if not exists pedidos(
        id bigserial primary key,
        status varchar(50) not null,
        cliente_id int not null,
        foreign key (cliente_id) references clientes(id) on delete cascade
    );

-- Tabela produtos
    create table if not exists produtos(
        id bigserial primary key,
        tipo varchar(30) not null,
        preco float(8) not null,
        pts_de_lealdade int not null
    );

    alter table produtos add column nome varchar(100) unique not null;
-- Tabela produtos_pedidos

    create table if not exists produtos_pedidos(
        id bigserial primary key,
        pedido_id int not null,
        foreign key (pedido_id) references pedidos(id) on delete cascade,
        produto_id int not null,
        foreign key (produto_id) references produtos(id) on delete cascade
    );

