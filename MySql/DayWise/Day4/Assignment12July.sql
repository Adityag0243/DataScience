use salesdb01;
drop table sales_01,sales_02;

create table productlines
(
	productLine VARCHAR(50)  PRIMARY KEY,
    textDescription VARCHAR(4000),
    tmlDescription MEDIUMTEXT,
    image MEDIUMBLOB
);

insert into productlines(productLine,textDescription)
values
('Classic Cars', 'Cars from the 1950s and 1960s'),
('Motorcycles', 'A range of motorcycles');

select * from productlines;


-- -----------------------------------------------------------------------------



create table products
(
	productCode VARCHAR(15) PRIMARY KEY,
    productName VARCHAR(70) NOT NULL,
    productLine VARCHAR(50),
    constraint line_to_product  foreign key(productLine)
								references productlines(productLine),
	productScale VARCHAR(10) NOT NULL,
    productVendor VARCHAR(50) NOT NULL,
    productDescription TEXT NOT NULL,
    quantityInStock SMALLINT NOT NULL,
    buyPrice DECIMAL(10, 2) NOT NULL,
    MSRP DECIMAL(10, 2) NOT NULL
);

insert into products
values
('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', '1:10', 'Min Lin Diecast', 'This replica features working kickstand, front suspension, gear-shift lever.', 7933, 48.81, 95.70);

insert into products
values
('S10_1949', '1952 Alpine Renault 1300', 'Classic Cars', '1:10', 'Classic Metal Creations', 'Turnable front wheels; steering function.', 7305, 34.00, 67.20),
('S12_1099', '1958 Setra Bus', 'Motorcycles', '1:18', 'Highway 66 Mini Classics', 'Detailed interior and exterior.', 6982, 29.50, 49.30),
('S18_3232', '1961 Chevrolet Impala', 'Classic Cars', '1:18', 'Gearbox Collectibles', 'Opening doors, hood, and trunk.', 4582, 32.95, 79.50),
('S24_1628', '1996 Moto Guzzi 1100i', 'Motorcycles', '1:12', 'Studio M Art Models', 'Working suspension, detailed engine.', 9124, 68.99, 103.00),
('S32_1374', '2003 Harley-Davidson Eagle Drag Bike', 'Motorcycles', '1:10', 'Min Lin Diecast', 'Features detailed parts.', 6642, 31.75, 43.60);

select * from products;


--  ---------------------------------------------------------------------------------------------

create table offices
(
	officeCode VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL,
	addressLine1 VARCHAR(50) NOT NULL,
    addressLine2 VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL,
    postalCode VARCHAR(15) NOT NULL,
    territory VARCHAR(10) NOT NULL
); 


insert into offices
values
('1', 'San Francisco', '+1 650 219 4782', '100 Market Street', 'Suite 300', 'CA', 'USA', '94080', 'NA'),
('2', 'New York', '+1 212 555 1234', '200 Broadway', 'Floor 10', 'NY', 'USA', '10007', 'NA'),
('3', 'Los Angeles', '+1 323 123 4567', '300 Sunset Blvd', 'Suite 500', 'CA', 'USA', '90028', 'NA');


select * from offices;



-- --------------------------------------------------------------------------------------

create table employees
(
	employeeNumber INT PRIMARY KEY, 
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
	extension VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    officeCode VARCHAR(10), 
    constraint off_to_employee FOREIGN KEY (officeCode)
							   REFERENCES offices(officeCode),
	reportsTo INT, 
    
	jobTitle VARCHAR(50) NOT NULL
);


-- self referencing here by altering bcz don't know why showing error while doing during creating table itself
alter table employees
add constraint check_employee_existance FOREIGN KEY (reportsTo)
										REFERENCES employees(employeeNumber);




