-- Window Function Example 1: ROW_NUMBER
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    ROW_NUMBER() OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS RowNum
FROM 
    Sales;

-- Window Function Example 2: RANK
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    RANK() OVER(PARTITION BY SalesPersonID ORDER BY SalesAmount DESC) AS SalesRank
FROM 
    Sales;

-- Window Function Example 3: DENSE_RANK
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    DENSE_RANK() OVER(PARTITION BY SalesPersonID ORDER BY SalesAmount DESC) AS DenseRank
FROM 
    Sales;

-- Window Function Example 4: LAG
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    LAG(SalesAmount, 1, 0) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS PrevSales
FROM 
    Sales;

-- Window Function Example 5: LEAD
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    LEAD(SalesAmount, 1, 0) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS NextSales
FROM 
    Sales;

-- Window Function Example 6: NTILE
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    NTILE(4) OVER(PARTITION BY SalesPersonID ORDER BY SalesAmount DESC) AS Quartile
FROM 
    Sales;

-- Window Function Example 7: FIRST_VALUE
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    FIRST_VALUE(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS FirstSale
FROM 
    Sales;

-- Window Function Example 8: LAST_VALUE
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    LAST_VALUE(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastSale
FROM 
    Sales;

-- Window Function Example 9: CUME_DIST
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    CUME_DIST() OVER(PARTITION BY SalesPersonID ORDER BY SalesAmount DESC) AS CumulativeDist
FROM 
    Sales;

-- Window Function Example 10: PERCENT_RANK
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    PERCENT_RANK() OVER(PARTITION BY SalesPersonID ORDER BY SalesAmount DESC) AS PercentRank
FROM 
    Sales;

-- Window Function Example 11: PERCENTILE_CONT
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY SalesAmount) OVER(PARTITION BY SalesPersonID) AS MedianSales
FROM 
    Sales;

-- Window Function Example 12: PERCENTILE_DISC
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY SalesAmount) OVER(PARTITION BY SalesPersonID) AS DiscMedianSales
FROM 
    Sales;

-- Window Function Example 13: SUM
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    SUM(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS RunningTotal
FROM 
    Sales;

-- Window Function Example 14: AVG
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    AVG(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS RunningAvg
FROM 
    Sales;

-- Window Function Example 15: COUNT
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    COUNT(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS RunningCount
FROM 
    Sales;

-- Window Function Example 16: MAX
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    MAX(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS RunningMax
FROM 
    Sales;

-- Window Function Example 17: MIN
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    MIN(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS RunningMin
FROM 
    Sales;

-- Window Function Example 18: ROWS BETWEEN
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    SUM(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MovingTotal
FROM 
    Sales;

-- Window Function Example 19: RANGE BETWEEN
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    SUM(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate RANGE BETWEEN INTERVAL '7' DAY PRECEDING AND INTERVAL '7' DAY FOLLOWING) AS RangeTotal
FROM 
    Sales;

-- Window Function Example 20: Mixing Window Functions
SELECT 
    SalesPersonID, 
    OrderDate, 
    SalesAmount,
    ROW_NUMBER() OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS RowNum,
    SUM(SalesAmount) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS RunningTotal,
    LAG(SalesAmount, 1, 0) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS PrevSales,
    LEAD(SalesAmount, 1, 0) OVER(PARTITION BY SalesPersonID ORDER BY OrderDate) AS NextSales
FROM 
    Sales;
