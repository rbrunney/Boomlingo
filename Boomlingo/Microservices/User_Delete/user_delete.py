import mysql.connector
import json

def lambda_handler(event, context):
    mydb = mysql.connector.connect(
        host="",
        user="",
        password="",
        database=""
    )
    
    mycursor = mydb.cursor()

    sql = "DELETE FROM users WHERE username = %s"
    adr = (event["username"],)

    mycursor.execute(sql, adr)

    mydb.commit()

    return (mycursor.rowcount, "record deleted.")

# test_vals = {
#     "username":"YourMom"
#     }

# lambda_handler(test_vals, "None")