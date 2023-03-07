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

    sql = "SELECT * FROM lessons WHERE lesson_name = %s"
    adr = (event["lesson_name"],)

    mycursor.execute(sql, adr)

    myresult = mycursor.fetchall()

    return myresult

# test_vals = {
#     "lesson_name":"Your Mom"
#     }

# print(lambda_handler(test_vals, "None"))