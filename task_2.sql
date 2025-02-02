cursor.execute("""
                CREATE TABLE authors(
                    author_id INT AUTO_INCREMENT PRIMARY KEY,
                    author_name VARCHAR(215) NOT NULL
                    )
              """)

cursor.execute("""
               CREATE TABLE books (
                    book_id INT AUTO_INCREMENT PRIMARY KEY,
                    title VARCHAR(130) NOT NULL,
                    author_id INT NOT NULL,
                    price DOUBLE(10, 2) NOT NULL,
                    publication_date DATE,
                    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
                )
               """)

cursor.execute("""
                CREATE TABLE customers(
                    customer_id INT AUTO_INCREMENT PRIMARY KEY,
                    customer_name VARCHAR(215) NOT NULL,
                    email VARCHAR(215) NOT NULL,
                    address TEXT NOT NULL
                )
                """)


cursor.execute("""
                CREATE TABLE orders(
                    order_id INT AUTO_INCREMENT PRIMARY KEY,
                    customer_id INT NOT NULL,
                    order_date DATE,
                    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
                    )
            """)


cursor.execute("""
                CREATE TABLE order_details(
                    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
                    quantity DOUBLE NOT NULL,
                    order_id INT NOT NULL,
                    book_id INT NOT NULL,
                    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                    FOREIGN KEY (book_id) REFERENCES Books(book_id)
                )
        """)

print("Created all tables successfully!")
cursor.close()