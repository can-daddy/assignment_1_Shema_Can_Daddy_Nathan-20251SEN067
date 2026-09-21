--------------------------------------------------------
-- SUNRISE SUPERMARKET DATABASE SCHEMA SETUP
-- Target Database: Oracle 11g Express Edition / APEX
--------------------------------------------------------

-- 1. CREATE TABLES
--------------------------------------------------------

-- CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id   NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    email         VARCHAR2(100) UNIQUE NOT NULL,
    city          VARCHAR2(50) NOT NULL
);

-- PRODUCTS TABLE
CREATE TABLE products (
    product_id   NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    category     VARCHAR2(50) NOT NULL,
    price        NUMBER(10, 2) NOT NULL
);

-- ORDERS TABLE
CREATE TABLE orders (
    order_id    NUMBER PRIMARY KEY,
    customer_id NUMBER NOT NULL,
    order_date  DATE NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- ORDER ITEMS TABLE
CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id      NUMBER NOT NULL,
    product_id    NUMBER NOT NULL,
    quantity      NUMBER NOT NULL,
    CONSTRAINT fk_items_order FOREIGN KEY (order_id) 
        REFERENCES orders(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_items_product FOREIGN KEY (product_id) 
        REFERENCES products(product_id)
);

--------------------------------------------------------
-- 2. BULK INSERT SAMPLE DATA USING INSERT ALL
--------------------------------------------------------

-- INSERT CUSTOMERS (5 records)
INSERT ALL
  INTO customers VALUES (1, 'Alice Johnson', 'alice@example.com', 'New York')
  INTO customers VALUES (2, 'Bob Smith', 'bob@example.com', 'Chicago')
  INTO customers VALUES (3, 'Charlie Brown', 'charlie@example.com', 'Los Angeles')
  INTO customers VALUES (4, 'Diana Prince', 'diana@example.com', 'Houston')
  INTO customers VALUES (5, 'Evan Wright', 'evan@example.com', 'Phoenix')
SELECT 1 FROM dual;

-- INSERT PRODUCTS (8 records across 4 categories)
INSERT ALL
  INTO products VALUES (101, 'Organic Milk', 'Dairy', 3.50)
  INTO products VALUES (102, 'Cheddar Cheese', 'Dairy', 5.00)
  INTO products VALUES (103, 'Whole Wheat Bread', 'Bakery', 2.80)
  INTO products VALUES (104, 'Croissant', 'Bakery', 1.50)
  INTO products VALUES (105, 'Fresh Apples', 'Produce', 2.00)
  INTO products VALUES (106, 'Bananas', 'Produce', 1.20)
  INTO products VALUES (107, 'Orange Juice', 'Beverages', 4.00)
  INTO products VALUES (108, 'Sparkling Water', 'Beverages', 1.80)
SELECT 1 FROM dual;

-- INSERT ORDERS (15 records)
INSERT ALL
  INTO orders VALUES (1001, 1, DATE '2026-01-05')
  INTO orders VALUES (1002, 1, DATE '2026-01-15')
  INTO orders VALUES (1003, 1, DATE '2026-02-01')
  INTO orders VALUES (1004, 2, DATE '2026-01-10')
  INTO orders VALUES (1005, 2, DATE '2026-01-22')
  INTO orders VALUES (1006, 2, DATE '2026-02-12')
  INTO orders VALUES (1007, 3, DATE '2026-01-11')
  INTO orders VALUES (1008, 3, DATE '2026-02-05')
  INTO orders VALUES (1009, 3, DATE '2026-02-18')
  INTO orders VALUES (1010, 4, DATE '2026-01-14')
  INTO orders VALUES (1011, 4, DATE '2026-01-28')
  INTO orders VALUES (1012, 4, DATE '2026-02-10')
  INTO orders VALUES (1013, 1, DATE '2026-02-20')
  INTO orders VALUES (1014, 2, DATE '2026-02-22')
  INTO orders VALUES (1015, 3, DATE '2026-02-25')
SELECT 1 FROM dual;

-- INSERT ORDER ITEMS (25 records)
INSERT ALL
  INTO order_items VALUES (1, 1001, 101, 2)
  INTO order_items VALUES (2, 1001, 103, 1)
  INTO order_items VALUES (3, 1002, 102, 3)
  INTO order_items VALUES (4, 1002, 107, 2)
  INTO order_items VALUES (5, 1003, 105, 5)
  INTO order_items VALUES (6, 1004, 104, 4)
  INTO order_items VALUES (7, 1004, 108, 6)
  INTO order_items VALUES (8, 1005, 101, 1)
  INTO order_items VALUES (9, 1005, 102, 2)
  INTO order_items VALUES (10, 1006, 103, 3)
  INTO order_items VALUES (11, 1006, 106, 10)
  INTO order_items VALUES (12, 1007, 107, 1)
  INTO order_items VALUES (13, 1007, 108, 4)
  INTO order_items VALUES (14, 1008, 105, 2)
  INTO order_items VALUES (15, 1008, 101, 3)
  INTO order_items VALUES (16, 1009, 102, 1)
  INTO order_items VALUES (17, 1009, 104, 2)
  INTO order_items VALUES (18, 1010, 103, 2)
  INTO order_items VALUES (19, 1010, 106, 5)
  INTO order_items VALUES (20, 1011, 107, 3)
  INTO order_items VALUES (21, 1012, 101, 2)
  INTO order_items VALUES (22, 1012, 102, 1)
  INTO order_items VALUES (23, 1013, 105, 4)
  INTO order_items VALUES (24, 1014, 108, 2)
  INTO order_items VALUES (25, 1015, 104, 3)
SELECT 1 FROM dual;

COMMIT;