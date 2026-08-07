-- Project: Online Bookstore Inventory Database System
-- Script: 03_queries_and_reports.sql
-- Description: Core analytical queries, multi-table JOINs, and aggregations.

USE Online_Bookstore;

-- 1. Catalog & Category Filtering
SELECT Book_Title, Author_ID, Publisher_ID 
FROM Books 
WHERE Type_ID = 1;

-- 2. Multi-Table Relational JOIN: Full Catalog Breakdown
SELECT 
    b.Book_Title, 
    a.First_Name AS Author_First_Name, 
    a.Last_Name AS Author_Last_Name,
    p.Name AS Publisher_Name
FROM Books b
INNER JOIN Author a ON b.Author_ID = a.Author_ID
INNER JOIN Publisher p ON b.Publisher_ID = p.Publisher_ID;

-- 3. Inventory Tracking: Join Stock Levels with Catalog
SELECT b.Book_Title, bs.Stock
FROM Books b
LEFT JOIN Book_Stock bs ON b.Book_Title = bs.Title;

-- 4. Aggregation: Books Counted per Category
SELECT Type_ID, COUNT(*) AS Book_Count
FROM Books
GROUP BY Type_ID;

-- 5. Financial Aggregation: Total Revenue per Customer
SELECT 
    c.First_Name, 
    c.Last_Name, 
    SUM(p.Total_Amount) AS Total_Sales
FROM Customer c
INNER JOIN Purchases p ON c.Customer_ID = p.Customer_ID
GROUP BY c.Customer_ID, c.First_Name, c.Last_Name;

-- 6. Customer Purchase Count
SELECT Customer_ID, COUNT(Purchase_ID) AS Number_of_Purchases
FROM Customer_History
GROUP BY Customer_ID;

-- 7. Product Quality Metrics: Average Rating per Book
SELECT 
    B.Book_Title, 
    AVG(R.Rating) AS Average_Rating
FROM User_Reviews R
JOIN Books B ON R.Book_ID = B.Book_ID
GROUP BY B.Book_Title;
