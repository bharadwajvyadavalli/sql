-- CTE Example 1: Simple CTE
WITH Sales_CTE AS (
    SELECT 
        SalesPersonID, 
        SUM(SalesAmount) AS TotalSales
    FROM 
        Sales
    GROUP BY 
        SalesPersonID
)
SELECT 
    SalesPersonID, 
    TotalSales
FROM 
    Sales_CTE;

-- CTE Example 2: Recursive CTE
WITH EmployeeHierarchy AS (
    SELECT 
        EmployeeID,
        ManagerID,
        0 AS Level
    FROM 
        Employees
    WHERE 
        ManagerID IS NULL
    UNION ALL
    SELECT 
        e.EmployeeID,
        e.ManagerID,
        eh.Level + 1
    FROM 
        Employees e
    INNER JOIN 
        EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT 
    EmployeeID,
    ManagerID,
    Level
FROM 
    EmployeeHierarchy;

-- CTE Example 3: Multiple CTEs
WITH RegionSales AS (
    SELECT 
        RegionID, 
        SUM(SalesAmount) AS TotalSales
    FROM 
        Sales
    GROUP BY 
        RegionID
), RegionNames AS (
    SELECT 
        RegionID, 
        RegionName
    FROM 
        Regions
)
SELECT 
    rn.RegionName, 
    rs.TotalSales
FROM 
    RegionSales rs
JOIN 
    RegionNames rn ON rs.RegionID = rn.RegionID;

-- CTE Example 4: CTE with JOIN
WITH RecentSales AS (
    SELECT 
        SalesPersonID, 
        SalesAmount, 
        OrderDate
    FROM 
        Sales
    WHERE 
        OrderDate > '2023-01-01'
)
SELECT 
    rs.SalesPersonID, 
    sp.Name, 
    rs.SalesAmount
FROM 
    RecentSales rs
JOIN 
    SalesPersons sp ON rs.SalesPersonID = sp.ID;

-- CTE Example 5: Filtering with CTE
WITH HighValueSales AS (
    SELECT 
        SalesPersonID, 
        SalesAmount
    FROM 
        Sales
    WHERE 
        SalesAmount > 10000
)
SELECT 
    SalesPersonID, 
    COUNT(*) AS HighValueCount
FROM 
    HighValueSales
GROUP BY 
    SalesPersonID;

-- CTE Example 6: CTE with Aggregation
WITH MonthlySales AS (
    SELECT 
        SalesPersonID, 
        MONTH(OrderDate) AS SalesMonth, 
        SUM(SalesAmount) AS TotalSales
    FROM 
        Sales
    GROUP BY 
        SalesPersonID, 
        MONTH(OrderDate)
)
SELECT 
    SalesPersonID, 
    SalesMonth, 
    TotalSales
FROM 
    MonthlySales;

-- CTE Example 7: Combining CTEs
WITH CTE1 AS (
    SELECT 
        SalesPersonID, 
        COUNT(*) AS OrderCount
    FROM 
        Sales
    GROUP BY 
        SalesPersonID
), CTE2 AS (
    SELECT 
        SalesPersonID, 
        AVG(SalesAmount) AS AvgSalesAmount
    FROM 
        Sales
    GROUP BY 
        SalesPersonID
)
SELECT 
    c1.SalesPersonID, 
    c1.OrderCount, 
    c2.AvgSalesAmount
FROM 
    CTE1 c1
JOIN 
    CTE2 c2 ON c1.SalesPersonID = c2.SalesPersonID;

-- CTE Example 8: Window Function in CTE
WITH SalesRanking AS (
    SELECT 
        SalesPersonID, 
        SalesAmount, 
        RANK() OVER (PARTITION BY SalesPersonID ORDER BY SalesAmount DESC) AS SalesRank
    FROM 
        Sales
)
SELECT 
    SalesPersonID, 
    SalesAmount, 
    SalesRank
FROM 
    SalesRanking
WHERE 
    SalesRank = 1;

-- CTE Example 9: Nested CTE
WITH YearlySales AS (
    SELECT 
        SalesPersonID, 
        YEAR(OrderDate) AS SalesYear, 
        SUM(SalesAmount) AS TotalSales
    FROM 
        Sales
    GROUP BY 
        SalesPersonID, 
        YEAR(OrderDate)
), TopSalesPersons AS (
    SELECT 
        SalesPersonID, 
        SalesYear, 
        TotalSales,
        RANK() OVER (PARTITION BY SalesYear ORDER BY TotalSales DESC) AS SalesRank
    FROM 
        YearlySales
)
SELECT 
    SalesPersonID, 
    SalesYear, 
    TotalSales
FROM 
    TopSalesPersons
WHERE 
    SalesRank <= 3;

-- CTE Example 10: CTE with Update
WITH UpdatedSales AS (
    SELECT 
        SalesPersonID, 
        SalesAmount * 1.1 AS AdjustedSales
    FROM 
        Sales
)
UPDATE Sales
SET SalesAmount = us.AdjustedSales
FROM 
    Sales s
JOIN 
    UpdatedSales us ON s.SalesPersonID = us.SalesPersonID;
