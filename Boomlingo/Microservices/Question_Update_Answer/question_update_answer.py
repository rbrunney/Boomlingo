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

    sql = "UPDATE questions SET lession_id = %s WHERE question_id = %s"
    adr = (event["newValue"], event["question_id"])

    mycursor.execute(sql, adr)

    mydb.commit()

    return ("Record Updated")

# test_vals = {
#     "newValue":"Slang",
#     "question_id":"1"
#     }

# lambda_handler(test_vals, "None")