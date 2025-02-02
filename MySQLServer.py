import mysql.connector, os
from dotenv import load_dotenv
load_dotenv()
PASSWORD = os.environ.get("PASSWORD")


try:
    mydb = mysql.connector.connect(host="localhost", 
                               user="root",
                               password=PASSWORD,
                               database = "alx_book_store"
                               )

    cursor = mydb.cursor()
    cursor.execute("""CREATE DATABASE IF NOT EXISTS alx_book_store""")
    print("Database 'alx_book_store' created successfully!")
except mysql.connector.Error:
    print("Unable to connect to Database!")
finally:
    cursor.close()
    mydb.close()
