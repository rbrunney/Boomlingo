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

    sql = "SELECT * FROM questions"

    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    return json.dumps(myresult)

# print(lambda_handler("None","None"))