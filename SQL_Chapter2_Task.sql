create database sales_management; use sales_management;
create table productlines(productLine varchar(50) primary key, textDescription text, htmldescription text, image blob);
CREATE TABLE products (
    productCode VARCHAR(15) PRIMARY KEY,
    productName VARCHAR(70),
    productLine VARCHAR(50),
    productScale VARCHAR(10),
    productVendor VARCHAR(50),
    productDescription TEXT,
    quantityInStock INT,
    buyPrice DECIMAL(10,2),
    MSRP DECIMAL(10,2),
FOREIGN KEY (productLine)REFERENCES productlines(productLine));
CREATE TABLE offices (
    officeCode VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50),
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    postalCode VARCHAR(15),
    territory VARCHAR(10));
    
CREATE TABLE employees (
    employeeNumber INT PRIMARY KEY,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100),
    officeCode VARCHAR(10),
    reportsTo INT,
    jobTitle VARCHAR(50),
FOREIGN KEY (officeCode)
REFERENCES offices(officeCode),
FOREIGN KEY (reportsTo)
REFERENCES employees(employeeNumber));
CREATE TABLE customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(50),
    contactLastName VARCHAR(50),
    contactFirstName VARCHAR(50),
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(15),
    country VARCHAR(50),
    salesRepEmployeeNumber INT,
    creditLimit DECIMAL(10,2),
FOREIGN KEY (salesRepEmployeeNumber)REFERENCES employees(employeeNumber));

CREATE TABLE orders (
    orderNumber INT PRIMARY KEY,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    status VARCHAR(15),
    comments TEXT,
    customerNumber INT,FOREIGN KEY (customerNumber)REFERENCES customers(customerNumber));

CREATE TABLE payments (
    customerNumber INT,
    checkNumber VARCHAR(50),
    paymentDate DATE,
    amount DECIMAL(10,2),
PRIMARY KEY (customerNumber, checkNumber),FOREIGN KEY (customerNumber)REFERENCES customers(customerNumber));

CREATE TABLE orderdetails (
    orderNumber INT,
    productCode VARCHAR(15),
    quantityOrdered INT,
    priceEach DECIMAL(10,2),
    orderLineNumber INT,
PRIMARY KEY (orderNumber, productCode),
FOREIGN KEY (orderNumber)REFERENCES orders(orderNumber),
FOREIGN KEY (productCode)REFERENCES products(productCode));

INSERT INTO productlines
(productLine, textDescription, htmlDescription, image)VALUES
('Classic Cars', 'Classic car models', 'Classic car models', NULL),
('Motorcycles', 'Motorcycle models', 'Motorcycle models', NULL),
('Planes', 'Aircraft models', 'Aircraft models', NULL),
('Ships', 'Ship models', 'Ship models', NULL),
('Trucks and Buses', 'Truck and bus models', 'Truck and bus models', NULL);

select * from productlines;

INSERT INTO products
(productCode, productName, productLine, productScale, productVendor,
 productDescription, quantityInStock, buyPrice, MSRP)VALUES
('P001', '1969 Mustang', 'Classic Cars', '1:18', 'AutoArt','1969 Ford Mustang model', 50, 35.00, 55.00),
('P002', 'Harley Davidson', 'Motorcycles', '1:18', 'Minichamps','Harley Davidson motorcycle model', 40, 28.00, 45.00),
('P003', 'Boeing 747', 'Planes', '1:200', 'Skyline','Boeing 747 aircraft model', 30, 45.00, 70.00),
('P004', 'Titanic', 'Ships', '1:700', 'Revell','Titanic ship model', 25, 32.00, 50.00),
('P005', 'Volvo Bus', 'Trucks and Buses', '1:50', 'Welly','Volvo bus model', 35, 22.00, 38.00);
select * from products;
INSERT INTO offices(officeCode, city, phone, addressLine1, addressLine2,
 state, country, postalCode, territory)VALUES
