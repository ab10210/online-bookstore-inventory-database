-- Project: Online Bookstore Inventory Database System
-- Script: 04_admin_and_testing.sql
-- Description: DCL user access controls, safe update toggles, and test operations.

USE Online_Bookstore;

-- 1. User Security & Access Control (DCL)
CREATE USER IF NOT EXISTS 'readonly_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER IF NOT EXISTS 'admin_user'@'localhost' IDENTIFIED BY 'admin123';

GRANT SELECT ON Online_Bookstore.* TO 'readonly_user'@'localhost';
GRANT ALL PRIVILEGES ON Online_Bookstore.* TO 'admin_user'@'localhost';

FLUSH PRIVILEGES;

-- 2. Safe Updates Configuration
-- Disable safe updates mode to allow batch/test updates
SET SQL_SAFE_UPDATES = 0;

-- Test Update Statement
UPDATE Author
SET First_Name = 'William Updated'
WHERE First_Name = 'William' AND Last_Name = 'Shakespeare';

-- Test Delete Statement
DELETE FROM Author
WHERE First_Name = 'William Updated' AND Last_Name = 'Shakespeare';

-- Re-enable safe updates mode for database protection
SET SQL_SAFE_UPDATES = 1;
