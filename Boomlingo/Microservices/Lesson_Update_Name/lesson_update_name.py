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

    sql = "UPDATE lessons SET lesson_name = %s WHERE lesson_id = %s"
    adr = (event["newValue"], event["lesson_id"])

    mycursor.execute(sql, adr)

    mydb.commit()

    return ("Record Updated")

# test_vals = {
#     "newValue":"Slang",
#     "lesson_id":"1"
#     }

# lambda_handler(test_vals, "None")