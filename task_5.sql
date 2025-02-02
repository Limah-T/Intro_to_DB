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

sql = """INSERT INTO customers(customer_name, email, address)
        VALUES(%s, %s, %s)
    """
val = ("Cole Baidoo", "cbaidoo@sandtech.com", "123 Happiness Ave")
cursor.execute(sql, val)
mydb.commit()
print(cursor.rowcount, "record(s)")
cursor.close()
mydb.close()
