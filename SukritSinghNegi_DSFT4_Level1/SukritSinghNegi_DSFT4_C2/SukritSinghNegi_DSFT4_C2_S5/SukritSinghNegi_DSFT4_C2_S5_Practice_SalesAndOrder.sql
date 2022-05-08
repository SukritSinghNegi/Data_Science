-- Sales and Order
create database sales_and_order; 
create table sales_and_order.salesperson (sales_id int not null , first_name varchar(20) not null , city varchar (20) , commission_rate int );
create table sales_and_order.customer (customer_id int not null , customer_name varchar(20) not null , address varchar(20) not null );
-- alter table sales_and_order.salesperson modify first_name varchar(20) not null ;
create table sales_and_order.orders (order_id int not null , order_name varchar(20) not null , customer_id int not null );
insert into sales_and_order.salesperson(sales_id , first_name , city , commission_rate) values (1001,'PEEl','LONDON',12),(1002,'SeRRes','SanJose',13),(1004,'JudiTH','LONDON',11),(1007,'rifkiN','Barcelona',15),(1003,'axelRod','New York',10),(1004,'FrAN','London',26),(1008,'JohN','London',0),(1009,'CharleS','Florida',null);
insert into sales_and_order.customer(customer_id , customer_name , address ) values ( 101,'Adam','Bangalore'),( 102,'Alex','Delhi'),( 103,'Stuart','Rohtak');
insert into sales_and_order.orders( order_id , order_name , customer_id ) values (10 ,'Order1',101),(11 ,'Order2',103),(12 ,'Order3',102);

-- Task 1
-- Find the names of all the salespersons who ncurrently have orders in the orders table
alter table sales_and_order.salesperson add order_id int ;
update sales_and_order.salesperson set order_id = 10 where first_name = 'FrAN';
update sales_and_order.salesperson set order_id = 11 where first_name = 'rifkiN';
update sales_and_order.salesperson set order_id = 12 where first_name = 'SeRRes';
select s.first_name , o.order_id from sales_and_order.salesperson s join sales_and_order.orders o on s.order_id = o.order_id;
select * from salesperson;-- s

-- Task 2
-- List the names of all the customers and match them with the salespersons serving them
select * from customer;-- c
select * from orders;-- o
select c.customer_name , s.first_name from sales_and_order.customer c inner join sales_and_order.orders o on c.customer_id = o.customer_id inner join sales_and_order.salesperson s on o.order_id = s.order_id ;  

-- Task 3
-- Find the names of all the salespersons who have more than one customer.
insert into sales_and_order.customer(customer_id , customer_name , address ) values ( 104,'Cane','kolkata');
insert into sales_and_order.orders( order_id , order_name , customer_id ) values (13 ,'Order4',104);
insert into sales_and_order.salesperson(sales_id , first_name , city , commission_rate,order_id) values (1004,'FrAN','London',26,13);
select c.customer_name,s.first_name from sales_and_order.customer c inner join sales_and_order.orders o on c.customer_id = o.customer_id inner join  sales_and_order.salesperson s on o.order_id= s.order_id group by first_name having count(first_name)>1;
 
-- Task 4
-- Count the orders received by each salesperson and output their results in descending order
select s.first_name,count(o.order_id) from sales_and_order.salesperson s inner join sales_and_order.orders o on s.order_id = o.order_id group by o.order_id order by count(order_id) desc;  

-- Task 5
-- List all the orders of the salesperson JudiTH from the orders table
select * from salesperson;
insert into sales_and_order.customer(customer_id , customer_name , address ) values ( 105,'Litt','Assam');
insert into sales_and_order.orders( order_id , order_name , customer_id ) values (14 ,'Order4',105);
update sales_and_order.salesperson set order_id = 14 where first_name = 'JudiTH';
select o.order_id,o.order_name,s.first_name from sales_and_order.orders o inner join  sales_and_order.salesperson s on o.order_id = s.order_id where first_name = 'JudiTH';

-- Task 6
-- write a query using ANY or ALL that will find the salespersons who have no customers locted in their cities
select first_name from sales_and_order.salesperson where city !=  ALL (select address from sales_and_order.customer);

-- Task 7
-- Find the salespersons with the customers located in their cities
update sales_and_order.customer set Address='london' where customer_id = 105;
select first_name,city from sales_and_order.salesperson where city = any(select address from sales_and_order.customer);

-- Task 8
-- Find all the orders made by the customers who are not located in the same cities as their salespersons
select o.order_id,o.order_name,c.address from sales_and_order.orders o join sales_and_order.customer c on o.customer_id = c.customer_id join  sales_and_order.salesperson s on o.order_id = s.order_id where c.address != s.city ;
-- select o.order_id,o.order_name,c.address from sales_and_order.orders o join sales_and_order.customer c on o.customer_id = c.customer_id where addess != all(select city from sales_and_order.salesperson);

-- Task 9
-- List the commission received by all the sales represntatives for servicing customers in London
select s.commission_rate from sales_and_order.salesperson s join sales_and_order.orders o on s.order_id=o.order_id join sales_and_order.customer c on o.customer_id=c.customer_id where c.address = 'London';

-- Task 10 
-- create a veiw to provide access to the data of salespersons whose commission rate is greater than 12
create view commission_detail as select first_name,commission_rate from sales_and_order.salesperson where commission_rate>12; 
select * from commission_detail;

-- Task 11 
-- Select salespersons, by their names and salesid who have customers not living in their cities
select s.first_name,s.sales_id from sales_and_order.salesperson s join sales_and_order.orders o on s.order_id=o.order_id join sales_and_order.customer c on o.customer_id = c.customer_id where s.city != c.address;

-- Task 12
-- Which salesperson has no orders between March 10, 2020 and May 10,2020
select * from orders;
alter table sales_and_order.orders add order_date date default  '2020-04-10';
update sales_and_order.orders set order_date = '2020-01-10' where order_id = 10;
update sales_and_order.orders set order_date = '2020-06-10' where order_id = 14;
select s.first_name from sales_and_order.salesperson s join sales_and_order.orders o on s.order_id=o.order_id join sales_and_order.customer c on o.customer_id = c.customer_id where o.order_date not between '2020-03-10' and '2020-05-10';

-- Task 13
-- determine the number of salespersons who succeeded in getting the orders;
select count(s.first_name) from sales_and_order.salesperson s join sales_and_order.orders o on s.order_id = o.order_id where o.order_id is not null;

-- Task 14
-- determine the dates on which each salesperson had booker the order of maximum value
select * from sales_and_order.salesperson;
alter table sales_and_order.salesperson add svalue int ;
update sales_and_order.salesperson set svalue = 100 where order_id = 10;
update sales_and_order.salesperson set svalue = 200 where order_id = 11;
update sales_and_order.salesperson set svalue = 300 where order_id = 12;
update sales_and_order.salesperson set svalue = 400 where order_id = 13;
update sales_and_order.salesperson set svalue = 500 where order_id = 14;
-- alter table sales_and_order.orders drop svalue; 
select o.order_date,s.first_name,s.svalue from sales_and_order.orders o join sales_and_order.salesperson s on  o.order_id=s.order_id group by first_name order by max(s.svalue) desc;

-- Task 15 
-- Generate a report contsining the names of all customers , in uppercase , by combining frist and last anmes using veiws
select * from sales_and_order.customer;
alter table sales_and_order.customer  add last_name varchar(20) default 'zane';
create view report as select upper(concat(customer_name,' ',last_name)) as full_name from customer ;
select * from report;