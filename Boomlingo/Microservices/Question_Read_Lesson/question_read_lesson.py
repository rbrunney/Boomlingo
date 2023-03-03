import mysql.connector
import json

def lambda_handler(event, context):
    mydb = mysql.connector.connect(
        host="boomlingo-db.cf61ggafcjsa.us-west-2.rds.amazonaws.com",
        user="admin",
        password="MyBedRightNow",
        database="boomlingo"
    )
    
    mycursor = mydb.cursor(dictionary=True)

    sql = "SELECT * FROM questions WHERE lesson_id = %s"
    adr = (event["lesson_id"],)

    mycursor.execute(sql, adr)

    myresult = mycursor.fetchall()

    return mycursor.fetchall()

# test_vals = {
#     "lesson_id":"2"
#     }

# print(lambda_handler(test_vals, "None"))