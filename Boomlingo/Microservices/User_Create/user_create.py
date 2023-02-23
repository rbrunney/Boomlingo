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

    sql = "INSERT INTO users (username, password, email, firstname, lastname, DOB, joindate) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    val = (event["username"], event["password"], event["email"], event["firstname"], event["lastname"], event["DOB"], event["joindate"])
    mycursor.execute(sql, val)
    mydb.commit()

    print(mycursor.rowcount, "record inserted.")

# test_vals = {
#     "username":"YourMom",
#     "password":"myBed",
#     "email":"yourmominmybed@rightnow.com",
#     "firstname":"My",
#     "lastname":"Mom",
#     "DOB":"12/12/1972",
#     "joindate":"2/22/2023"
#     }

# lambda_handler(test_vals, "None")