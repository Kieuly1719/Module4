use quanlybanhang;

insert into customer (cID, cName, cAge) values 
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

INSERT INTO orders (oID, cID, oDate) 
VALUES 
(1, 1, '2006-03-21'), 
(2, 2, '2006-03-23'), 
(3, 1, '2006-03-16');

insert into product(pID, pName, pPrice) values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into orderdetail(oID, pID, odQTY) values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2,5,4),
(2,3,3);

select oID, oDate, oTotalPrice from orders;

select cName, pName from customer
join orders on orders.cID = customer.cID
join orderdetail on orders.oID = orderdetail.oID
join product on orderdetail.pID = product.pID;

select cName from customer where cID not in (select cID from orders);

select orders.oID, oDate, SUM(orderdetail.odQTY * pPrice) FROM orders
join orderdetail on orders.oID = orderdetail.oID
join product on orderdetail.pID = product.pID
group by orders.oID, orders.oDate;

