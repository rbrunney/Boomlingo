import mysql.connector
import json

def lambda_handler(event, context):
    mydb = mysql.connector.connect(
        host="",
        user="",
        password="",
        database=""
    )
    
    mycursor = mydb.cursor(dictionary=True)

    sql = "SELECT * FROM users WHERE username = %s"
    adr = (event["username"],)

    mycursor.execute(sql, adr)

    myresult = mycursor.fetchall()

    return myresult

# test_vals = {
#     "username":"YourMom"
#     }

# lambda_handler(test_vals, "None")