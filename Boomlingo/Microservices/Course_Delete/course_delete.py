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

    sql = "DELETE FROM courses WHERE course_name = %s"
    adr = (event["course_name"],)

    mycursor.execute(sql, adr)

    mydb.commit()

    return (mycursor.rowcount, "record deleted.")

# test_vals = {
#     "course_name":"Slang"
#     }

# lambda_handler(test_vals, "None")