import mysql.connector
import json

def lambda_handler(event, context):
    mydb = mysql.connector.connect(
        host="",
        user="",
        password="",
        database=""
    )
    
    mycursor = mydb.cursor()

    sql = "DELETE FROM lessons WHERE lesson_name = %s"
    adr = (event["lesson_name"],)

    mycursor.execute(sql, adr)

    mydb.commit()

    return (mycursor.rowcount, "record deleted.")

# test_vals = {
#     "lesson_name":"Your Mom"
#     }

# lambda_handler(test_vals, "None")