-- inserção de dados e queries
use ECommerce2;

show tables;

-- idClient, Fname, Minit, Lname, CPF, Address
insert into Client (Fname, Minit, Lname, CPF, Address)
		values('Maria', 'M','Silva',123456789,'Rua silva de prata 29, Carangola - Cidade das Flores'),
			  ('Matheus', 'O','Pimentel',987654321,'Rua Almeida 289, Centro - Cidade das Flores'),
			  ('Ricardo', 'F','Silva',45678913,'Avenida Alameda Vinha 1009, Centro - Cidade das Flores'),
			  ('Julia', 'S','França',789123456,'Rua Laranjeiras 861, Centro - Cidade das Flores'),
			  ('Roberta', 'G','Assis',98745631,'Avenida de Koller 19, Centro - Cidade das Flores'),
			  ('Isabela', 'M','Cruz',654789123,'Rua Alameda das flores 28, Centro - Cidade das Flores');
select * from Client;
              
-- idProduct, Pname, Classification_kids boolean, Category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), Avaliação, Size
insert into product (Pname, Classification_kids, Category, Avaliação, Size) values
							('Fone de ouvido', false,'Eletrônico', '4', null),
                            ('Barbie Elsa', True, 'Brinquedos', '3', null),
                            ('Body Carters', True, 'Vestimenta', '5', null),
                            ('Microfone vedo - Youtuber', False, 'Eletrônico', '4', null),
                            ('Sofá Retrátil', False,'Móveis', '3', '3x57x80'),
                            ('Farinha de arroz', False, 'Alimentos', '2', null),
                            ('Fire Stick Amazon', False, 'Eletrônico', '3', null);
select * from product;

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
delete from orders where idOrderClient in (1, 2, 3, 4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
							 (1, default, 'compra via aplicativo', null, 1),
                             (2, default, 'compra via aplicativo', 50, 0),
                             (3, 'confirmado', null, null, 1),
                             (4, default, 'compra via web site', 150, 0);
select  * from orders;

-- idPOproduct, idPOorder, poQuantity, poStatus
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (1, 1, 2, null),
                         (2, 1, 1, null),
                         (3, 2, 1, null);
                         
-- storageLocation, quantity      
insert into productStorage (storageLocation, quantity) values
						 ('Rio de Janeiro', 1000),
                         ('Rio de Janeiro', 500),
                         ('São Paulo', 10),
                         ('São Paulo', 100),
                         ('São Paulo', 10),
                         ('Brasilia', 60);
                         
-- idLproduct, idLstorage, Location
insert into storageLocation (idLproduct, idLstorage, Location) values
							(1, 2, 'RJ'),
                            (2, 6, 'GO');

-- idSupplier, SocialName, CNPJ, ContactNumber
insert into supplier (SocialName, CNPJ, ContactNumber) values
						 ('Almeida e Filhos', 123456789123456, '21985474'),
						 ('Eletronicos Silva', 854519649143457, '21985484'),
						 ('Eletronicos Valma', 934567893934695, '21975474');
select * from supplier;

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
							(1, 1, 500),
                            (1, 2, 400),
                            (2, 4, 633),
                            (3, 3, 5),
                            (2, 5, 10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, Location, ContactNumber
insert into seller (SocialName, AbstName, CNPJ, CPF, Location, ContactNumber) values
					('Tech Eletronics', null, 123456789456321, null, 'Rio de janeiro', 219946287),
                    ('Botique Durgas', null, null, 123456783, 'Rio de janeiro', 219567895),
                    ('Kids Word', null, 456789123654485, null, 'São Paulo', 1198657484);
select * from seller;

-- idPseller, idPproduct, prodQuantity
insert into produtcSeller (idPseller, idPproduct, prodQuantity) values
						  (1, 6, 80),
						  (2, 7, 10);
                          
select * from produtcSeller;

select count(*) from client;

select * from client c, orders o where c.idClient = idOrderClient;

select Fname, Lname, idOrder, orderStatus from client c, orders o where c.idClient = idOrderClient; 
select concat(Fname, ' ',Lname) as Client, idOrder as Request, orderStatus as Status from client c, orders o where c.idClient = idOrderClient; 

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
							 (2, default, 'compra via aplicativo', null, 1);
				
select count(*) from client c, orders o
			where c.idClient = idOrderClient;
 
select * from client left outer join orders ON idClient = idOrderClient;

select * from productOrder;

-- Recuperação de pedido com produto associado
select * from client c 
					inner join orders o ON c.idClient = o.idOrderClient
					inner join productOrder p on p.idPOorder = o.idOrder
		group by idClient;
                    
select * from client left outer join orders ON idClient = idOrderClient
					inner join productOrder on idPOorder = idOrder;
                    
-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_orders from client c 
					inner join orders o ON c.idClient = o.idOrderClient
					inner join productOrder p on p.idPOorder = o.idOrder
			group by idClient;
		
select c.idClient, Fname, count(*) as Number_of_orders from client c 
					inner join orders o ON c.idClient = o.idOrderClient
			group by idClient;











