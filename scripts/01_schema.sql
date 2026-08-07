-- Project: Online Bookstore Inventory Database System
-- Script: 01_schema.sql
-- Description: Creates database and sets up 12 relational entities with PK/FK rules.

CREATE DATABASE IF NOT EXISTS Online_Bookstore;
USE Online_Bookstore;

-- 1. Core Reference Entities
CREATE TABLE Author (
    Author_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50)
);

CREATE TABLE Publisher (
    Publisher_ID INT PRIMARY KEY,
    Name VARCHAR(200),
    Publisher_Info TEXT
);

CREATE TABLE Book_Type (
    Type_ID INT PRIMARY KEY,
    Type_Name VARCHAR(50)
);

CREATE TABLE Locations (
    Location_ID INT PRIMARY KEY,
    Address VARCHAR(200)
);

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Address VARCHAR(200)
);

-- 2. Book & Pricing Catalog
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Book_Title VARCHAR(200),
    Author_ID INT,
    Date_Published DATE,
    Type_ID INT,
    Publisher_ID INT,
    FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
    FOREIGN KEY (Type_ID) REFERENCES Book_Type(Type_ID),
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID)
);

CREATE TABLE Book_Pricing (
    Book_ID INT,
    Type_ID INT,
    Book_Type_Price DECIMAL(10, 2),
    PRIMARY KEY (Book_ID, Type_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Type_ID) REFERENCES Book_Type(Type_ID)
);

CREATE TABLE Book_Stock (
    Title VARCHAR(200),
    Type_ID INT,
    Location_ID INT,
    Stock INT,
    PRIMARY KEY (Title, Type_ID, Location_ID),
    FOREIGN KEY (Type_ID) REFERENCES Book_Type(Type_ID),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID)
);

-- 3. Sales & Customer Interactions
CREATE TABLE Purchases (
    Purchase_ID INT PRIMARY KEY,
    Customer_ID INT,
    Date_Time DATETIME,
    Delivery BOOLEAN,
    Location_ID INT,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID)
);

CREATE TABLE Purchase_Books (
    Purchase_ID INT,
    Book_ID INT,
    Type_ID INT,
    Quantity INT,
    Book_Price DECIMAL(10, 2),
    PRIMARY KEY (Purchase_ID, Book_ID, Type_ID),
    FOREIGN KEY (Purchase_ID) REFERENCES Purchases(Purchase_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Type_ID) REFERENCES Book_Type(Type_ID)
);

CREATE TABLE Customer_History (
    Customer_ID INT,
    Purchase_ID INT,
    PRIMARY KEY (Customer_ID, Purchase_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Purchase_ID) REFERENCES Purchases(Purchase_ID)
);

CREATE TABLE User_Reviews (
    Review_ID INT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Rating INT,
    Review TEXT,
    Date_Time DATETIME,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);
