CREATE TABLE Customer (
	CustomerID INT NOT NULL,
    FirstName VARCHAR(20) NOT NULL UNIQUE, 
    LastName VARCHAR(25) NOT NULL UNIQUE, 
	PhoneNumber DECIMAL(11) NOT NULL UNIQUE,
    PRIMARY KEY(CustomerID)
);
/*show customer table*/
SELECT * FROM Customer;
DROP TABLE Customer;

CREATE TABLE Order_ (
	OrderID INT NOT NULL,
    OrderDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    PRIMARY KEY(OrderID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);
/*show order table*/
SELECT * FROM Order_;
DROP TABLE Order_;

CREATE TABLE Product (
	ProductID INT NOT NULL,
    ProductName VARCHAR(10) NOT NULL UNIQUE,
    Price DECIMAL(3,2) NOT NULL,
    PRIMARY KEY(ProductID)
);
/*show product table*/
SELECT * FROM Product;
DROP TABLE Product;

CREATE TABLE OrderDetail (
	OrderID INT,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Discount DECIMAL(3,2) NOT NULL,
    FOREIGN KEY(OrderID) REFERENCES Order_(OrderID),
	FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);
/*show orderDetail table*/
SELECT * FROM OrderDetail;
DROP TABLE OrderDetail;



/*----------------------------------------------------------------------*/
INSERT INTO Customer VALUES(1, 'John', 'Jones', 37066666666);
INSERT INTO Customer VALUES(2, 'Alice', 'Batman', 37063334466);

INSERT INTO Order_ VALUES(1, '2019-10-05'); 

INSERT INTO OrderDetail VALUES(1, 1, 2, 0);
INSERT INTO OrderDetail(ProductID, Quantity, Discount) VALUES(1, 2, 1, 0);



    