-- generating similar data from chat gpt by giving that one sample data 
insert into employees
values
	(1002, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', '1', NULL, 'President'),
    (1003, 'Brown', 'Jim', 'x5801', 'jbrown@classicmodelcars.com', '1', NULL, 'Vice President'),
	(1004, 'Smith', 'Susan', 'x5802', 'ssmith@classicmodelcars.com', '1', NULL, 'Sales Manager'),
	(1005, 'Johnson', 'Michael', 'x5803', 'mjohnson@classicmodelcars.com', '1', NULL, 'Marketing Manager'),
	(1006, 'Williams', 'Karen', 'x5804', 'kwilliams@classicmodelcars.com', '1', NULL, 'Finance Manager'),
	(1007, 'Jones', 'David', 'x5805', 'djones@classicmodelcars.com', '1', NULL, 'IT Manager'),
	(1008, 'Taylor', 'Patricia', 'x5806', 'ptaylor@classicmodelcars.com', '1', NULL, 'HR Manager');
    
select * from employees;


-- -----------------------------------------------------------------------------------

create table customers
(
customerNumber INT PRIMARY KEY,
customerName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
postalCode VARCHAR(15),
country VARCHAR(50) NOT NULL,
salesRepEmployeeNumber INT,
constraint FOREIGN KEY(salesRepEmployeeNumber) REFERENCES employees(employeeNumber),
creditLimit DECIMAL(10, 2)
);



insert into customers(customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,city,country,postalCode,salesRepEmployeeNumber,creditLimit)
values
(104, 'Signal Gift Stores', 'King', 'Jean', '33.55.6545', '8489 Strong St.', 'Paris', 'France', 1337,1003, 120000.00),
(105, 'Australian Collectors, Co.', 'Nelson', 'Susan', '22.55.6767', '636 St Kilda Road', 'Melbourne', 'Australia', 1370,1004, 95000.00),
(106, 'La Rochelle Gifts', 'Andrews', 'Peter', '67.55.2222', '67, rue des Cinquante Otages', 'La Rochelle', 'France', 1370,1005, 90000.00),
(107, 'Osaka Souvenirs Co.', 'Yamamoto', 'Hiro', '45.66.7788', '24, kyobashi', 'Osaka', 'Japan', 1621, 1006,120000.00);


select * from customers;

-- ----------------------------------------------------------------
create table orders
(
	orderNumber INT PRIMARY KEY,
	orderDate DATE NOT NULL,
	requiredDate DATE NOT NULL,
	shippedDate DATE,
	status VARCHAR(15) NOT NULL,
	comments TEXT,
	customerNumber INT,
    constraint orders_to_customers FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
);


insert into orders
values
(10101, '2003-02-12', '2003-02-19', '2003-02-15', 'Shipped',"", 104),
(10102, '2003-03-03', '2003-03-10', '2003-03-07', 'Shipped',"", 105),
(10103, '2003-04-15', '2003-04-22', '2003-04-18', 'Shipped', "",106),
(10104, '2003-05-23', '2003-05-30', '2003-05-27', 'Shipped', "",107);


select * from orders;



-- -------------------------------------------------------------------------------------
create table orderdetails
(
orderNumber INT,
constraint FOREIGN KEY(orderNumber) REFERENCES orders(orderNumber),
productCode VARCHAR(15),
constraint FOREIGN KEY(productCode) REFERENCES products(productCode),
quantityOrdered INT NOT NULL,
priceEach DECIMAL(10, 2) NOT NULL,
orderLineNumber SMALLINT NOT NULL,
Primary Key(orderNumber,productCode)
);

insert into orderdetails
values
(10101, 'S10_1949', 50, 67.20, 2),
(10102, 'S12_1099', 22, 49.30, 1),
(10103, 'S18_3232', 15, 79.50, 3),
(10104, 'S24_1628', 10, 103.00, 2);




create table payments
(
	customerNumber INT, 
    constraint FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber),
	checkNumber VARCHAR(50) PRIMARY KEY,
	paymentDate DATE NOT NULL,
	amount DECIMAL(10, 2) NOT NULL
);


insert into payments
values
(104, 'HQ445566', '2005-01-23', 7200.50),
(105, 'HQ554477', '2006-03-15', 8390.25),
(106, 'HQ663388', '2007-07-30', 9123.80);
