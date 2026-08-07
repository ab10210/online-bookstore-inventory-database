-- Project: Online Bookstore Inventory Database System
-- Script: 02_seed_data.sql
-- Description: Populates mock records across all 12 database tables.

USE Online_Bookstore;

-- Authors
INSERT INTO Author (Author_ID, First_Name, Last_Name) VALUES
(1, 'Rick', 'Riordan'),
(2, 'Harper', 'Lee'),
(3, 'Cinda Williams', 'Chima'),
(4, 'William', 'Shakespeare');

-- Publishers
INSERT INTO Publisher (Publisher_ID, Name, Publisher_Info) VALUES
(1, 'Disney-Hyperion', 'Imprint of Disney Book Group'),
(2, 'J.B. Lippincott & Co.', 'American publishing company'),
(3, 'HarperCollins', 'Major publisher of fantasy and YA books'),
(4, 'Simon & Schuster', 'Renowned global publishing company');

-- Book Categories / Types
INSERT INTO Book_Type (Type_ID, Type_Name) VALUES
(1, 'Fantasy'),
(2, 'Classic'),
(3, 'Drama');

-- Catalog Books
INSERT INTO Books (Book_ID, Book_Title, Author_ID, Date_Published, Type_ID, Publisher_ID) VALUES
(1, 'The Lightning Thief', 1, '2005-06-28', 1, 1),
(2, 'To Kill a Mockingbird', 2, '1960-07-11', 2, 2),
(3, 'The Demon King', 3, '2009-10-06', 1, 3),
(4, 'The Exiled Queen', 3, '2010-09-28', 1, 3),
(5, 'The Gray Wolf Throne', 3, '2011-08-30', 1, 3),
(6, 'The Crimson Crown', 3, '2012-10-23', 1, 3),
(7, 'The Sea of Monsters', 1, '2006-04-01', 1, 1),
(8, 'Go Set a Watchman', 2, '2015-07-14', 2, 2),
(9, 'Hamlet', 4, '1603-01-01', 3, 4);

-- Pricing Structure
INSERT INTO Book_Pricing (Book_ID, Type_ID, Book_Type_Price) VALUES
(1, 1, 14.99), (2, 2, 12.99), (3, 1, 13.99),
(4, 1, 13.99), (5, 1, 13.99), (6, 1, 13.99),
(7, 1, 14.99), (8, 2, 13.49), (9, 3, 10.99);

-- Warehouse & Store Locations
INSERT INTO Locations (Location_ID, Address) VALUES
(1, '123 Adventure Blvd, Camp Halfblood'),
(2, '456 Finch Ave, Maycomb');

-- Inventory Stock Levels
INSERT INTO Book_Stock (Title, Type_ID, Location_ID, Stock) VALUES
('The Lightning Thief', 1, 1, 120), ('The Lightning Thief', 1, 2, 130),
('To Kill a Mockingbird', 2, 1, 100), ('To Kill a Mockingbird', 2, 2, 80),
('The Demon King', 1, 1, 50),        ('The Demon King', 1, 2, 40),
('The Exiled Queen', 1, 1, 45),      ('The Exiled Queen', 1, 2, 35),
('The Gray Wolf Throne', 1, 1, 40),  ('The Gray Wolf Throne', 1, 2, 30),
('The Crimson Crown', 1, 1, 35),    ('The Crimson Crown', 1, 2, 25),
('The Sea of Monsters', 1, 1, 60),  ('The Sea of Monsters', 1, 2, 60),
('Go Set a Watchman', 2, 1, 70),    ('Go Set a Watchman', 2, 2, 50),
('Hamlet', 3, 1, 100),               ('Hamlet', 3, 2, 90);

-- Customers
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Address) VALUES
(1, 'Sophie', 'Turner', '789 West St, New York'),
(2, 'James', 'Smith', '101 East St, Alabama'),
(3, 'Liam', 'Johnson', '202 Oak St, Chicago'),
(4, 'Emma', 'Watson', '303 Maple St, London');

-- Transaction History
INSERT INTO Purchases (Purchase_ID, Customer_ID, Date_Time, Delivery, Location_ID, Total_Amount) VALUES
(1, 1, '2025-04-04 10:00:00', TRUE, 1, 27.98),
(2, 2, '2025-04-04 11:00:00', FALSE, 2, 12.99),
(3, 3, '2025-04-05 14:00:00', TRUE, 1, 54.98),
(4, 4, '2025-04-05 15:00:00', FALSE, 2, 37.98);

-- Purchase Line Items
INSERT INTO Purchase_Books (Purchase_ID, Book_ID, Type_ID, Quantity, Book_Price) VALUES
(1, 1, 1, 1, 14.99), (1, 2, 2, 1, 12.99),
(2, 2, 2, 1, 12.99),
(3, 3, 1, 2, 13.99), (3, 4, 1, 2, 13.99),
(4, 7, 1, 2, 14.99), (4, 8, 2, 1, 13.49);

-- Mapping Customer Orders
INSERT INTO Customer_History (Customer_ID, Purchase_ID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4);

-- Product Reviews
INSERT INTO User_Reviews (Review_ID, Customer_ID, Book_ID, Rating, Review, Date_Time) VALUES
(1, 1, 1, 5, 'A thrilling adventure! Percy Jackson is a great character.', '2025-04-04 10:30:00'),
(2, 2, 2, 5, 'A timeless masterpiece. Deep and meaningful story.', '2025-04-04 11:30:00'),
(3, 3, 3, 4, 'A great fantasy series. Enjoyed the adventure and characters.', '2025-04-05 14:30:00'),
(4, 4, 8, 5, 'Fantastic read. Loved the character development and storytelling.', '2025-04-05 15:30:00');
