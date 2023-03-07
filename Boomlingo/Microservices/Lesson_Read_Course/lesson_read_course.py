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

    sql = "SELECT * FROM lessons WHERE course_id = %s"
    adr = (event["course_id"],)

    mycursor.execute(sql, adr)

    myresult = mycursor.fetchall()

    return myresult

# test_vals = {
#     "course_id":"2"
#     }

# print(lambda_handler(test_vals, "None"))