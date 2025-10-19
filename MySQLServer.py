 """
MySQLServer.py
----------------------
This script connects to a MySQL server and creates a database named 'alx_book_store'.
If the database already exists, the script will not fail.
It handles connection errors gracefully and ensures that
the connection is closed after execution.
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL Server (update user/password as needed)
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

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Ensure the connection is closed properly
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    create_database()

