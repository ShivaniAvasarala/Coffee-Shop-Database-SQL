Use Northeastern_Coffee;
DELETE FROM Brews;
DELETE FROM Inspecting;
DELETE FROM Customer_Refer;
DELETE FROM Contain;
DELETE FROM Product;
DELETE FROM Orders;
DELETE FROM QualityInspector;
DELETE FROM StaffMember;
DELETE FROM ManagerPhone;
DELETE FROM Customer;
DELETE FROM CoffeeMachine;
DELETE FROM CoffeeShop;
DELETE FROM BaristaManager;

 -- Insert data into BaristaManager
INSERT INTO BaristaManager (MID, MFirstName, MLastName, MSalary, MBonus, MBirthDate, MAge, MGender)
VALUES
    (1, 'Ram', 'Kumar', 55000.00, NULL, '1980-05-15', NULL, 'Male'),
    (2, 'Emily', 'Davis', 80000.00, 6000.00, '1965-08-25', NULL, 'Female'),
    (3, 'Alex', 'Johnson', 70000.00, 4500.00, '1972-03-10', NULL, 'Male'),
    (4, 'Sophia', 'Williams', 78000.00, NULL, '1968-11-30', NULL, 'Female'),
    (5, 'William', 'Brown', 76000.00, 4800.00, '1975-06-20', NULL, 'Male');

-- Insert data into CoffeeShop
INSERT INTO CoffeeShop (ShopID, ShopName, ShopLocation, MID) 

VALUES 

    (101, 'Capital Coffee Hungtington', 'Boston', 1), 

    (102, 'Capital Coffee Terry', 'Seattle', 2), 

    (103, 'Capital Coffee', 'Boston', 3), 

    (104, 'Capital Coffee NW', 'Miami', 4), 

    (105, 'Capital Coffee Hawkins', 'Charlotte', 5); 
    

-- Insert data into CoffeeMachine 

INSERT INTO CoffeeMachine (MachineID, ShopID, NoOfBlenders) 

VALUES 

    (501, 101, 2), 

    (502, 102, 3), 

    (503, 103, 1), 

    (504, 104, 2), 

    (505, 105, 1); 

-- Insert data into Customer
INSERT INTO Customer (CID, CName, CPhNo, CEmailID, CGender, CBirthdate, CAge)
VALUES
    (1001, 'Sarah Johnson', '+1(123)456-7890', 'sarah@gmail.com', 'Female', '1985-02-20', NULL),
    (1002, 'Carlos Rodriguez', '+1(234)567-8901', 'carlos@yahoo.com', 'Male', '1990-06-15', NULL),
    (1003, 'Maria Garcia', '+1(345)678-9012', 'maria@hotmail.com', 'Female', '1988-04-10', NULL),
    (1004, 'David Smith', '+1(456)789-0123', 'david@gmail.com', 'Male', '1982-09-30', NULL),
    (1005, 'Amina Ahmed', '+1(567)890-1234', 'amina@gmail.com', 'Female', '1995-06-20', NULL),
    (1006, 'Pierre Dupont', '+1(678)901-2345', 'pierre@gmail.com', 'Male', '1977-11-15', NULL),
    (1007, 'Elena Petrov', '+1(789)012-3456', 'elena@yahoo.com', 'Female', '1989-03-10', NULL),
    (1008, 'Hiroshi Tanaka', '+1(890)123-4567', 'hiroshi@hotmail.com', 'Male', '1970-08-25', NULL),
    (1009, 'Isabella Rossi', '+1(901)234-5678', 'isabella@gmail.com', 'Female', '1984-02-10', NULL),
    (1010, 'Ahmed Hassan', '+1(012)345-6789', 'ahmed@gmail.com', 'Male', '1992-07-05', NULL),
    (1011, 'Sophie Martin', '+1(123)456-7890', 'sophie@gmail.com', 'Female', '1983-04-18', NULL),
    (1012, 'Luca Ferrari', '+1(234)567-8901', 'luca@yahoo.com', 'Male', '1975-09-29', NULL),
    (1013, 'Mia Svensson', '+1(345)678-9012', 'mia@hotmail.com', 'Female', '1998-12-05', NULL),
    (1014, 'Javier Gomez', '+1(456)789-0123', 'javier@gmail.com', 'Male', '1973-06-30', NULL),
    (1015, 'Leila Kim', '+(567) 890-1234', 'leila@gmail.com', 'Female', '1991-10-20', NULL),
    (1016, 'Andrei Ivanov', '+1(678)901-2345', 'andrei@gmail.com', 'Male', '1980-01-15', NULL),
    (1017, 'Emma Wilson', '+1(789)012-3456', 'emma@yahoo.com', 'Female', '1994-05-02', NULL),
    (1018, 'Mohammad Ali', '+1(890)123-4567', 'mohammad@hotmail.com', 'Male', '1978-11-30', NULL),
    (1019, 'Sophie Fischer', '+1(901)234-5678', 'sophie@gmail.com', 'Female', '1987-03-25', NULL),
   
   (1020, 'Juan Lopez', '+1(012)345-6789', 'juan@gmail.com', 'Male', '1986-08-10', NULL);
