 -- Step 1 Use the database to work with
 USE staff;


-- Question 1; Create a table with the data 
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(100)
   );
INSERT INTO ProductDetail(OrderID, CustomerName, Products)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- Question 2; Create a Orders table with the data,
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
   );

-- Step 2 Insert Values into Orders Table
 INSERT INTO Orders  (OrderID, CustomerName)
 VALUES 
      (101, 'John Doe'),
      (102, 'Jane Smith'),
      (103, 'Emily Clark');

-- Step 3 Create OrderItems Table with the data,
 CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
  );

-- Step 4 Insert values into OrderItems Table
 INSERT INTO OrderItems (OrderID, Product, Quantity)
 VALUES 
       (101, 'Laptop', 2),
       (101, 'Mouse', 1),
       (102, 'Tablet', 3),
       (102, 'Keyboard', 1),
       (102, 'Mouse', 2), 
       (103, 'Phone', 1);
