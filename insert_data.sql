-- Insert synthetic customers
INSERT INTO customers VALUES
(1, 'Amit Sharma', 'Mumbai', 'Maharashtra', '2022-01-15'),
(2, 'Priya Verma', 'Delhi', 'Delhi', '2022-03-20'),
(3, 'Ravi Kumar', 'Bangalore', 'Karnataka', '2022-05-10');

-- Insert synthetic products
INSERT INTO products VALUES
(101, 'Fortune Sunflower Oil 1L', 'Grocery', 'Edible Oils', 'Fortune', 180, 10, 'In Stock'),
(102, 'Tata Salt 1kg', 'Grocery', 'Spices & Salt', 'Tata', 25, 0, 'In Stock'),
(103, 'Amul Butter 500g', 'Dairy', 'Butter', 'Amul', 240, 5, 'In Stock');

-- Insert synthetic orders
INSERT INTO orders VALUES
(1001, 1, '2023-01-05', '2023-01-06', 445.00, 'UPI', 'Delivered'),
(1002, 2, '2023-01-10', '2023-01-12', 205.00, 'Credit Card', 'Delivered');

-- Insert synthetic order_items
INSERT INTO order_items VALUES
(5001, 1001, 101, 2, 162, 324),
(5002, 1001, 103, 1, 228, 228),
(5003, 1002, 102, 5, 25, 125),
(5004, 1002, 101, 1, 162, 162);
