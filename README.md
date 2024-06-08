# SQL Window Functions and CTEs

This repository contains various examples of SQL queries using window functions and Common Table Expressions (CTEs). These examples are organized into separate SQL files for easy reference and use.

## Files

- **CTEs.sql**: Contains 10 examples of SQL queries using Common Table Expressions.
- **WindowFunctions.sql**: Contains 20 examples of SQL queries using various window functions like ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, and more.

## Introduction to SQL

Structured Query Language (SQL) is a standard programming language used for managing and manipulating relational databases. SQL is essential for querying, updating, and managing data within a database. It enables users to create, read, update, and delete data while providing robust capabilities for data analysis and reporting. Mastering SQL is fundamental for anyone working with databases or involved in data-driven decision-making.

## Window Functions

Window functions in SQL are powerful tools that allow you to perform calculations across a set of table rows that are related to the current row. Unlike aggregate functions, window functions do not cause rows to become grouped into a single output row. Instead, rows retain their separate identities. Common window functions include ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, and various statistical functions. These functions are particularly useful for running totals, moving averages, and other calculations that need to consider the context of individual rows.

## Common Table Expressions (CTEs)

Common Table Expressions (CTEs) provide a way to create temporary result sets that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement. CTEs make complex queries easier to read and maintain by breaking them down into simpler, more manageable parts. They can also be used to perform recursive queries, which are essential for hierarchical or tree-structured data. Using CTEs can significantly enhance the readability and efficiency of your SQL code.

## How to Use

1. Clone the repository to your local machine.
2. Open the desired SQL file to view the queries.
3. Execute the queries in your SQL environment to see the results.

## Examples

### CTE Example

```sql
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
