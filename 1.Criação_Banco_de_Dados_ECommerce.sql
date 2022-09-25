-- Criação do Banco de Dados para o cenário E-Commerce
-- drop database ECommerce;
create database ECommerce2;
use ECommerce2;

-- criar tabela cliente 
create table client(
		idClient int auto_increment primary key, 
        Fname varchar(10),
		Minit char(3),
		Lname varchar(20),
        Address varchar (255),
        TypeAccount enum('Pessoa Fisíca (CPF)','Pessoa Jurídica (CNPJ)')
		
);
alter table client auto_increment=1;
 desc client;

-- desc client;

-- criar tabela produto
-- Size = dimensão do produto
create table product(
		idProduct int auto_increment primary key, 
		Pname varchar(45) not null,
		Classification_kids bool,
		Category enum ('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis'), 
		Address varchar (30),
        Avaliação float default 0 ,
        Size varchar (10)
);  
 
 alter table product auto_increment=1;
 
-- criar tabela pagamento
-- para ser continuado no desafio: terminar de implementar a tabela e criar a conexão com as tabelas necessárias
-- além disso reflita essa modificação no diagrama esquema relacional
-- criar constraint relacionada ao pagamento

create table payments(
		idPayment int,
		idPayClient int,
        TypePayment enum ('Boleto','Cartão','Dois Catões') default 'Boleto',
        LimitAvailable float,
        primary key ( idPayment),
        constraint fk_payment_client foreign key (idPayClient) references client(idClient)
);
desc payments;

-- criar tabela pedido
create table orders(
		idOrder int auto_increment primary key, 
		idOrderClient int,
		orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
        orderDescription varchar(255),
        sendValue float default 10,
        paymentCash bool default false,
        constraint fk_ordes_client foreign key (idOrderClient) references client(idClient)
			on update cascade
);

alter table orders auto_increment=1;
-- desc orders;

-- criar tabela estoque
create table productStorage(
		idProdStorage int auto_increment primary key, 
		storagelocation varchar(255),
		quantity int default 0
		
);
-- criar tabela fornecedor
create table supplier(
		idSupplier int auto_increment primary key, 
		SocialName varchar(255) not null,
		CNPJ char (15) not null,
        ContactNumber char (11) not null,
        constraint unique_supplier unique (CNPJ)
);

alter table supplier auto_increment=1;
-- desc supplier;


-- criar tabela vendedor   
create table seller(
		idSeller int auto_increment primary key, 
		SocialName varchar(255) not null,
        AbstName varchar(255),
		CNPJ char (15),
        CPF char (9),
        Location varchar (255),
        ContactNumber char (11) not null,
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment=1;

-- criar tabela Produto/vendedor
create table produtcSeller(
		idPseller int, 
		idPproduct int,
		prodQuantity int default 1,
        primary key (idPseller, idPproduct),
        constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
        constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);
desc produtcSeller;


-- criar tabela Produto/Ordem de Serviço
create table productOrder(
		idPOproduct int, 
		idPOorder int,
		poQuantity int default 1,
        poStatus enum ('Disponível', 'Sem estoque') default 'Disponível',
        primary key (idPOproduct, idPOorder),
        constraint fk_productorder_seller foreign key (idPOproduct) references product (idProduct),
        constraint fk_productorder_product foreign key (idPOorder) references orders (idOrder)
);
desc productOrder;


-- criar tabela Produto em Estoque
create table storageLocation(
		idLproduct int, 
		idLstorage int,
		Location varchar (255) not null,
        primary key (idLproduct, idLstorage),
        constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
        constraint fk_storage_location_storage_ foreign key (idLstorage) references productStorage (idProdStorage)
);

-- criar tabela Produto / Fornecedor
create table productSupplier(
		idPsSupplier int, 
		idPsProduct int,
		quantity int not null,
        primary key (idPsSupplier, idPsProduct),
        constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier (idSupplier),
        constraint fk_product_supplier_product foreign key (idPsProduct) references product (idProduct)
);


desc  productSupplier;

show tables;

show databases;
use information_schema;
show tables;
desc referential_CONSTRAINTS;
select * from referential_CONSTRAINTS where CONSTRAINT_SCHEMA = 'ecommerce';