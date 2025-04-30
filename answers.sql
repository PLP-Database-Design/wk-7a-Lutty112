Question 1: Achieving 1NF (First Normal Form)
Issue: The Products column in ProductDetail contains multiple values (comma-separated), which violates 1NF.
Solution: We split the comma-separated values into multiple rows using UNION ALL (manual method). Ensure each row contains a single product only.

-- Step 1 Select a database with the data
 USE staff;

-- Step 2 Manual 1NF table with each product as a row
   SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
   UNION ALL
   SELECT 101, 'John Doe', 'Mouse'
   UNION ALL
   SELECT 102, 'Jane Smith', 'Tablet'
   UNION ALL
   SELECT 102, 'Jane Smith', 'Keyboard'
   UNION ALL
   SELECT 102, 'Jane Smith', 'Mouse'
   UNION ALL
   SELECT 103, 'Emily Clark', 'Phone';

Question 2: Achieving 2NF (Second Normal Form)
Issue: The CustomerName column depends only on OrderID, not on the whole composite key (OrderID, Product), violating 2NF. 
Solution: Ensure, Orders: holds OrderID and CustomerName and OrderItems: holds OrderID, Product, and Quantity.

-- Step 3 Create Orders Table
 CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 4 Insert Values into Orders Table
 INSERT INTO Orders 
 VALUES 
      (101, 'John Doe'),
      (102, 'Jane Smith'),
      (103, 'Emily Clark');

-- Step 5 Create OrderItems Table
 CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 6 Insert values into OrderItems Table
 INSERT INTO OrderItems 
 VALUES 
       (101, 'Laptop', 2),
       (101, 'Mouse', 1),
       (102, 'Tablet', 3),
       (102, 'Keyboard', 1),
       (102, 'Mouse', 2), 
       (103, 'Phone', 1);