-- Insert data into ManagerPhone
INSERT INTO ManagerPhone (MID, MPhNo) 

VALUES 

    (1, '+1(123)456-7890'), 

    (1, '+1(234)567-8901'), 

    (2, '+1(345)678-9012'), 

    (2, '+1(456)789-0123'), 

    (3, '+1(567)890-1234'), 

    (3, '+1(678)901-2345'), 

    (4, '+1(789)012-3456'), 

    (4, '+1(890)123-4567'), 

    (5, '+1(901)234-5678'), 

    (5, '+1(012)345-6789'); 

-- Insert data into StaffMember
INSERT INTO StaffMember (SID, SName, SSalary, SBirthDate, ShopID, SGender, SAge)
VALUES
    (201, 'Daniel Brown', 25.00, '1990-01-15', 101, 'Male', NULL),
    (202, 'Maria Garcia', 23.50, '1985-03-22', 101, 'Female', NULL),
    (203, 'Andreas Müller', 24.00, '1987-07-10', 102, 'Male', NULL),
    (204, 'Anna Smith', 26.00, '1988-12-05', 102, 'Female', NULL),
    (205, 'Ahmed Khan', 22.50, '1991-05-20', 103, 'Male', NULL),
    (206, 'Maria Rodriguez', 21.75, '1993-09-18', 103, 'Female', NULL),
    (207, 'Fabio Moretti', 25.50, '1986-04-02', 104, 'Male', NULL),
    (208, 'Yuki Yamamoto', 24.25, '1989-11-15', 104, 'Female', NULL),
    (209, 'Alessio Ricci', 22.75, '1992-06-30', 105, 'Male', NULL),
    (210, 'Fatima Ahmed', 23.75, '1995-02-25', 105, 'Female', NULL),
    (211, 'Jean Dupont', 25.00, '1990-08-10', 101, 'Male', NULL),
    (212, 'Elena Petrova', 23.50, '1985-04-25', 101, 'Female', NULL),
    (213, 'Toshihiro Tanaka', 24.00, '1987-12-15', 102, 'Male', NULL),
    (214, 'Sofia Rossi', 26.00, '1988-07-18', 102, 'Female', NULL),
    (215, 'Alejandro Gomez', 22.50, '1991-03-10', 103, 'Male', NULL);

-- Insert data into QualityInspector
INSERT INTO QualityInspector (InspectorID, InspectorName) 

VALUES 

    (301, 'Taylor Swift'), 

    (302, 'Selena Gomez'), 

    (303, 'Ryan Renolds')
    ; 

-- Insert data into Orders
INSERT INTO Orders (OrderID, CID, TransactionDate)
VALUES
    (10006, 1006, '2023-11-15'),
    (10007, 1007, '2023-11-15'),
    (10008, 1008, '2023-11-14'),
    (10009, 1009, '2023-11-20'),
    (10010, 1008, '2023-11-20'),
    (10011, 1011, '2023-11-20'),
    (10012, 1012, '2023-11-21'),
    (10013, 1013, '2023-11-22'),
    (10014, 1014, '2023-11-23'),
    (10015, 1003, '2023-11-23'),
    (10016, 1016, '2023-11-23'),
    (10017, 1017, '2023-11-24'),
    (10018, 1018, '2023-11-27'),
    (10019, 1001, '2023-11-29'),
    (10020, 1020, '2023-11-29');


