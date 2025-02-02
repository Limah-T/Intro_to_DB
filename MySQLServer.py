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

try:
    cursor.execute("""CREATE DATABASE alx_be_store""")
    print("Database 'alx_book_store' created successfully!")
except Exception as e:
    print(e)
finally:
    cursor.close()
    mydb.close()
