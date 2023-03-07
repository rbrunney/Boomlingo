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

    sql = "INSERT INTO courses (course_name) VALUES (%s)"
    val = (event["course_name"],)
    mycursor.execute(sql, val)
    mydb.commit()

    return(mycursor.rowcount, "record inserted.")

# test_vals = {
#     "course_name":"Memes"
#     }

# lambda_handler(test_vals, "None")