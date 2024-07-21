use classicmodels;

select * from customers;
select * 
from customers
where not city = "Auckland" && not city ="London";

select * from products;

select productName,buyPrice
from products
where buyPrice > All(select buyPrice from products where productLine="Motorcycles");

select *
from products
where productLine="Motorcycles" and quantityInStock>5000;


select * 
from products
where productLine in ("Motorcycles","Classic Cars");


select * 
from products
where productLine not in ("Motorcycles","Classic Cars");


select * 
from products
where quantityInStock between 0 and 5000;


select * 
from products
where productLine like 'C%';

select * 
from products
order by buyPrice;

select * 
from products
order by buyPrice desc;

select * 
from products
where quantityInStock between 0 and 5000
order by buyPrice desc;



