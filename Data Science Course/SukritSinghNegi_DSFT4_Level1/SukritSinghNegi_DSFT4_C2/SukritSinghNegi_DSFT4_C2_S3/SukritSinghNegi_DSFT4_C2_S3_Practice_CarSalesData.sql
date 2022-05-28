-- Task 1
-- Create the tables that hold the data of the sales_persons, customers and the orders received.
-- Task 2
-- Identify the appropriate data type for each of the entities.
-- Task 3
-- Ensure that each table has a primary key
create database if not exists car_sales_data;
use car_sales_data;
create table car_sales_data.sales_persons(Sales_ID int not null, First_Name varchar(20) not null, City varchar(20) not null, Commission_Rate int , primary key (Sales_ID)); 
create table car_sales_data.customers(Customer_ID int not null, C_Name varchar(20) not null , City varchar(20) not null , Rating int not null , Sales_ID int not null , foreign key (Sales_ID) references  car_sales_data.sales_persons (Sales_ID) on delete cascade , primary key (Sales_ID,Customer_ID));
Alter table car_sales_data.customers modify Customer_ID int not null unique;
create table car_sales_data.orders_received(Order_ID int not null, Amount int not null, Order_Date date not null , Customer_ID int not null , foreign key (Customer_ID) references car_sales_data.customers (Customer_ID) on delete cascade , primary key (Customer_ID,Order_ID));
-- Task 4
-- Insert the following details in the Salesperson table.
-- Task 5
-- The column in the table with the name of the salesperson cannot be null.
-- insert into car_sales_data.sales_persons (Sales_ID , First_Name , City , Commission_Rate) values (1002,'Peter','LONDON',12),(1002,'Peter','LONDON',12),(1003,'Rifkin','Barcelona',15),(1004,'Judith','LONDON',11),(1008,'John','LONDON',0),(1009,'Charles','Florida',NULL),(1009,'Charles','Florida',NULL),(1004,'Judith','LONDON',11)
insert into car_sales_data.sales_persons (Sales_ID , First_Name , City , Commission_Rate) values (1002,'Peter','LONDON',12),(1003,'Rifkin','Barcelona',15),(1004,'Judith','LONDON',11),(1008,'John','LONDON',0),(1009,'Charles','Florida',NULL);
alter table car_sales_data.customers add (Last_Name varchar(20)); 
describe customers;               
-- Task 6
-- Insert the following details in the customer table. No column of the customer table should be null.
insert into car_sales_data.customers ( Customer_ID, C_Name ,Last_Name, City , Rating , Sales_ID ) values (2002,'GlovanNI','JeNNy' ,'Rome',200,1003),(2003,'Liu','wiLLiams' ,'San Jose',100,1002),(2004,'GraSS','HarrY' ,'Berlin',300,1002),(2007,'Pereira','JonaTHAN' ,'Rome',300,1004); 
-- Task 7 
-- Insert thye following details in the order table. No column of the order table should be null.
insert into car_sales_data.orders_received ( Order_ID , Amount , Order_Date, Customer_ID) values (3002,100,'2000-07-30',2007),(3005,201,'2011-10-9',2003),(3007,167,'2020-4-2',2002),(3008,189,'2020-3-6',2002),(3011,100,'2000-9-18',2004);
-- Task 8 
-- Delete the ordeer details of order ID 3011 from order table.
delete from car_sales_data.orders_received where Order_ID=3011;
-- Task 9 
-- delete all the sales persons whose commission rate is 0
delete from car_sales_data.sales_persons where Commission_Rate=0;
-- Task 10 
-- update the order where the amount is less than 100 .Set the amoun t to 20% more than the existing amount.
update car_sales_data.orders_received set Amount = Amount*1.2 where Amount<100;
-- Task 11 
-- create an index in the Customer Table based on the rating
alter table car_sales_data.customers add index rating_index(Rating);
-- Task 12
-- Alter the commission rate for the salesperson whose commission rate is 26 . Set the commission rate to 28
update car_sales_data.sales_persons set Commission_Rate=28 where Commission_Rate=26;
-- Task 13 
-- update the rating for the customers whose ratings is 100 and set it as 150
update car_sales_data.customers set Rating=150 where Rating=100;
select * from customers,orders_received,sales_persons;  
