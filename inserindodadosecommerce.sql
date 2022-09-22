use ecommerce;

show tables;

insert into clients (Fname, Minit, Lname,CPF, Address)
		values  ('Maria', 'M', 'Silva',123456789, 'Rua silva de prata, 29, Carangola - Cidades das Flores'),
				('Matheus'	, 'O', 'Pimental',98765431, 'Rua alameda, 300, Centro - Cidades das Flores'),
                ('Ricardo', 'F', 'Silva',456789123, 'Avenida almeida vinha, 1009, Centro - Cidades das Flores'),
                ('Julia', 'S', 'França',123789456, 'Rua laranjeiras, 861, Centro - Cidades das Flores'),
                ('Roberta', 'G', 'Assis',321987654, 'Avenida Koller, 19, Centro - Cidades das Flores'),
                ('Isabela', 'M', 'Cruz',654987321, 'Rua alameda das flores, 28 , Centro - Cidades das Flores');
                
insert into product (Pname, classification_kids, category, avaliação, size) values
					('Fone de ouvido', false, 'Eletrônico','4',null),
                    ('Barbie Elsa', true, 'Brinquedos','3',null),
                    ('Body Carters', true, 'Vestimenta','5',null),
                    ('Microfone Vedo - Youtuber', False, 'Eletrônico','4',null),
                    ('Sofá retrátil', false, 'Móveis', '3', '3X57X80');
                    
select *from clients;
select*from product;
delete from orders where idOrderClient in (1,2,3,4);
insert into orders (idOrderClient, orderStatus, OrderDescription, sendValue, paymentCash) values
					(1, default, 'compra via aplicativo', null, 1),
                    (2, default, 'compra via aplicativo', 50, 0),
                    (3, 'Confirmado', null, null, 1),
                    (4, default, 'compra via web site', 150, 0);
                    
select *from orders;

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1,3,2,null),
                         (2,3,1,null),
                         (3,4,1, null);

insert into productStorage (storageLocation, quantity) values
							('Rio de Janeiro', 1000),
                            ('Rio de Janeiro', 500),
                            ('São Paulo', 10),
                            ('São Paulo', 100),
                            ('São Paulo', 10),
                            ('Brasilia', 60);
                            
insert into storageLocation (idLproduct, idLstorage, location) values
							(1,2,'RJ'),
                            (2,6,'GO');
                            
 insert into Supplier (SocialName, CNPJ, contact) values                           
                             ('Almeida e filhos', 123456789123456, '21985474'),
                             ('Eletrônicos Silva', 987654321654321, '45617896'),
                             ('Eletrônicos Silva',789456123789456, '78964123');
                             
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
							(1,1,500),
                            (1,2,400),
                            (2,4,633),
                            (3,3,5),
                            (2,5,10);
                            
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
					('Tech eletronics', null, 123456789852456, null, 'Rio de Janeira', 6589412541),
                    ('Botique Durgas', null, null, 789123456,'Rio de Janeiro', 895665323),
                    ('Kids World', null, 456789321741963,null, 'São Paulo', 1198564567);

select *from seller;

insert into productSeller (idPseller, idPproduct, prodQuantity) values
							(1,5,80),
                            (2,4,10);
select *from productSeller;

select count(*) from clients;

select*from clients c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
					(2, default, 'compra via aplicativo', null, 1);
                    
select*from clients c, orders o where c.idClient = idOrderClient;
select count(*) from clients c, orders o where c.idClient = idOrderClient group by idOrder;


select *from clients left outer join orders on idClient = idOrderClient inner join productOrder on idPOorder = idOrder group by idClient;	


select *from product left join productSupplier on Idproduct = idPsproduct; 

select idOrder, idClient, concat(Fname, ' ', Lname) as Nome, OrderStatus from orders left join productOrder on  idOrder = idPOorder inner join clients on idOrderClient = idClient;

select category, count(*) from product group by category;