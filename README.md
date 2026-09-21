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

<img width="333" height="414" alt="image" src="https://github.com/user-attachments/assets/570306ff-a4c5-4055-8546-5f377c57f0fc" />

**Figure 1:** **_This shows tables creation_** 

<img width="378" height="167" alt="image" src="https://github.com/user-attachments/assets/2ac46fa5-0222-4d03-8d4d-cc0e2824fb23" />

**Figure 2:** **_This figure show all tables we created_** 

### **Sample Data Insertion** 

The database was populated with sample data using Oracle's <mark>INSERT ALL</mark> statement to load records across all four tables efficiently. 

<img width="605" height="154" alt="image" src="https://github.com/user-attachments/assets/07a32fb8-7b94-469a-9204-9a27108b3e70" />
**Figure 3:** **_This figure shows the customer data entry_** 

<img width="665" height="261" alt="product insertion" src="https://github.com/user-attachments/assets/07ee4bd2-2e71-4a2c-805a-4a3e4d341ec4" />

**Figure 4:** **_This figure shows the orders data entry_** 

<img width="538" height="592" alt="order-items" src="https://github.com/user-attachments/assets/e3d55c10-08e9-4234-ba6f-ad42fc6b7cf4" />

**Figure 5:** **_This figure shows the order_items data entry_** 

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

<img width="426" height="633" alt="join-query 1" src="https://github.com/user-attachments/assets/d81ac485-3655-475b-96d9-a8ed5f9bb2f9" />


##### **Query 2: Order Items with Product Details (JOIN)** <mark>SQL</mark> 

- **Explanation:** Joins <mark>ORDER_ITEMS</mark> with <mark>PRODUCTS</mark> to display product names, categories, unit prices, and quantities for each ordered item. 

<img width="555" height="622" alt="join-query 2" src="https://github.com/user-attachments/assets/234e3fc7-688d-407e-98f2-cbaa0d6bd477" />

##### **Query 3: Customers and Their Orders (LEFT JOIN)** <mark>SQL</mark> 

- **Explanation:** Displays all registered customers, including those who have not yet placed an order (shown with <mark>NULL</mark> values in order columns). 

<img width="1343" height="572" alt="join-query 3" src="https://github.com/user-attachments/assets/5ce3b514-2537-4dfe-b3c7-942228d63054" />


### **5.2. Common Table Expression (CTE) Query** 

**Query 4: High-Value Customers (Spending Above Average)** <mark>SQL</mark> 

- **Explanation:** Uses a CTE to calculate total customer expenditure, then filters for customers who spent more than the average amount across all customers. 

<img width="580" height="354" alt="CTE-QUERY" src="https://github.com/user-attachments/assets/5006f8d0-f1fc-48d2-8f3c-d2322af7ed29" />


### **5.3. Window-Function Queries** 

**Query 5: Ranking Customers by Spend** **<mark>(</mark>** <mark>DENSE_RANK</mark> **<mark>)</mark>** <mark>SQL</mark> 

- **Explanation:** Ranks customers from highest to lowest spender using <mark>DENSE_RANK(),</mark> giving tied amounts the same rank without leaving gaps. 

<img width="583" height="390" alt="Window-function queries-1" src="https://github.com/user-attachments/assets/2de39ce4-251b-41b8-9839-e1e62dc0e42e" />


#### **Query 6: Sequential Order History** **<mark>(</mark>** <mark>ROW_NUMBER</mark> **<mark>)</mark>** <mark>SQL</mark> 

- **Explanation:** Numbers each customer's orders sequentially <mark>(1, 2, 3...)</mark> based on transaction date. 

<img width="658" height="539" alt="window-function queries-2" src="https://github.com/user-attachments/assets/f36a9be8-9d3f-4bba-876e-75b02c37ec89" />


**Query 7: Running Revenue Over Time** **<mark>(</mark>** <mark>SUM OVER</mark> **<mark>)</mark>** 

> <mark>SQL</mark> ~~ee~~ 

- ~~ee~~ ● **Explanation:** Groups sales by order date and calculates the cumulative running total revenue across days. 

<img width="553" height="550" alt="Window-function queries-3" src="https://github.com/user-attachments/assets/9d68c39a-2a4a-4fe1-8237-86f54fe832d8" />

**Query 8: Order Recency & Retention Analysis** **<mark>(</mark>** <mark>LAG</mark> **)** 

##### <mark>SQL</mark> 

> ● **Explanation:** Uses <mark>LAG()</mark> to look up a customer's previous order date and calculates the number of days elapsed between consecutive orders. 

<img width="720" height="552" alt="Window-function queries-4" src="https://github.com/user-attachments/assets/640508d3-6283-4076-8948-72aa319f8c5d" />


