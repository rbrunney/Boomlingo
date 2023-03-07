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

    sql = "UPDATE answers SET answer = %s WHERE answer_id = %s"
    adr = (event["newValue"], event["answer_id"])

    mycursor.execute(sql, adr)

    mydb.commit()

    return ("Record Updated")

# test_vals = {
#     "newValue":"Slang",
#     "answer_id":"1"
#     }

# lambda_handler(test_vals, "None")