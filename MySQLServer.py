"""
MySQLServer.py
----------------------
This script connects to a MySQL server and creates a database named 'alx_book_store'.
If the database already exists, the script will not fail.
It handles connection errors gracefully and ensures that
the connection is closed after execution.
"""

import mysql.connector

def create_database():
    connection = None
    cursor = None
    try:
        # Connect to MySQL Server (update credentials as needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="your_password_here"  # <-- replace with your MySQL root password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        print(f"Error while connecting to MySQL: {err}")

    finally:
        # Ensure connection and cursor are properly closed
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()

