-- =========================================================
-- FILE: task_6.sql
-- DESCRIPTION: Inserts multiple rows into the 'customer' table
-- DATABASE: Passed as argument when executing MySQL command
-- AUTHOR: Ibiniyi Timothy
-- DATE: 2025-10-19
-- =========================================================

INSERT INTO customer (customer_id, customer_name, email, address)
VALUES 
    (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness Ave.'),
    (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness Ave.'),
    (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness Ave.');

