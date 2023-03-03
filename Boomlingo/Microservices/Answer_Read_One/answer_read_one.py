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

    sql = "SELECT * FROM answers WHERE answer = %s"
    adr = (event["answer"],)

    mycursor.execute(sql, adr)

    myresult = mycursor.fetchall()

    return myresult

# test_vals = {
#     "answer":"Your Mom"
#     }

# print(lambda_handler(test_vals, "None"))