-- =========================================================
-- FILE: task_4.sql
-- DESCRIPTION: Prints the full description of the table 'books'
-- DATABASE: Passed as argument when executing MySQL command
-- AUTHOR: Ibiniyi Timothy
-- DATE: 2025-10-19
-- NOTE: DESCRIBE or EXPLAIN statements are NOT used
-- =========================================================

SELECT COLUMN_NAME, 
       COLUMN_TYPE, 
       IS_NULLABLE, 
       COLUMN_KEY, 
       COLUMN_DEFAULT, 
       EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'books';

