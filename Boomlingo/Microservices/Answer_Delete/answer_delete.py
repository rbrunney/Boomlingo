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

    sql = "DELETE FROM answers WHERE answer = %s"
    adr = (event["answer"],)

    mycursor.execute(sql, adr)

    mydb.commit()

    return (mycursor.rowcount, "record deleted.")

# test_vals = {
#     "answer":"Doin' what dogs do"
#     }

# lambda_handler(test_vals, "None")