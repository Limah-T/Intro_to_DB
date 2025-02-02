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

cursor.execute("""INSERT INTO customers(customer_id, customer_name, email, address)
                    VALUES(2, "Blessing Malik", "bmalik@sandtech.com", "124 Happiness  Ave."),
                          (3, "Obed Ehoneah", "eobed@sandtech.com", "125 Happiness  Ave."),
                          (4, "Nehemial Kamolu", "nkamolu@sandtech.com", "126 Happiness  Ave.")
              """)
mydb.commit()
print(cursor.rowcount, "record(s)")
cursor.close()
mydb.close()
