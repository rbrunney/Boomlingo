import mysql.connector
import json

def lambda_handler(event, context):
    mydb = mysql.connector.connect(
        host="boomlingo-db.cf61ggafcjsa.us-west-2.rds.amazonaws.com",
        user="admin",
        password="MyBedRightNow",
        database="boomlingo"
    )
    
    mycursor = mydb.cursor()

    sql = "INSERT INTO lessons (lesson_name, course_id) VALUES (%s, %s)"
    val = (event["lesson_name"],event["course_id"])
    mycursor.execute(sql, val)
    mydb.commit()

    return(mycursor.rowcount, "record inserted.")

# test_vals = {
#     "lesson_name":"What the dog doin'?",
#     "course_id":"2"
#     }

# lambda_handler(test_vals, "None")