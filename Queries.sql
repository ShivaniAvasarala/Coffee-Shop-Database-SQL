USE Northeastern_Coffee;
SELECT * FROM BaristaManager;
Select * from customer;
select * from staffmember;

#1. CID and CName of customers who referred and who they referred 
SELECT 
    R.ReferrerCID AS Referrer,
	C1.CName AS ReferrerName,
    R.ReferredCID AS Referred,
    C2.CName AS ReferredName
FROM 
    Customer_Refer R
JOIN 
    Customer C1 ON R.ReferrerCID = C1.CID
JOIN 
    Customer C2 ON R.ReferredCID = C2.CID;
   
   
   
#2. Coffee products with sales and their total revenue
SELECT
    P.ProductName,
    SUM(C.Quantity) AS TotalSales,
    SUM(C.Quantity * P.ProductPrice) AS TotalRevenue
FROM
    Product P
JOIN
    Contain C ON P.ProductID = C.ProductID
GROUP BY
    P.ProductName
ORDER BY
    TotalSales DESC;


    
#5. Date of Inspection for each shop and the inspector name
SELECT I.ShopID, I.DateofInspection, Q.InspectorID, Q.InspectorName
FROM Inspecting I
JOIN QualityInspector Q ON I.InspectorID = Q.InspectorID;

#6. Total quantity sold per coffee
SELECT P.ProductName, SUM(C.Quantity) AS TotalQuantitySold
FROM Product P
JOIN Contain C ON P.ProductID = C.ProductID
GROUP BY P.ProductName;

#7. Customers who referred others and the number of referrals:
SELECT
    C.CID AS ReferrerCID,
    C.CName AS ReferrerName,
    COUNT(R.ReferredCID) AS NumberOfReferrals
FROM
    Customer C
LEFT JOIN
    Customer_Refer R ON C.CID = R.ReferrerCID
WHERE
    R.ReferredCID IS NOT NULL
GROUP BY
    C.CID, C.CName;
    
#8. List the coffee shops with the total salary (including bonuses) paid to all staff (baristas and managers) in each shop:
SELECT
    cs.ShopID,
    cs.ShopName,
    SUM(bm.MSalary + COALESCE(bm.MBonus, 0) + COALESCE(sm.SSalary, 0)) AS TotalSalary
FROM
    CoffeeShop cs
JOIN
    BaristaManager bm ON cs.MID = bm.MID
LEFT JOIN
    StaffMember sm ON cs.ShopID = sm.ShopID
GROUP BY
    cs.ShopID, cs.ShopName;
    

#Number of days since the last inspection for each shop:
SELECT
    s.ShopID,
    COALESCE(DATEDIFF(CURDATE(), MAX(i.DateofInspection)), -1) AS DaysSinceLastInspection
FROM
    CoffeeShop s
LEFT JOIN
    Inspecting i ON s.ShopID = i.ShopID
GROUP BY
    s.ShopID;


#9. Find the coffee shop with the highest number of sales and list the sales information:

WITH RankedProducts AS (
    SELECT
        C.ShopID,
        C.ShopName,
        C.ShopLocation,
        P.ProductID,
        P.ProductName,
        SUM(O.Quantity) AS TotalSales,
        RANK() OVER (PARTITION BY C.ShopID ORDER BY SUM(O.Quantity) DESC) AS ProductRank
    FROM
        CoffeeShop C
        JOIN CoffeeMachine CM ON C.ShopID = CM.ShopID
        JOIN Brews B ON CM.MachineID = B.MachineID
        JOIN Product P ON B.ProductID = P.ProductID
        JOIN Contain O ON P.ProductID = O.ProductID
        JOIN Orders Ord ON O.OrderID = Ord.OrderID
    GROUP BY
        C.ShopID,
        C.ShopName,
        C.ShopLocation,
        P.ProductID,
        P.ProductName
)
SELECT
    ShopName,
    ShopLocation,
    ProductName,
    TotalSales
FROM
    RankedProducts
WHERE
    ProductRank = 1;