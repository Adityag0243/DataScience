use data2;

CREATE TABLE cart_items 
(
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DEC(5,2) NOT NULL,
    sales_tax DEC(5,2) NOT NULL DEFAULT 0.1,
    CHECK(quantity > 0),
    CHECK(sales_tax >= 0) 
);
DESC cart_items;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    discount DECIMAL(10, 2)
);


select * from sales;


INSERT INTO sales (sale_id, product_id, quantity, price_per_unit, discount) VALUES
(1, 101, 10, 15.00, 2.00),
(2, 102, 5, 25.00, 5.00),
(3, 103, 8, 30.00, 3.00),
(4, 104, 3, 45.00, 4.50);



-- Calculate the total revenue before discount for each sale.
SELECT sale_id, (quantity * price_per_unit) AS total_revenue_before_discount
FROM sales;

-- Calculate the net revenue after applying the discount.   -- taking discount per piece
select sale_id, (quantity * (price_per_unit - discount)) AS total_revenue_after_discount
From sales;


-- Calculate the average price per unit for each sale after discount. -- taking discount on overall
SELECT sale_id, quantity, price_per_unit, discount, ((quantity * price_per_unit - discount) / quantity) AS average_price_per_unit_after_discount
FROM sales;


-- Find out which sales have an odd quantity
select sale_id,quantity
from sales
where quantity%2 != 0;

use pdidemo;
select * from sales_01;

select Order_ID,(Profit/Quantity) As profit_per_quantity
from sales_01;


select Order_ID,sales,Discount,Profit
From sales_01
where discount > 0 and profit < 0;

select Order_ID,Order_Date,sales,Quantity,Discount,Profit
From sales_01
where Order_Date > '2020-05-01';




-- ----------------------------------------------------------
CREATE TABLE user_permissions (
    user_id INT PRIMARY KEY,
    permissions INT
);

INSERT INTO user_permissions (user_id, permissions) VALUES
(1, 1),  -- Read
(2, 2),  -- Write
(3, 4),  -- Execute
(4, 8),  -- Delete
(5, 3),  -- Read and Write
(6, 7),  -- Read, Write, and Execute
(7, 15); -- All permissions (Read, Write, Execute, Delete)

select * from user_permissions;


-- every read permission have permission number is odd
select user_id
from user_permissions
where (permissions & 1)=1 ;

-- or we can do by checking odd as well
select user_id
from user_permissions
where (permissions % 2)=1 ;

-- every write permission value has bit 1 on 2^1 the place
select user_id
from user_permissions
where (permissions & 2) = 2;




-- Toggle the "Execute" permission for a specific user (user_id = 5). 
-- till now user_id 5 has no execute permission
UPDATE user_permissions
SET permissions=permissions ^ 4 -- each execute permission value is on for 4th bit if we take ^4 it will reverse it , if on then make off and vice versa
WHERE user_id = 5;
-- now user have execute permission






