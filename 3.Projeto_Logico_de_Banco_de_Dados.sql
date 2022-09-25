-- Desafio de Projeto 
use ECommerce2;

-- Relação de nomes dos fornecedores e nomes dos produtos;
select SocialName as Nomes_dos_Fornecedores, Pname as Nomes_dos_Produtos from supplier join product;

-- Relação de produtos fornecedores e estoques;
select * from productSupplier join productStorage;

-- Algum vendedor também é fornecedor?
select * from seller join supplier where idSeller = idSupplier;

-- Quantos pedidos foram feitos por cada cliente?
select * from orders join client;
select idOrder,Fname, count(*) from orders,client group by idclient;

-- Recuperações simples com SELECT statement
-- Verificar a quantidade de produto no estoque
select * from productStorage order by quantity ;

-- Filtros com o WHERE statement
select idOrderClient, orderStatus, count(*) from orders where idOrderClient = idOrder;
-- Seleciona vendedor pela localidade (Estado)
select SocialName,CNPJ,Location from seller where Location like 'Rio de Janeiro';
-- Verifica quantidade de produtos no vendedor acima de 10unidades.
select prodQuantity from produtcSeller where prodQuantity > 10;

-- Crie expressões para criar atributos derivados
select count(distinct storagelocation) from productStorage;
-- Mostra a quantidade Minima e Máxima do produto em estoque 
select sum(quantity) as quant_Max, max(quantity) as quant_Min, min(quantity) from productStorage;
-- Filtra e agrupa produtos de acordo com a categoria
select Pname, count(*) from product group by category;

-- Defina Ordenações dos dados com ORDER BY 
-- Ordena e seleciona produto pela categoria
select category from product order by idProduct;

select * from supplier order by idSupplier;

-- Condições de filtros aos grupos - HAVING statement
select Pname, count(*) from product group by category having count(*) < 10;
-- Filtra clientes com o sobrenome 'Silva'
select Fname,Lname,Address, count(*) from client where Lname like 'Silva' group by idClient having count(*) = 1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexas do dados 
select * from orders join client;

select * from orders join client on idOrderClient = idOrder;

select concat(Fname,' ',Lname)as Complete_name, idClient,orderStatus as 
	Status_do_Pedido,poQuantity as Quantidade_do_Produto,CPF,Address from orders 
	inner join client on idOrderClient = idOrder 
    inner join productOrder on idPOproduct = idPOorder 
    where Address like 'Rua%'
	order by idOrder;
    
select * from client inner join orders on idClient = idOrder ;

select * from client left join orders on idClient = idOrder ;

select * from client right join orders on idClient = idOrder ;