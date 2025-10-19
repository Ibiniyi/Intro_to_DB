-- =========================================================
-- DATABASE: alx_book_store
-- DESCRIPTION: Online Bookstore Database Schema
-- AUTHOR: Ibiniyi Timothy
-- DATE: 2025-10-19
-- =========================================================

-- DROP DATABASE IF IT EXISTS (optional cleanup)
DROP DATABASE IF EXISTS alx_book_store;

-- CREATE DATABASE (with IF NOT EXISTS for safety)
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- USE THE DATABASE
USE alx_book_store;

-- =========================================================
-- TABLE: Authors
-- =========================================================
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- =========================================================
-- TABLE: Books
-- =========================================================
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================================
-- TABLE: Customers
-- =========================================================
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- =========================================================
-- TABLE: Orders
-- =========================================================
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================================
-- TABLE: Order_Details
-- =========================================================
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================================
-- SAMPLE DATA INSERTION (Optional)
-- =========================================================
INSERT INTO Authors (author_name) VALUES
('Chinua Achebe'),
('Wole Soyinka'),
('Chimamanda Ngozi Adichie');

INSERT INTO Books (title, author_id, price, publication_date) VALUES
('Things Fall Apart', 1, 15.99, '1958-06-17'),
('Ake: The Years of Childhood', 2, 12.50, '1981-03-20'),
('Half of a Yellow Sun', 3, 18.75, '2006-09-12');

INSERT INTO Customers (customer_name, email, address) VALUES
('John Doe', 'john@example.com', '123 Main Street, Ilorin'),
('Mary Smith', 'mary@example.com', '45 Unity Road, Lagos');

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-10-10'),
(2, '2025-10-11');

INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1);

-- =========================================================
-- END OF SCRIPT
-- =========================================================


