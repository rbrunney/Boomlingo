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

    sql = "DELETE FROM questions WHERE question_name = %s"
    adr = (event["question_name"],)

    mycursor.execute(sql, adr)

    mydb.commit()

    return (mycursor.rowcount, "record deleted.")

# test_vals = {
#     "question_name":"What is the best use of 'Your "
#     }

# lambda_handler(test_vals, "None")