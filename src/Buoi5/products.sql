create database demo;
use demo;
create table Products (
	id int auto_increment primary key,
    productCode varchar(20) not null,
    productName varchar(100) not null,
    productPrice decimal(10,2) not null,
    productAmount INT,
    productDescription text,
    productStatus varchar(20)
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES 
('P001', 'Laptop Dell XPS 15', 1500.00, 10, 'Laptop cao cấp', 'Active'),
('P002', 'MacBook Pro M2', 2000.00, 5, 'Laptop Apple', 'Active'),
('P003', 'Bàn phím cơ Logitech', 100.00, 50, 'Bàn phím gaming', 'Inactive'),
('P004', 'Chuột Razer DeathAdder', 60.00, 30, 'Chuột gaming', 'Active'),
('P005', 'Màn hình LG 27 inch', 300.00, 15, 'Màn hình 4K', 'Active');

create unique index idx_productCode on Products(productCode);

create index idx_name_price on Products(productName, productPrice);
select * from Products;

create view products_view as 
select productCode, productName, productPrice, productStatus
from Products;

select * from products_view;

create or replace view products_view as
select productCode, productName, productPrice, productStatus
from Products
where productStatus = 'Active';
select * from products_view;
drop view products_view;

delimiter//
create procedure GetAllProducts()
begin
	select * from Products
end //
delimiter ; 

delimiter //
create procedure AddProduct(
	IN p_code varchar(20),
    in p_name varchar(100),
    in p_price decimal(10,2),
    in p_amount int,
    in p_desc text,
    in p_status varchar(20)
)
begin 
	insert into Products (productCode, productName, productPrice, productAmount, productDescription, producStatus)
    values (p_code, p_name, p_price, p_amount, p_desc, p_status);
end //
delimiter ;

delimiter //
create procedure UpdateProductByID(
	in p_id int,
    in p_name varchar(100),
    in p_price decimal(10,2)
)
begin
	update Products set
    Products.productName = p_name, Products.productPrice = p_price
    where Products.id = p_id;
end//
delimiter ;

delimiter //
create procedure deleteProduct(
	in p_id int
)
begin
	delete from Products where Products.id = p_id;
end//
delimiter ;



