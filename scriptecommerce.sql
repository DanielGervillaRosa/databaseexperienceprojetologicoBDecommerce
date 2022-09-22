-- crianção do banco de dados para o cenário de e-commerce 

create database if not exists ecommerce;
use ecommerce;
-- drop database ecommerce;
-- tabela cliente
create table clients(
			idClient int auto_increment primary key,
            Fname varchar(10),
            Minit char(3),
            Lname varchar(20),
            CPF char(11) not null,
            constraint unique_cpf_client unique (CPF),
			Address varchar(100)
            );
alter table clients auto_increment=1;
-- tabela produto
create table product(
			idProduct int auto_increment primary key,
            Pname varchar(50) not null,
			classification_kids bool default false,
            category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
			avaliação float default 0,
            size varchar (10)
            );

create table payment(
			idClient int,
            idPayment int,
            typePayment enum('Boleto','Cartão1','Cartão2'),
            limitAvailable float,
            primary key (idClient, idPayment),
			constraint fk_payment_Idclient foreign key (IdClient) references clients (IdClient)
);

-- tabela pedido
create table orders(
			IdOrder int auto_increment primary key,
            IdOrderClient int,
            OrderStatus enum ('Cancelado','Confirmado','Em processamento') default 'Em processamento',
            orderdescription varchar (255),
            sendValue float default 10,
            paymentCash bool default false,
			constraint fk_orders_client foreign key (IdOrderClient) references clients(IdClient)
					on update cascade
            );
            
-- tabela estoque
create table productStorage (
			idProdStorage int auto_increment primary key,
            storagelocation varchar(255),
            quantity int default 0
		);
-- tabela fornecedor 
create table supplier (
			idSupplier int auto_increment primary key,
            SocialName varchar (255) not null,
            CNPJ char (15) not null,
            contact char(11) not null,
            constraint unique_supplier unique (CNPJ)
);
-- tabela vendedor
create table seller (
			IdSeller int auto_increment primary key,
            SocialName varchar (255) not null,
            AbstName varchar(255),
            CNPJ char (15),
            CPF char(9),
            location varchar(255),
            contact char(11) not null,
            constraint unique_cnpj_seller unique (CNPJ),
            constraint unique_cpf_seller unique (CPF)
);


create table productSeller(
			idPseller int,
            idPproduct int,
            prodQuantity int default 1,
            primary key (idPseller, idPproduct),
            constraint fk_product_seller foreign key (idPseller) references seller (IdSeller),
            constraint fk_product_product foreign key (IdPproduct) references product (IdProduct)
);

create table productOrder (
			idPOproduct int,
            idPOorder int,
			poQuantity int default 1,
            poStatus enum ('Disponível', 'Sem estoque') default 'Disponível',
            primary key (idPOproduct, idPOorder),
            constraint fk_productorder_seller foreign key (idPOproduct) references product (IdProduct),
            constraint fk_productorder_product foreign key (idPOorder) references orders (idOrder)
);

create table storageLocation (
			idLproduct int,
            idLstorage int,
            location varchar(255) not null,
            primary key (idLproduct, idLstorage),
            constraint fk_storage_location_product foreign key (idLproduct) references product (idProduct),
            constraint fk_storage_location_storage foreign key (idLstorage) references productStorage (idProdStorage)
);

create table productSupplier(
			idPsSupplier int,
            idPsProduct int,
            quantity int not null,
            primary key (idPsSupplier, idPsProduct),
            constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier (IdSupplier),
            constraint fk_product_supplier_product foreign key (idPsProduct) references product (idProduct)
);

show tables;

use information_schema;
show tables;
desc referential_constraints;

select * from referential_constraints where constraint_schema = 'ecommerce';