-- Task 1 
-- Create a table that holds the data of sales person , customers and the orders recieved.
create database Car_Sales;
create table Car_Sales.sales_data (sales_ID int , sales_person varchar(20) , customer varchar(20) , orders int ); 

-- Task 2
-- Identify the opproptriate datatype for each of the above attributes.
describe car_sales.sales_data;

-- Task 3
-- Populate the table with data provided in the previous slide.
insert into car_sales.sales_data (sales_ID , sales_person , customer , orders ) values (1002,'Peter','London',12),(1002,'Peter','London',12),(1001,'Serres','San_Jose',13),(1001,'Serres','San_Jose',13),(1003,'Rifkin','Barcelona',15),(1003,'Rifkin','Barcelona',15),(1003,'Rifkin','Barcelona',15),(1003,'Rifkin','Barcelona',15),(1004,'Judith','London',11),(1004,'Judith','London',11),(1004,'Judith','London',11),(1008,'John','London',0),(1008,'John','London',0),(1008,'John','London',0),(1008,'John','London',0),(1009,'Charles','Florida'),(1009,'Charles','Florida'),(1009,'Charles','Florida');

-- Task 4
-- Display the data form the above table.
select * from car_sales.sales_data;
truncate table car_sales.sales_data;
insert into car_sales.sales_data (sales_ID , sales_person , customer , orders ) values (1002,'Peter','London',12),(1002,'Peter','London',12),(1001,'Serres','San_Jose',13),(1001,'Serres','San_Jose',13),(1003,'Rifkin','Barcelona',15),(1003,'Rifkin','Barcelona',15),(1003,'Rifkin','Barcelona',15),(1003,'Rifkin','Barcelona',15),(1004,'Judith','London',11),(1004,'Judith','London',11),(1004,'Judith','London',11),(1008,'John','London',0),(1008,'John','London',0),(1008,'John','London',0),(1008,'John','London',0),(1009,'Charles','Florida',0),(1009,'Charles','Florida',0),(1009,'Charles','Florida',0);
alter table car_sales.sales_data rename column orders to commission_rate;
select * from car_sales.sales_data;
truncate table car_sales.sales_data;
insert into car_sales.sales_data (sales_ID , sales_person , customer , commission_rate ) values (1002,'Peter','London',12),(1002,'Peter','London',12),(1001,'Serres','San_Jose',13),(1001,'Serres','San_Jose',13),(1003,'Rifkin','Barcelona',15),(1003,'Rifkin','Barcelona',15),(1003,'Rifkin','Barcelona',15),(1003,'Rifkin','Barcelona',15),(1004,'Judith','London',11),(1004,'Judith','London',11),(1004,'Judith','London',11),(1008,'John','London',0),(1008,'John','London',0),(1008,'John','London',0),(1008,'John','London',0),(1009,'Charles','Florida',null),(1009,'Charles','Florida',null),(1009,'Charles','Florida',null);
select * from car_sales.sales_data;