-- Task 1
-- create database ABC Inc. 
create database ABC_Inc;

-- Task 2
-- create employee table for each start-up with table name as "A-SQL","B-Oracle" and "C-HTML".

create table ABC_Inc.A_SQL (Employee_ID varchar(10) , Age int , Proficiency int);
use ABC_Inc;
create table ABC_Inc.B_Oracle(Employee_ID varchar(10), Age int , Proficiency int);
-- create table ABC_Inc.B_Oracle like A_SQL;
-- create table ABC_Inc.B_Oracle select * from A_SQL;
create table ABC_Inc.C_HTML (Employee_ID varchar(10), Age int , Proficiency int);
-- create table ABC_Inc.C_HTML like A_SQL;
-- create table ABC.Inc.C_HTML select * from A_SQL;

-- Task 3
-- Insert the Employee ID,Age and Proficiency for a respective, ranging from 1 to 5
insert into ABC_Inc.A_SQL (Employee_ID , Age , Proficiency ) values ( 'A001' , 23, 5),( 'A002' , 21, 4),( 'A003' , 20, 2),( 'A004' , 19, 3),( 'A005' , 25, 5);
insert into abc_inc.b_oracle (Employee_ID , Age ,Proficiency ) values ( 'B001' , 33 , 5),( 'B002' , 33 , 5),( 'B003' , 33 , 5),( 'B004' , 33 , 5),( 'B005' , 33 , 5);
insert into abc_inc.c_html (Employee_ID , Age , Proficiency ) values ('C001' , 35 , 4),('C002' , 35 , 4),('C003' , 35 , 4),('C004' , 35 , 4),('C005' , 35 , 4);

-- Task 4
-- The committee members desided to close the start-up ,B-Oracloe and rename it ,"B-SQL" because of the huge buisness in SQl compared to Oracle
alter table ABC_Inc.B_Oracle rename to B_SQL;

-- Task 5
-- Truncate the B-SQL table and add half of the employee from A-SQL to B-SQL.
truncate table B_SQL;
insert into abc_inc.b_sql select * from A_SQL;
describe B_SQL;
select * from B_SQL;
truncate table B_SQl;
insert into abc_inc.b_sql select * from A_SQL where Employee_ID>='A003';
describe B_SQL;
select * from b_sql;

-- Task 6
-- After the sucess in SQL tachnology the board member again decided to close a buisness in C-HTML start-up.
drop table C_HTML;

-- Task 7
-- Instead of running two parallel start-up of SQL the board member decided to merge A-SQL with B-SQL and rename it AB-SQL
 insert into abc_inc.a_sql select * from b_sql ; 
 select * from a_sql;
 drop table b_sql;
 alter table abc_inc.a_sql rename to AB_sql;
 select * from abc_inc.ab_sql;