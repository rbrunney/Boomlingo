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

    sql = "SELECT * FROM courses WHERE course_name = %s"
    adr = (event["course_name"],)

    mycursor.execute(sql, adr)

    myresult = mycursor.fetchall()

    return myresult

# test_vals = {
#     "course_name":"Slang"
#     }

# print(lambda_handler(test_vals, "None"))