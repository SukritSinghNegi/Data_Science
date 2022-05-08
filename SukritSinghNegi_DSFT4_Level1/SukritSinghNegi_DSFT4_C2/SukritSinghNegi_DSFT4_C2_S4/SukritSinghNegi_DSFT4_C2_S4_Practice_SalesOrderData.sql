create database if not exists Sales_Order;
create table sales_order.customer (customer_ID int not null unique, customer_name varchar(10) not null, address varchar(20) not null , primary key (customer_ID));
create table sales_order.orders ( order_ID int not null, order_name varchar(20), customer_ID int not null , foreign key (customer_ID) references sales_order.customer (customer_ID) on delete cascade, primary key (customer_ID,order_ID));
create table sales_order.salesperson (sales_ID int not null , first_name varchar(20), city varchar(15) not null , commission_rate int not null, primary key (sales_ID));
Alter table sales_order.salesperson modify commission_rate int;
insert into sales_order.salesperson (sales_ID , first_name , city , commission_rate) values (1002,'Peter','LONDON',12),(1003,'Rifkin','Barcelona',15),(1004,'Judith','LONDON',11),(1008,'John','LONDON',0),(1009,'Charles','Florida',null);
select * from sales_order.salesperson;
insert into sales_order.customer(customer_ID , customer_name , address) values (101,'Adam','Bangalore'),(102,'Alex','Delhi'),(103,'Stuart','Rohtak');
insert into sales_order.orders (order_ID , order_name , customer_ID) values (10,'Order1',101),(11,'Order2',103),(12,'Order3',102);
-- Sales-Order Flow - 1
-- Task 1 
-- Find the records in the customer table with the default value given in the address column.
select address from customer ;

-- Task 2
-- Find the salespersons whose names start with the leetter 'P' and have 'L' asa the fourth letter.
insert into sales_order.salesperson (sales_ID , first_name , city , commission_rate) values (1001,'PAUL','LONDON',0);-- inserted value
-- select * from sales_order.salesperson where (first_name like'P%') or (first_name like 'L%');
 -- select first_name from sales_order.salesperson where (first_name like 'P%') and (first_name like '-L%');
 select first_name from sales_order.salesperson where first_name like 'P__L%' ;
 
 -- Task 3
 -- list all the customers from San Jose , Brazil and London from the salesperson table.
select * from sales_order.salesperson where city in ('LONDON','Sanjose','Brazil');

-- Task 4
-- Select all the customers whose names start either with the letter 'A' or the letter 'G'.
select * from sales_order.customer where (customer_name like 'A%') or (customer_name like 'G%');

-- Sales-Order flow -2
-- Task 5
-- List the highest rating given for each city.
Alter table sales_order.customer add rating int not null;-- created column for customer
update sales_order.customer set rating = 10 where customer_ID = 101;-- inserted values
update sales_order.customer set rating = 8 where customer_ID = 102;-- inserted values
update sales_order.customer set rating = 9 where customer_ID = 103;-- inserted values                                                  
select * from sales_order.customer; 
select max(rating),address from customer group by address; 

-- for salesperson
select max(commission_rate),city from salesperson group by city;-- sales person commision rate


-- Task 6
-- Find all the salespersons who are located in either Barcelona or London
select * from salesperson where city = 'barcelona' or city = 'London'; 
select * from salesperson where city in ('barcelona','London'); 

-- Task 7
-- Find all the order made between October 3,2020 and December 4,2020
alter table sales_order.orders add (Order_date date not null default '2020-12-04');
update sales_order.orders set order_date = '2020-10-03' where order_ID = 10;
update sales_order.orders set order_date = '2020-11-30' where order_ID = 11; 
select * from orders ;
select * from orders where date(order_date) between '2020-10-03' and '2020-12-04';

-- Task 8 
-- Find the SUM of all purachases from the orders table
alter table sales_order.orders add Amount int not null;
update sales_order.orders set Amount = 100 where order_ID = 10;
update sales_order.orders set Amount = 200 where order_ID = 11;
update sales_order.orders set Amount = 300 where order_ID = 12;
select sum(Amount) from orders;

-- Sales-Order Flow - 3 
-- Task 9 
-- Count the number of non NULL  rating feilds in the customer table
select * from customer  where rating is not null;

-- Task 10 
-- List the full Names of all the customers in the title case
alter table sales_order.customer add last_name varchar(20);
update sales_order.customer set last_name = 'Hoffman' where customer_ID = 101 ;
update sales_order.customer set last_name = 'spector' where customer_ID = 102 ;
update sales_order.customer set last_name = 'Litt' where customer_ID = 103 ;
select concat(customer_name,' ',last_name) as costumer_names from customer;
select * from customer;

-- Task 11 
-- List all the customers who have ratings between 200 and 300
update sales_order.customer set rating = 200 where customer_ID = 101;-- inserted values
update sales_order.customer set rating = 300 where customer_ID = 102;-- inserted values
update sales_order.customer set rating = 250 where customer_ID = 103;-- inserted values
select * from customer where rating between 200 and 300;

-- Task 12
-- Sort the customers by their first names
select * from customer order by customer_name;

-- Sales-Order Flow - 4
-- Task 13
-- Sort the amount of all the orders in descending order
select * from orders;
select * from orders order by Amount desc;

-- Task 14
-- Find the average amount of all the orders
select avg(Amount) from orders;

-- Task 15 
-- List the number of customers from each city
select * from customer;
select count(customer_ID),address from customer group by address;

-- Task 16
-- List the number of customers from each city sorted in the reverse alphabetical order
select * from customer;
select count(customer_ID),address from customer group by address order by count(customer_ID) desc;

-- Task 17 
-- Find all the orders done in the month of the april 

insert into sales_order.orders (order_ID,order_name,customer_ID,Order_date,Amount) value (13,'Order4',101,'2020-04-04',150);
select * from orders;
select * from orders where month(Order_date)=4;

-- Task 18
-- List the top five orders based on the amount 
insert into sales_order.orders (order_ID,order_name,customer_ID,Order_date,Amount) value (14,'Order4',102,'2020-04-04',250);
select * from orders order by Amount desc limit 5;

-- Task 19
-- Find the salesperson who will receive the highest commission rate
select * from salesperson;
select max(commission_rate),first_name from salesperson;

-- Task 20
-- List the three salesperson who have the lowest commission rates
select first_name,commission_rate from salesperson order by commission_rate asc limit 3; 