-- Insert data into Product 

INSERT INTO Product (ProductID, ProductName, ProductPrice) 
VALUES 
    (401, 'Espresso', 8.75), 
    (402, 'Cappuccino', 10.25), 
    (403, 'Drip Coffee', 9.50), 
    (404, 'French Press', 12.00), 
    (405, 'Cold Brew', 11.25),
    (406, 'Mocha', 14.00), 
    (407, 'Latte', 13.75), 
    (408, 'Macchiato', 9.75), 
    (409, 'Iced Coffee', 8.50), 
    (410, 'Chai Latte', 15.00), 
    (411, 'Hot Chocolate', 12.75), 
    (412, 'Caramel Macchiato', 11.50), 
    (413, 'Matcha Latte', 14.25), 
    (414, 'Turmeric Latte', 10.50), 
    (415, 'Affogato', 14.50);
  


-- Insert data into Contain (Orders to Product) 

INSERT INTO Contain (OrderID, ProductID, Quantity)
VALUES
    (10007, 404, 2),
    (10015, 405, 1),
    (10009, 406, 3),
    (10006, 407, 2),
    (10012, 408, 4),
    (10008, 409, 2),
    (10006, 410, 2),
    (10007, 411, 1),
    (10007, 412, 3),
    (10008, 413, 2),
    (10009, 414, 2),
    (10010, 415, 4),
    (10011, 401, 3),
    (10012, 402, 1),
    (10013, 403, 3),
    (10014, 404, 2),
    (10015, 405, 2),
    (10015, 401, 1),
    (10016, 402, 4),
    (10017, 403, 1),
    (10017, 404, 2),
    (10018, 405, 3),
    (10019, 401, 1),
    (10019, 402, 2),
    (10020, 403, 2),
    (10020, 404, 3),
    (10020, 405, 2);

  

-- Insert data into Customer_Refer 

INSERT INTO Customer_Refer (ReferrerCID, ReferredCID) 

VALUES 

    (1001, 1002), 

    (1001, 1013), 

    (1003, 1004), 

    (1014, 1009), 

    (1008, 1001), 

    (1007, 1010), 

    (1011, 1015), 

    (1002, 1009), 

    (1014, 1017), 

    (1019, 1018); 
 

-- Insert data into Inspecting (CoffeeShop to QualityInspector) 

INSERT INTO Inspecting (ShopID, InspectorID, DateofInspection) 

VALUES 

    (101, 301, '2023-11-05'), 

    (102, 302, '2023-11-05'), 

    (103, 301, '2023-11-07'), 

    (104, 303, '2023-11-09'), 

    (105, 301, '2023-11-09'); 

  

-- Insert data into Brews (Product to CoffeeMachine) 

INSERT INTO Brews (ProductID, MachineID)
VALUES
    (401, 501),
    (401, 501),
    (401, 503),
    (401, 502),
    (401, 505),
    (402, 501),
    (402, 502),
    (402, 501),
    (402, 504),
    (402, 502),
    (403, 501),
    (403, 502),
    (403, 501),
    (403, 504),
    (403, 505),
    (404, 501),
    (404, 502),
    (404, 503),
    (404, 502),
    (404, 505),
    (405, 501),
    (405, 501),
    (405, 503),
    (405, 504),
    (405, 505),
    (406, 501),
    (406, 502),
    (406, 503),
    (407, 501),
    (407, 502),
    (408, 501),
    (408, 502),
    (408, 501),
    (408, 504),
    (409, 501),
    (409, 502),
    (410, 501),
    (410, 502),
    (411, 501),
    (412, 501),
    (412, 502),
    (412, 501),
    (413, 501),
    (413, 502),
    (414, 501),
    (414, 502),
    (415, 501),
    (415, 502),
    (415, 503),
    (415, 501);