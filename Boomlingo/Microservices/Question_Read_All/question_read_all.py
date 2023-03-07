import mysql.connector
import json

def lambda_handler(event, context):
    mydb = mysql.connector.connect(
        host="",
        user="",
        password="",
        database=""
    )
    
    mycursor = mydb.cursor(dictionary=True)

    sql = "SELECT * FROM questions"

    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    return myresult

# print(lambda_handler("None","None"))