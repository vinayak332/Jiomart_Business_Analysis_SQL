-- Jiomart Business Analysis Schema

CREATE DATABASE jiomart_business;
USE jiomart_business;

-- Customers Table
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(100),
  state VARCHAR(100),
  join_date DATE
);

-- Products Table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(255),
  category VARCHAR(100),
  sub_category VARCHAR(100),
  brand VARCHAR(100),
  price DECIMAL(10,2),
  discount_pct DECIMAL(5,2),
  stock_status VARCHAR(50)
);

-- Orders Table
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  delivery_date DATE,
  total_amount DECIMAL(10,2),
  payment_method VARCHAR(50),
  order_status VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items Table
CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  item_price DECIMAL(10,2),
  total_item_amount DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
