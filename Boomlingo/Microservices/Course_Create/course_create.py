import mysql.connector
import json

def lambda_handler(event, context):
    mydb = mysql.connector.connect(
        host="boomlingo-db.cf61ggafcjsa.us-west-2.rds.amazonaws.com",
        user="admin",
        password="MyBedRightNow",
        database="mydatabase"
    )
    
    mycursor = mydb.cursor()

    sql = "INSERT INTO courses (name, address) VALUES (%s, %s)"
    val = (event[""], "Highway 21")
    mycursor.execute(sql, val)

    mydb.commit()

    print(mycursor.rowcount, "record inserted.")

lambda_handler("None", "None")