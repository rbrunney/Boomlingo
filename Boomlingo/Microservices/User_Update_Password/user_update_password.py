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

    sql = "UPDATE users SET password = %s WHERE username = %s"
    adr = (event["newValue"], event["username"])

    mycursor.execute(sql, adr)

    mydb.commit()

    return ("Record Updated")

# test_vals = {
#     "newValue":"Ms.",
#     "username":"YourMom"
#     }

# lambda_handler(test_vals, "None")