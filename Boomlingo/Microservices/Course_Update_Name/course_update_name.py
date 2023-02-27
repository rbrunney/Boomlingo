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

    sql = "UPDATE courses SET course_name = %s WHERE course_id = %s"
    adr = (event["newValue"], event["course_id"])

    mycursor.execute(sql, adr)

    mydb.commit()

    return ("Record Updated")

# test_vals = {
#     "newValue":"Slang",
#     "course_id":"1"
#     }

# lambda_handler(test_vals, "None")