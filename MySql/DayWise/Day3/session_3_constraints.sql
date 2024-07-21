create database session3;
use session3;
create table student(
	id int primary key,
    name varchar(20) not null
);

insert into student
values 
	(1,"Aditya"),
    (2,"Adhar");
select * from student;
-- below lines will throw error as primery key allow only unique value  
insert into student
values 
	(1,"Aditya");
    


-- multiple primary key 
create table combination(
	pair1 int,
    pair2 int,
    primary key(pair1,pair2)
);

insert into combination
values 
	(1,3),
    (1,2);

select * from combination;

insert into combination
values 
	(2,3),
    (3,2);
-- will throw error as 2,3 is alreafy present 
insert into combination
values 
	(2,3);

-- auto increment
drop table random_table;
create table random_table(
	serial_num int auto_increment primary key,
    name varchar(20) not null,
    marks int
);

select * from random_table;

-- we need to mention other columns name in the same kine where we write insert into see below we need to mention name and marks column
insert into random_table(name,marks)
values
	("Aditya",34),
    ("Rahul",43);
    
-- will not throw any type of error as primary key column always getting different unique value as it auto increment from prveious column 
insert into random_table(name,marks)
values
	("Aditya",34),
    ("Rahul",43);


-- timestamp
CREATE TABLE faviorites(
    customer_id INT,
    product_id INT,
    favorite_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(customer_id, product_id)
);


insert into faviorites
values(1,1,CURRENT_TIMESTAMP);

select * from faviorites;

insert into faviorites
values(1,2,CURRENT_TIMESTAMP);
 
insert into faviorites
values(2,3,CURRENT_TIMESTAMP);
 
  
insert into faviorites
values(1,3,CURRENT_TIMESTAMP);



-- -------------------------------------Foreign Key-----------------------------------------


CREATE DATABASE fkdemo;

USE fkdemo;

CREATE TABLE categories(
  categoryId INT AUTO_INCREMENT PRIMARY KEY, 
  categoryName VARCHAR(100) NOT NULL
) ENGINE = INNODB;
CREATE TABLE products(
  productId INT AUTO_INCREMENT PRIMARY KEY, 
  productName VARCHAR(100) NOT NULL, 
  categoryId INT, 
  CONSTRAINT fk_category FOREIGN KEY (categoryId) 
                         REFERENCES categories(categoryId)
);
-- The categoryId in the products table is the foreign key column that refers to the categoryId column in the  categories table.


INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');

SELECT * FROM categories;

INSERT INTO products(productName, categoryId)
VALUES('iPhone',1);

SELECT * FROM products;

-- It works because the categoryId 1 exists in the categories table.
-- till now if parent table's primary key(categoryID) which is a foreign key for the 

-- error 
INSERT INTO products(productName, categoryId)
VALUES('iPhone',3);


-- -------------------------------------------------------------------------

create database school;
use fkdemo;
create table admission(
	admission_no int primary key,
    name varchar(20) not null,
    fee_payment bool
);

create table class(
	class_no int,
    admission_no int,
    constraint class_assign foreign key(admission_no)
							references admission(admission_no)
);

insert into admission
values(2301,"Aditya",0),
	(2302,"Ayush",1);
    
select * from admission;
select * from class;

insert into class
values (2,2301);

insert into class
values (1,2301);



SET SQL_SAFE_UPDATES = 0;

DELETE FROM class
WHERE class_no = 1;

alter table class
modify admission_no int primary key;


alter table class
modify admission_no int;


alter table class
drop primary key;

alter table class
modify admission_no restrict;


describe admission;
describe class;




-- alter table class
-- drop  foreign key primary key ;

ALTER TABLE class
DROP FOREIGN KEY primary key;










ALTER TABLE class DROP PRIMARY KEY;


describe admission;
describe class;
     
use data2;

create table student
(
	id int primary key,
    name varchar(20)
);

insert into student
values(1,"abc");

select * from student;

-- primary key not accept null values
insert into student(name)
values("abc");

insert into student(id)
values(2);

-- empty string ("")
-- Definition: An empty string is a string with zero characters. It is a valid string value, but it contains no characters.
-- Behavior: An empty string is considered a value and can be compared with other strings. It is equal to another empty string but not to NULL.
-- Usage: An empty string is used to represent a known, but empty, value. 

insert into student(id ,name)
values(4,"");





use fkdemo;


CREATE TABLE categories(
  categoryId INT AUTO_INCREMENT PRIMARY KEY, 
  categoryName VARCHAR(100) NOT NULL
) ENGINE = INNODB;

DROP TABLE products;

CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category FOREIGN KEY (categoryId) 
						   REFERENCES categories(categoryId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

select * from products;

select * from categories;

insert into products
values(1201,"Samsung Galaxy",1),
(1202,"Iphone",1),
(1301,"Boat-xI",2),
(1302,"Apple-SmartoI",2);

select * from products;

update categories
set categoryId = 101
where categoryId=1;
-- above change in the parent table reflect in the child table also bcz of cascade
select * from products;


update categories
set categoryId = 102
where categoryId=2;

select * from products;










