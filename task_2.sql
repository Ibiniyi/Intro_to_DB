-- task_2.sql
-- Create all tables for alx_book_store database

USE alx_book_store;

-- ========================
-- TABLE: AUTHORS
-- ========================
CREATE TABLE AUTHORS (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    country VARCHAR(100)
);

-- ========================
-- TABLE: BOOKS
-- ========================
CREATE TABLE BOOKS (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT NOT NULL,
    genre VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    publication_year YEAR,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- ========================
-- TABLE: CUSTOMERS
-- ========================
CREATE TABLE CUSTOMERS (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(200)
);

-- ========================
-- TABLE: ORDERS
-- ========================
CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- ========================
-- TABLE: ORDER_DETAILS
-- ========================
CREATE TABLE ORDER_DETAILS (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);

