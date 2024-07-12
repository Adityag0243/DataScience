create database july5;
use sports;
SHOW COLUMNS FROM sports.bowlers_data;
insert into bowlers_data
values ("2023","2345678","Sawae man singh","Jaipur",1,"Bumrah",4,0,23,2,8,2,1,2,1);

SELECT *
FROM bowlers_data
LIMIT 5;
delete from bowlers_data;
SELECT *
FROM bowlers_data;

select * from cricket_batsman;
insert into cricket_batsman
values("Virat kohli", "RCB",4350,3500,150,90);
select * from cricket_batsman;
insert into cricket_batsman
values("Rohit Sharma", "MI",4150,3000,200,150),("Dhawan", "KXIP",4250,3200,170,80);
select * from cricket_batsman;



drop table if exists Patients;
create table Patients
(
	id				varchar(15) unique,
	first_name		varchar(50), 
	last_name		varchar(50), 
	gender			varchar(10) check (gender in ('M', 'F', 'Male', 'Female')),
	dob				date,
	phone_no		bigint,
	blood_group		varchar(15)
);

insert into Patients values ('P1', 'Vishva', 'Kumar', 'Male', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099900, 'A+');
insert into Patients values ('P2', 'Steven', 'Smith', 'Male', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099901, 'B+');
insert into Patients values ('P3', 'Ram', 'Kumar', 'Male', STR_TO_DATE('11-05-1990', '%d-%m-%Y'), 9990099902, 'O+');
insert into Patients values ('P4', 'Raju', 'Sharma', 'Male', STR_TO_DATE('14-05-1990', '%d-%m-%Y'), 9990099903, 'O-');
insert into Patients values ('P5', 'Eshal', 'Maryam', 'Female', STR_TO_DATE('10-07-1990', '%d-%m-%Y'), 9990099904, 'A-');
insert into Patients values ('P6', 'Reshal', 'Verma', 'F', STR_TO_DATE('10-05-1990', '%d-%m-%Y'), 9990099905, 'A+');




select * from Patients;

update Patients
set blood_group="O-"
where id="P3";

update Patients
set blood_group="O+"
where id="P3" or id="P4";

-- #to change setting as by default it is off to change 

SET SQL_SAFE_UPDATES = 0;  

update Patients
set blood_group="O+" , last_name="Vilas"
where id="P3";
select * from Patients;


create table sports.emp
(
name varchar(25),
age int
);
insert into emp
values("Gerard Abood",55),("Paul Baldwin",58);
select * from emp;


alter table emp
add match_exp int;

select * from emp;

update emp
set match_exp=75
where name="Gerard Abood";

select * from emp;

update emp
set match_exp=105
where name="Paul Baldwin";
select * from emp;


alter table emp
add country varchar(20) 
after age;
select * from emp;

update emp
set country="ENG";
select * from emp;


describe emp;
alter table empire
rename to umpire;

select * from umpire;
describe umpire;

-- name is varchar25 make is varchar 30 
-- update for updating data itself(Data manipulation ), alter for data definition (like its type, adding new column , table name etc)
alter table umpire
modify name varchar(30);
describe umpire;

alter table umpire
rename column name to fullname;

select * from umpire;



truncate table umpire;
select * from umpire;
select * from patients;
delete from  patients
where id="P3";

insert into patients
value("P3","Ram","Vilas","Male","1990-05-15","9956567892","O-");
select * from patients;

select * from patients;

update patients
set id="p3"
where first_name="Ram";
select * from patients;
SELECT * FROM patients
ORDER BY id;

SHOW PLUGINS;
-- UNINSTALL PLUGIN mysql_native_password;
-- INSTALL PLUGIN mysql_native_password SONAME 'mysql_native_password.so';
-- [mysqld]
-- plugin-load-add=mysql_native_password.so

-- sudo tail -f /var/log/mysql/error.log





-- [mysqld] 
-- plugin_dir = /path/to/mysql/plugin

-- lets create new user 
-- CREATE USER 'newadmin'@'root2' IDENTIFIED BY 'abc'; 
Create USER 'newadmin'@'127.0.0.1' IDENTIFIED WITH mysql_native_password BY 'abc';


