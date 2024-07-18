DROP DATABASE IF EXISTS Northeastern_Coffee;
Create Database Northeastern_Coffee;
Use Northeastern_Coffee;

-- Create the BaristaManager table 
CREATE TABLE BaristaManager ( 
    MID INT PRIMARY KEY, 
    MFirstName VARCHAR(255) NOT NULL, 
    MLastName VARCHAR(255) NOT NULL, 
    MSalary DECIMAL(10, 2) NOT NULL, 
    MBonus DECIMAL(10, 2), 
    MBirthDate DATE NOT NULL,
    MAge INT,
    MGender VARCHAR(10)
    );
    
    -- Create a trigger to update MAge
DELIMITER //
CREATE TRIGGER calculate_age
BEFORE INSERT ON BaristaManager
FOR EACH ROW
SET NEW.MAge = TIMESTAMPDIFF(YEAR, NEW.MBirthDate, CURDATE());
//
DELIMITER ;
    
    
-- Create the CoffeeShop table 
CREATE TABLE CoffeeShop ( 
    ShopID INT PRIMARY KEY, 
    ShopName VARCHAR(255) NOT NULL, 
    ShopLocation VARCHAR(255) NOT NULL, 
    MID INT NOT NULL,  -- Assuming each coffee shop must have a manager
    FOREIGN KEY (MID) REFERENCES BaristaManager(MID) 
);

-- Create the CoffeeMachine table 
CREATE TABLE CoffeeMachine ( 
    MachineID INT PRIMARY KEY, 
    ShopID INT NOT NULL, 
    NoOfBlenders INT DEFAULT NULL,  -- Assuming not all machines have blenders
    FOREIGN KEY (ShopID) REFERENCES CoffeeShop(ShopID) 
);

-- Create the Customer table 
CREATE TABLE Customer ( 
    CID INT PRIMARY KEY, 
    CName VARCHAR(255) NOT NULL, 
    CPhNo VARCHAR(15) DEFAULT NULL,  -- Allowing phone number to be NULL
    CEmailID VARCHAR(255) DEFAULT NULL,  -- Allowing email to be NULL
    CGender VARCHAR(10), -- Assuming a VARCHAR field for gender
    CBirthdate DATE, -- Assuming a DATE field for birthdate
    CAge INT DEFAULT NULL -- Adding Age column with a default value
);

-- Create a trigger to update CAge
DELIMITER //
CREATE TRIGGER calculate_customer_age
BEFORE INSERT ON Customer
FOR EACH ROW
SET NEW.CAge = TIMESTAMPDIFF(YEAR, NEW.CBirthdate, CURDATE());
//
DELIMITER ;

-- Create the ManagerPhone table 
CREATE TABLE ManagerPhone ( 
    MID INT NOT NULL, 
    MPhNo VARCHAR(15) NOT NULL, 
    FOREIGN KEY (MID) REFERENCES BaristaManager(MID) 
);

-- Create the StaffMember table 
CREATE TABLE StaffMember ( 
    SID INT PRIMARY KEY, 
    SName VARCHAR(255) NOT NULL, 
    SBirthDate DATE NOT NULL, 
    SSalary DECIMAL(10, 2) NOT NULL, 
    ShopID INT NOT NULL, 
    SGender VARCHAR(10), -- Assuming a VARCHAR field for gender
    SAge INT, -- Adding Age column
    FOREIGN KEY (ShopID) REFERENCES CoffeeShop(ShopID) 
);

-- Create a trigger to update Age
DELIMITER //
CREATE TRIGGER calculate_staff_member_age
BEFORE INSERT ON StaffMember
FOR EACH ROW
SET NEW.SAge = TIMESTAMPDIFF(YEAR, NEW.SBirthDate, CURDATE());
//
DELIMITER ;

-- Create the QualityInspector table 
CREATE TABLE QualityInspector ( 
    InspectorID INT PRIMARY KEY, 
    InspectorName VARCHAR(255) NOT NULL
);

-- Create the Orders table 
CREATE TABLE Orders ( 
    OrderID INT PRIMARY KEY, 
    CID INT NOT NULL, 
    TransactionDate DATE DEFAULT NULL,  -- Allowing transaction date to be NULL
    FOREIGN KEY (CID) REFERENCES Customer(CID) 
);

-- Create the Product table 
CREATE TABLE Product ( 
    ProductID INT PRIMARY KEY, 
    ProductName VARCHAR(255) NOT NULL, 
    ProductPrice DECIMAL(10, 2) NOT NULL
);

-- Create the Contain table 
CREATE TABLE Contain ( 
    OrderID INT NOT NULL, 
    ProductID INT NOT NULL, 
    Quantity INT NOT NULL, 
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) 
);

-- Create the Customer_Refer table 
CREATE TABLE Customer_Refer ( 
    ReferrerCID INT NOT NULL, 
    ReferredCID INT NOT NULL, 
    FOREIGN KEY (ReferrerCID) REFERENCES Customer(CID), 
    FOREIGN KEY (ReferredCID) REFERENCES Customer(CID) 
);
DROP TABLE INSPECBTING;
-- Create the Inspecting table 
CREATE TABLE Inspecting ( 
    ShopID INT NOT NULL, 
    InspectorID INT NOT NULL, 
    DateofInspection DATE DEFAULT NULL,  -- Allowing date of inspection to be NULL
    FOREIGN KEY (ShopID) REFERENCES CoffeeShop(ShopID), 
    FOREIGN KEY (InspectorID) REFERENCES QualityInspector(InspectorID) 
);

-- Create the Brews table 
CREATE TABLE Brews ( 
    ProductID INT NOT NULL, 
    MachineID INT NOT NULL, 
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID), 
    FOREIGN KEY (MachineID) REFERENCES CoffeeMachine(MachineID) 
);