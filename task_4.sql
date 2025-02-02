import mysql.connector, os
from dotenv import load_dotenv
load_dotenv()
PASSWORD = os.environ.get("PASSWORD")

mydb = mysql.connector.connect(host="localhost", 
                               user="root",
                               password=PASSWORD,
                               database = "alx_book_store"
                               )

cursor = mydb.cursor()
cursor.execute("USE alx_book_store;")
cursor.execute("""SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT, EXTRA
                FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Books'
              """)

for col in cursor.fetchall():
    print(col)

