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

    sql = "SELECT * FROM users"

    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    return myresult

# print(lambda_handler("None","None"))