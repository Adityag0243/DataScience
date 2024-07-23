use activity3;

create table Employee
(
	EmployeeID int Primary key,
	EmployeeName VARCHAR(45)
);

create table Department
( 
Department_ID INT primary key,
Department_Name VARCHAR(225),
EmployeeID INT
);

alter table department
add constraint  Foreign key (EmployeeID)
				references Employee(EmployeeID);
                
create table Project
(
ProjectId INT primary key,
ProjectName VARCHAR(255),
Department_ID INT,
status ENUM('Active','Inactive')
);
alter table Project
add constraint FOREIGN KEY (Department_ID) 
				REFERENCES Department(Department_ID);
                
                
                
create table Assignment
(
Assignment_ID INT primary key,
assigning_date DATETIME,
Department_ID INT ,
constraint Foreign key (Department_ID)
		references Department(Department_ID),
Project_Id INT,
constraint Foreign key (Project_Id)
references project(ProjectId)
);


create table Employee_Assignment
(
Employee_EmployeeID INT,
constraint Foreign key (Employee_EmployeeID) 
references employee(EmployeeID),
Assignment_Assignment_ID INT,
constraint Foreign key (Assignment_Assignment_ID)
references Assignment(Assignment_ID)
);

-- Insert a new employee named "Alice Johnson" with an EmployeeID of 3. Write the
-- SQL command to insert this new employee
insert into employee
value(3,"Alice Johnson");
select * from employee;

-- 2. Insert a new assignment with Assignment_ID of 3, assigning date '2024-07-23', for the
-- 'HR' department and the 'Project Alpha' project. Write the SQL command to insert this
-- new assignment.

-- first we need to fill data in "department" and "project" table as assignment table is taking refernce from it
insert into department
value(123,'HR',3);

insert into project
value(1003,'Project Alpha',123,'Active');


insert into assignment
value(3,'2024-07-23',
(select Department_ID from department where Department_Name='HR'),
(select ProjectId from project where ProjectName='Project Alpha') );

select * from assignment;



-- 3.Add a new column Email of type VARCHAR(100) to the Employee table. Write the SQL command to alter the Employee table. 
alter table employee
add column Email varchar(100);
select * from employee;

-- 4. Change the data type of the Department_Name column in the Department table from
-- VARCHAR(225) to VARCHAR(255). Write the SQL command to alter the Department
-- table.
describe department;   -- varchar 225
alter table department
modify department_Name varchar(255);
describe department;   -- varchar 255



-- 5. Increase the salary of all employees who work in the 'IT' department by 10%. Assume
-- there is a salary column in the Employee table. Write the SQL command to perform
-- this update.


select * from employee;

alter table employee
add column salary int
-- ID    empl_name     email  salary
-- 3	Alice Johnson  null   null   (this data is already present)