('1', 'Bangalore', '080-40010001', 'MG Road', 'Building A','Karnataka', 'India', '560001', 'APAC'),
('2', 'Chennai', '044-40010002', 'Anna Salai', 'Building B','Tamil Nadu', 'India', '600002', 'APAC'),
('3', 'Mumbai', '022-40010003', 'Andheri East', 'Building C','Maharashtra', 'India', '400069', 'APAC'),
('4', 'Delhi', '011-40010004', 'Connaught Place', 'Building D','Delhi', 'India', '110001', 'APAC'),
('5', 'Hyderabad', '040-40010005', 'Hitech City', 'Building E','Telangana', 'India', '500081', 'APAC');

select * from offices;

INSERT INTO employees
(employeeNumber, lastName, firstName, extension, email,
 officeCode, reportsTo, jobTitle)VALUES
(1001, 'Kumar', 'Arun', 'x101', 'arun@example.com','1', NULL, 'Sales Manager'),
(1002, 'Sharma', 'Priya', 'x102', 'priya@example.com','1', 1001, 'Sales Rep'),
(1003, 'Ravi', 'Karthik', 'x103', 'karthik@example.com','2', 1001, 'Sales Rep'),
(1004, 'Iyer', 'Meena', 'x104', 'meena@example.com','3', 1001, 'Sales Rep'),
(1005, 'Das', 'Rahul', 'x105', 'rahul@example.com','4', 1001, 'Sales Rep');

select * from employees;

INSERT INTO customers
(customerNumber, customerName, contactLastName, contactFirstName,
 phone, addressLine1, addressLine2, city, state, postalCode,
 country, salesRepEmployeeNumber, creditLimit)
VALUES
(101, 'ABC Motors', 'Kumar', 'Ravi',
 '9876543210', 'MG Road', 'Near Metro', 'Bangalore',
 'Karnataka', '560001', 'India', 1002, 50000.00),

(102, 'Speed Auto', 'Sharma', 'Anita',
 '9876543211', 'Anna Salai', 'Building 10', 'Chennai',
 'Tamil Nadu', '600002', 'India', 1003, 60000.00),

(103, 'City Cars', 'Patel', 'Raj',
 '9876543212', 'Andheri East', 'Building 5', 'Mumbai',
 'Maharashtra', '400069', 'India', 1004, 45000.00),

(104, 'Capital Motors', 'Singh', 'Neha',
 '9876543213', 'Connaught Place', 'Building 7', 'Delhi',
 'Delhi', '110001', 'India', 1005, 70000.00),

(105, 'Deccan Auto', 'Reddy', 'Vijay',
 '9876543214', 'Hitech City', 'Building 3', 'Hyderabad',
 'Telangana', '500081', 'India', 1002, 55000.00);
 
 select * from customers;
 
 INSERT INTO orders
(orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
VALUES
(10001, '2026-09-01', '2026-09-10', '2026-09-05', 'Shipped',
 'Delivered on time', 101),

(10002, '2026-09-02', '2026-09-12', '2026-09-07', 'Shipped',
 'Customer confirmed delivery', 102),

(10003, '2026-09-05', '2026-09-15', NULL, 'In Process',
 'Preparing for shipment', 103),

(10004, '2026-09-07', '2026-09-17', NULL, 'In Process',
 'Order being processed', 104),

(10005, '2026-09-10', '2026-09-20', '2026-09-14', 'Shipped',
 'Delivered successfully', 105);
 
 select * from orders;
 
 INSERT INTO payments
(customerNumber, checkNumber, paymentDate, amount)
VALUES
(101, 'CHK1001', '2026-09-05', 25000.00),
(102, 'CHK1002', '2026-09-07', 30000.00),
(103, 'CHK1003', '2026-09-10', 20000.00),
(104, 'CHK1004', '2026-09-12', 40000.00),
(105, 'CHK1005', '2026-09-15', 35000.00);

select * from payments;

INSERT INTO orderdetails
(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)VALUES
(10001, 'P001', 2, 55.00, 1),
(10002, 'P002', 1, 45.00, 1),
(10003, 'P003', 3, 70.00, 1),
(10004, 'P004', 2, 50.00, 1),
(10005, 'P005', 4, 38.00, 1);
select * from orderdetails;

