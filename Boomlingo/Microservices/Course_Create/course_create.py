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

    sql = "INSERT INTO courses (course_name) VALUES (%s)"
    val = (event["course_name"],)
    mycursor.execute(sql, val)
    mydb.commit()

    return(mycursor.rowcount, "record inserted.")

test_vals = {
    "course_name":"Memes"
    }

lambda_handler(test_vals, "None")