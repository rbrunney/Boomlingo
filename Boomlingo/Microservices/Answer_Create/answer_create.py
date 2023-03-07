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

    sql = "INSERT INTO answers (answer) VALUES (%s)"
    val = (event["answer"],)
    mycursor.execute(sql, val)
    mydb.commit()

    return(mycursor.rowcount, "record inserted.")

# test_vals = {
#     "answer":"Ligma balls"
#     }

# lambda_handler(test_vals, "None")