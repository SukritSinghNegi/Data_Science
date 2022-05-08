-- Wat-A-Pizza
-- Task 1
-- design a database to store all the oders that are being received 
create database Wat_a_Pizza;
create table Pizza_Menu (pizza_id int not null, pizza_name varchar(20) ,size varchar(20) not null default 'regular', toppings varchar(20), catagory varchar(20) not null default 'veg',cheese_burst varchar(20) not null default 'no' , amount int not null, primary key (pizza_id));
create table orders (order_id int,pizza_id int not null,order_quantity int not null default 1 ,home_delivery varchar(20) not null default 'no' ,bill int);
create table customer ( customer_id int not null , first_name varchar(20) , last_name varchar(20), order_id int );
-- Alter table pizza_menu modify pizza_name varchar(20);

-- Task 2
-- All the menu items for the pizza outlet must be stored in the database
insert into pizza_menu ( pizza_id , pizza_name , size , toppings , catagory , cheese_burst , amount ) values (01, 'PM_Onion', 'regular', 'onion', 'veg', 'no', 90),(02, 'PM_Onion', 'large', 'onion', 'veg', 'no', 110),(03, 'golden_corn', 'regular', 'corn', 'veg', 'no', 95),(04, 'golden_corn', 'large', 'corn', 'veg', 'no', 115),(05, 'cheese_corn', 'regular', 'corn', 'veg', 'no', 125),(06, 'cheese_corn', 'large', 'corn', 'veg', 'yes', 135),(07, 'cheese_corn', 'large', 'corn', 'veg', 'yes', 155),(08, 'chicken_pro', 'regular', 'chicken', 'non_veg', 'no', 145),(09, 'chicken_pro', 'larger', 'chicken', 'non_veg', 'yes', 165);
select * from wat_a_pizza.pizza_menu;

-- Task 3 
-- Store all customer data in the database so that it is easy to identify regular customers
insert into customer (customer_id , first_name , last_name , order_id) values ( 100 , 'Andru' , 'Malik' , 1000 ),( 101 , 'Mike' , 'Ross' , 1001 ),( 102 , 'Harvey' , 'Sepctor' , 1002 ),( 103 , 'Luic' , 'Litt' , 1003 ),( 104 , 'Robert' , 'Zane' , 1004 );
select * from wat_a_pizza.customer;

-- Task 4
-- Store the order details in the database
insert into wat_a_pizza.orders ( order_id , pizza_id , order_quantity , home_delivery) values (1000, 9, 1 ,'yes'),(1001, 1, 1 ,'no'),(1001, 3, 1 ,'yes'),(1002, 8, 1 ,'yes'),(1003, 7, 2 ,'yes'),(1004, 9, 1 ,'yes'),(1004, 7, 1 ,'yes');
update wat_a_pizza.orders set bill = (select amount from pizza_menu where pizza_id = 9) where order_id = 1000;
update wat_a_pizza.orders set bill = (select amount from pizza_menu where pizza_id = 1) where order_id = 1001;
update wat_a_pizza.orders set bill = (select amount from pizza_menu where pizza_id = 3) where order_id = 1001;
update wat_a_pizza.orders set bill = (select amount from pizza_menu where pizza_id = 8) where order_id = 1002;
update wat_a_pizza.orders set bill = (select amount from pizza_menu where pizza_id = 7) where order_id = 1003;
update wat_a_pizza.orders set bill = (select amount from pizza_menu where pizza_id = 9) where order_id = 1004;
update wat_a_pizza.orders set bill = (select amount from pizza_menu where pizza_id = 7) where order_id = 1004;
update wat_a_pizza.orders set bill = bill*order_quantity ;
update wat_a_pizza.orders set bill = bill+50 where home_delivery = 'yes';
select * from wat_a_pizza.orders;

-- Task 5
-- Include a category of non-veg in the menu
alter table pizza_menu add non_veg varchar(20);
alter table pizza_menu modify non_veg varchar(20) default 'no';
update pizza_menu set non_veg = 'Yes' where catagory = 'non_veg';
update pizza_menu set non_veg = 'no' where catagory = 'veg';

-- Task 6 
-- Add an additional crust choice of cheese burst to the existing crust choises
create table crust(crust_name varchar(30), cheese_burst varchar(20));
insert into crust (crust_name , cheese_burst) values ('hand_tossed','yes'),('thin','no'),('fresh_pan','yes');
select * from Crust;

-- Task 7
-- List all the menu items in the  pizza outlet
select * from pizza_menu;

-- Task 8 
-- List all the customers who had ordered large pizza
select c.customer_id,concat(c.first_name,' ',c.last_name) as Full_name from customer c join orders o on c.order_id=o.order_id join pizza_menu p on o.pizza_id=p.pizza_id where p.size = 'large';

-- Task 9
-- Find the most preffered topping
select p.toppings from pizza_menu p join orders o on p.pizza_id=o.pizza_id group by p.toppings order by sum(o.order_quantity) desc limit 1 ;

-- Task 10
-- Find the customer who has the highest bill amount
select concat(c.first_name,' ',c.last_name) as full_name,o.bill from customer c join orders o on c.order_id=o.order_id order by bill desc limit 1;

-- Task 11 
-- List the number of home deliveries
select count(*) from orders where home_delivery = 'yes';

-- Task 12
-- Give a 10% discount on the total bill to the customers who had ordered a large pizza . update their bill ammount accordingly
-- update orders set bill=bill*0.9 where pizza_id = All(select pizza_id from pizza_menu where size='large');
update orders join pizza_menu using (pizza_id) set orders.bill= orders.bill*0.9 where pizza_menu.size = 'large'; 
 select * from orders;