# Sunrise Supermarket - Assignment 

## **0.0 Created by** 

**Name** : Shema Can Daddy Nathan **RegNo** : 20251SEN067 **Course** : Database Development with PL/SQL **Group** : B 

## **1. Introduction** 

The **Sunrise Supermarket Database System** manages day-to-day operations for retail tracking, including customer information, store inventory, sales orders, and purchased line items. The system enables store managers to monitor order progress, evaluate customer purchasing habits, rank top spenders, and track revenue trends over time. 

### **Database Tools Used** 

- **Command Prompt (SQL*Plus):** Used for table creation and sample data population through SQL script execution. 

- **Oracle Application Express (APEX):** Used for executing analytical queries (JOINs, CTEs, and Window Functions) and presenting output in structured visual tables. 

- 

## **2. Table Creation & Sample Data Insertion (Command Prompt)** 

### **Table Creation** 

The database schema consists of four relational tables: <mark>CUSTOMERS, PRODUCTS</mark> , <mark>ORDERS,</mark> and <mark>ORDER_ITEMS.</mark> SQL 



<!-- Start of picture text -->
SQL> CREATE TABLE customers (<br>2 customer_id NUMBER PRIMARY KEY,<br>3 customer_name VARCHAR2(10@) ,<br>4 email VARCHAR2(100),<br>5 city VARCHAR2(50)<br>able created<br>SQL> CREATE TABLE products (<br>2 product_id NUMBER PRIMARY KEY,<br>4 category VARCHAR2(5®),<br>5 price NUMBER(10,2)<br>able created<br>SQL> CREATE TABLE orders (<br>2 order_id NUMBER PRIMARY KEY,<br>3 customer_id NUMBER REFERENCES customers(customer_id),<br>4 order_date DATE<br>5 )5<br>SQL> CREATE TABLE order_items<br>2 order_item_id NUMBER PRIMARY KEY,<br>3 order_id NUMBER REFERENCES orders(order_id),<br>4 product_id NUMBER REFERENCES products (product_id),<br>5 quantity NUMBER<br><!-- End of picture text -->

##### **Figure 1:** **_This shows tables creation_** 



<!-- Start of picture text -->
SQL> SELECT table name FROM user_tables;<br>TABLE_NAME<br>CUSTOMERS<br>PRODUCTS<br>ORDERS<br>IORDER_ITEMS<br><!-- End of picture text -->

**Figure 2:** **_This figure show all tables we created_** 

### **Sample Data Insertion** 

The database was populated with sample data using Oracle's <mark>INSERT ALL</mark> statement to load records across all four tables efficiently. 



<!-- Start of picture text -->
SQL> INSERT ALL<br>2 INTO customers VALUES (1, ‘Alice Johnson", ‘alice@example.com', ‘New York")<br>3 INTO customers VALUES (2, ‘Bob Smith’, ‘bob@example.com', ‘Chicago’)<br>5 INTO customers VALUES (4, ‘Diana Prince’, ‘diana@example.com’, ‘Houston’)<br>6 INTO customers VALUES (5, ‘Evan Wright’, ‘evan@example.com', *Phoenix')<br>7 SELECT 1 FROM dual;<br><!-- End of picture text -->

**Figure 3:** **_This figure shows the customer data entry_** 

- SQL> INSERT ALL 2 INTO products VALUES (101, ‘Organic Milk’, ‘Dairy’, 3.50) 3 INTO products VALUES (102, ‘Cheddar Cheese’, ‘Dairy’, 5.00) 4 INTO products VALUES (103, ‘Whole Wheat Bread’, ‘Bakery’, 2.80) 5 INTO products VALUES (104, ‘Croissant’, ‘Bakery’, 1.50) 6 INTO products VALUES (105, ‘Fresh Apples’, ‘Produce’, 2.00) v/ INTO products VALUES (106, ‘Bananas’, ‘Produce’, 1.20) 8 INTO products VALUES (107, ‘Orange Juice’, ‘Beverages’, 4.00) 9 INTO products VALUES (108, ‘Sparkling Water’, ‘Beverages’, 1.80) 

- 1@ SELECT 1 FROM dual; 

|SQL>|INSERT|ALL|||||
|---|---|---|---|---|---|---|
|2|INTO|orders|VALUES|(1001,<br>1,|DATE|'2026-01-05')|
|3|INTO|orders|VALUES|(1002,<br>1,|DATE|'2026-01-15")|
|4|INTO|orders|VALUES|(1003,<br>1,|DATE|'2026-02-01")|
|5|INTO|orders|VALUES|(1004,<br>2,|DATE|'2026-01-10")|
|6|INTO|orders|VALUES|(1005,<br>2,|DATE|'2026-01-22')|
|7|INTO|orders|VALUES|(1006,<br>2,|DATE|'2026-02-12")|
|8|INTO|orders|VALUES|(1007,<br>3,|DATE|'2026-01-11")|
|9|INTO|orders|VALUES|(1008,<br>3,|DATE|'2026-02-05")|
|10|INTO|orders|VALUES|(1009,<br>3,|DATE|'2026-02-18")|
|11|INTO|orders|VALUES|(1010,<br>4,|DATE|'2026-01-14")|
|12|INTO|orders|VALUES|(1011,<br>4,|DATE|'2026-01-28")|
|13|INTO|orders|VALUES|(1012,<br>4,|DATE|'2026-02-10')|
|14|INTO|orders|VALUES|(1013,<br>1,|DATE|'2026-02-20')|
|15|INTO|orders|VALUES|(1014,<br>2,|DATE|'2026-02-22")|
|16|INTO|orders|VALUES|(1015,<br>3,|DATE|'2026-02-25")|
|17|SELECT|1<br>FROM|dual;||||



15 rows created. 



<!-- Start of picture text -->
SQL> INSERT ALL<br>2 INTO order_items VALUES (1, 1001, 101, 2)<br>3 INTO order_items VALUES (2, 1001, 103, 1)<br>4 INTO order_items VALUES (3, 1002, 102, 3)<br>5 INTO order_items VALUES (4, 1002, 107, 2)<br>6 INTO order_items VALUES (5, 1003, 105, 5)<br>7 INTO order_items VALUES (6, 1004, 104, 4)<br>8 INTO order_items VALUES (7, 1004, 108, 6)<br>9 INTO order_items VALUES (8, 1005, 101, 1)<br>10 INTO order_items VALUES (9, 1005, 102, 2)<br>11 INTO order_items VALUES (10, 1006, 103, 3)<br>12 INTO order_items VALUES (11, 1006, 106, 10)<br>13 INTO order_items VALUES (12, 1007, 107, 1)<br>14 INTO order_items VALUES (13, 1007, 108, 4)<br>15, INTO order items VALUES (14, 1008, 105, 2)<br>16 INTO order_items VALUES (15, 1008, 101, 3)<br>17 INTO order_items VALUES (16, 1009, 102, 1)<br>18 INTO order_items VALUES (17, 1009, 104, 2)<br>19 INTO order_items VALUES (18, 1010, 103, 2)<br>20 INTO order items VALUES (19, 1010, 106, 5)<br>21 INTO order_items VALUES (20, 1011, 107, 3)<br>22 INTO order_items VALUES (21, 1012, 101, 2)<br>23 INTO order_items VALUES (22, 1012, 102, 1)<br>24 ‘INTO order_items VALUES (23, 1013, 105, 4)<br>25 INTO order_items VALUES (24, 1014, 108, 2)<br>26 INTO order_items VALUES (25, 1015, 104, 3)<br>27 SELECT 1 FROM dual;<br><!-- End of picture text -->

## **3. Transition from Command Prompt to Oracle APEX Reason for Shifting to APEX** 

Command Prompt <mark>(sqlplus)</mark> is ideal for running creation and insertion scripts, but its text interface often line-wraps query results and makes tables hard to read. 

To improve the visual presentation of query outputs, execution was shifted to **Oracle Application Express (APEX)** , which formats query results into clean, web-based tables. 

## **4. APEX Display Settings** 

In APEX SQL Commands, the result view was set to a **10-row display limit** . 

Limiting the output to 10 rows allows both the SQL code and the resulting data table to fit comfortably on a single screen without needing excessive vertical scrolling, keeping screenshot verification neat and easy to review. 

## **5. Analytical Queries & Results (Oracle APEX)** 

### **5.1. JOIN Queries** 

**Query 1: Order Details with Customer Names (INNER JOIN)** <mark>SQL</mark> 

- **Explanation:** Combines <mark>ORDERS</mark> and <mark>CUSTOMERS</mark> to display each order alongside the customer's name and city. 



<!-- Start of picture text -->
Dastocommt Rows [0 vO Save) Gump<br>FROM orgers0<br>WER 90IN customers ¢ ON o.custoner_sd =<br>c, customertd<br>Results<br>1001 ‘lee Jonson NewYork 0170572026<br>002 Ace Johnson NewYork 011572026<br>10021008 AceBob SmithJonson NewChicagoYork 02/01/2026—_otrt072006<br>10051008 200Bob SmithSmith ChicagoChicago 0172272028o2rr22028<br>1007 Care Broom Los Angeles 011172026<br>1008 Care Brom Los Angeles 020572028<br>1000 Care Broo Los Angeles 0211872026<br>1010 Diana Prince Houston 171472028<br>More han 10 ows avalble. Increase rows selector to Vew more rows<br>10 rows retumed in 0.01 seconds —D<br><!-- End of picture text -->

##### **Query 2: Order Items with Product Details (JOIN)** <mark>SQL</mark> 

- **Explanation:** Joins <mark>ORDER_ITEMS</mark> with <mark>PRODUCTS</mark> to display product names, categories, unit prices, and quantities for each ordered item. 



<!-- Start of picture text -->
autocommt Rows [@ —v]| AY (Save )(GRuny)<br>FROMhomn orderproductsStemsp ONof oi.product_id = p.product_id<br>lozoer BY of order<br>stem sai)<br>Results<br>1 1001 Organic Mik Dairy 352<br>2 1001 Whole Wheat Bread Bakery = 281<br>3 1002 Cheddar Cheese Dairy 5 3<br>4 1002 Orange Juice Beverages 4 2<br>5 1003 Fresh Apples Proje = 25<br>6 1004 Croissant Bakery 15 4<br>7 1004 Sparking Water Beverages 18 = 6<br>8 1005 Organic Mik Dairy 351<br>9 1005 Cheddar Cheese Dairy 5 2<br>10 1006 Whole Wheat Bread Bakery «283<br>More than 10 rows available. Increase rows selector to view more rows<br>10 rows returned in 0.02 seconds wnload<br><!-- End of picture text -->

##### **Query 3: Customers and Their Orders (LEFT JOIN)** <mark>SQL</mark> 

- **Explanation:** Displays all registered customers, including those who have not yet placed an order (shown with <mark>NULL</mark> values in order columns). 



### **5.2. Common Table Expression (CTE) Query** 

**Query 4: High-Value Customers (Spending Above Average)** <mark>SQL</mark> 

- **Explanation:** Uses a CTE to calculate total customer expenditure, then filters for customers who spent more than the average amount across all customers. 

● 



<!-- Start of picture text -->
Mautocommit Rows [10 vi@Y ( Save )( Run)<br>WITH customer_spend AS (<br>SELECT c.customer_id, c.customer_name, SUM(oi.quantity * p.price) AS total_spent<br>FROM customers c<br>JOIN orders o ON c.customer_id = o.customer_id<br>JOIN order_items oi ON o.order_id = oi.order_id<br>JOIN products p ON oi.product_id = p.product_id<br>GROUP BY c.customer_id, c.customer_name<br>)<br>SELECT customer_id, customer_name, total_spent<br>FROM customer_spend<br>WHERE total_spent > (SELECT AVG(total_spent) FROM customer_spend);<br>Results<br>2 Bob Smith 54.3<br>1 Alice Johnson 50.8<br>2 rows returned in 0.03 seconds Download<br><!-- End of picture text -->

### **5.3. Window-Function Queries** 

**Query 5: Ranking Customers by Spend** **<mark>(</mark>** <mark>DENSE_RANK</mark> **<mark>)</mark>** <mark>SQL</mark> 

- **Explanation:** Ranks customers from highest to lowest spender using <mark>DENSE_RANK(),</mark> giving tied amounts the same rank without leaving gaps. 

● 



<!-- Start of picture text -->
autocommit Rows [7 vi@¥Y ( Save )@Rum»)<br>WITH customer_spend AS<br>SELECT c.customer_id, c.customer_name, SUM(oi.quantity * p.price) AS total_spent<br>FROM customers c<br>JOIN orders o ON c.customer_id = o.customer_id<br>JOIN order_items oi ON o.order_id = oi.order_id<br>JOIN products p ON oi.product_id = p.product_id<br>GROUP BY c.customer_id, c.customer_name<br>)<br>SELECT customer_id, customer_name, total_spent,<br>DENSE_RANK() OVER (ORDER BY total_spent DESC) AS spend_rank<br>FROM customer_spend;<br>Results<br>2 Bob Smith 54.3 1<br>1 Alice Johnson 50.8 2<br>3 Charlie Brown 38.2 <)<br>4 Diana Prince 35.6 4<br>4 rows returned in 0.01 seconds Download<br><!-- End of picture text -->

#### **Query 6: Sequential Order History** **<mark>(</mark>** <mark>ROW_NUMBER</mark> **<mark>)</mark>** <mark>SQL</mark> 

- **Explanation:** Numbers each customer's orders sequentially <mark>(1, 2, 3...)</mark> based on transaction date. 

- 



<!-- Start of picture text -->
Gautocommit Rows [ vi Y (Save )(GRun)<br>ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_number<br>FROM orders;|<br>OS<br>Results<br>1 1001 01/05/2026 1<br>1 1002 01/15/2026 2<br>1 1003 02/01/2026 3<br>1 1013 02/20/2026 4<br>2 1004 01/10/2026 1<br>2 1005 01/22/2026 2<br>2 1006 02/12/2026 3<br>2 1014 02/22/2026 4<br>3 1007 01/11/2026 1<br>3 1008 02/05/2026 2<br>More than 10 rows available. Increase rows selector to view more rows.<br>10 rows returned in 0.00 seconds Download<br><!-- End of picture text -->

**Query 7: Running Revenue Over Time** **<mark>(</mark>** <mark>SUM OVER</mark> **<mark>)</mark>** 

> <mark>SQL</mark> ~~ee~~ 

- ~~ee~~ ● **Explanation:** Groups sales by order date and calculates the cumulative running total revenue across days. 



<!-- Start of picture text -->
ZAAutocommit Rows [0 vie Y ( Save ) (Run)<br>WITH daily_revenue AS (<br>SELECT o.order_date, SUM(oi.quantity * p.price) AS daily_total<br>FROM orders o<br>JOIN order_items oi ON o.order_id = oi.order_id<br>JOIN products p ON oi.product_id = p.product_id<br>GROUP BY o.order_date<br>)<br>SELECT order_date, daily_total,<br>SUM(daily_total) OVER (ORDER BY order_date) AS running_total_revenue<br>FROM daily_revenue;<br>Results<br>01/05/2026 98 98<br>01/10/2026 16.8 26.6<br>01/11/2026 11.2 378<br>01/14/2026 11.6 49.4<br>01/15/2026 23 72.4<br>01/22/2026 13.5 85.9<br>01/28/2026 12 97.9<br>02/01/2026 10 107.9<br>02/05/2026 145 122.4<br>02/10/2026 12 134.4<br>More than 10 rows available. Increase rows selector to view more rows.<br>10 rows returned in 0.02 seconds Download<br><!-- End of picture text -->

**Query 8: Order Recency & Retention Analysis** **<mark>(</mark>** <mark>LAG</mark> **)** 

##### <mark>SQL</mark> 

> ● **Explanation:** Uses <mark>LAG()</mark> to look up a customer's previous order date and calculates the number of days elapsed between consecutive orders. 

- 

Gautocommit Rows [7 vi@Y (Save )(GRun») ITH customer_orders AS ( SELECT customer_id, order_id, order_date, LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_order_date, COUNT(*) OVER (PARTITION BY customer_id) AS total_orders FROM orders ) SELECT customer_id, order_id, order_date, prev_order_date, (order_date - prev_order_date) AS days_between_orders FROM customer_orders WHERE total_orders > 1,| 

Results Explain Describe Saved SQL History mm 

|1<br>1001|01/05/2026|-|-|
|---|---|---|---|
|1<br>1002|01/15/2026|01/05/2026|10|
|1<br>1003|02/01/2026|01/15/2026|17|
|1<br>1013|02/20/2026|02/01/2026|19|
|2<br>1004|01/10/2026|-|-|
|2<br>1005|01/22/2026|01/10/2026|12|
|2<br>1006|02/12/2026|01/22/2026|21|
|2<br>1014|02/22/2026|02/12/2026|10|
|3<br>1007|01/11/2026|-|-|
|3<br>1008|02/05/2026|01/11/2026|25|
|Morethan10rowsavailable.|Increaserowsselec|tortoviewmorerows.||



10 rows returned in 0.01 seconds Download 

