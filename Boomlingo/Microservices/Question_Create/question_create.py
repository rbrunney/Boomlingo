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

    sql = "INSERT INTO questions (question_name, correct_answer, lesson_id) VALUES (%s, %s, %s)"
    val = (event["question_name"],event["correct_answer"],event["lesson_id"])
    mycursor.execute(sql, val)
    mydb.commit()

    return(mycursor.rowcount, "record inserted.")

test_vals = {
    "question_name":"What is the best use of Your Mom?",
    "correct_answer":"Always",
    "lesson_id":"2"
    }

lambda_handler(test_vals, "None")