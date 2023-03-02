aws ecr get-login-password --region us-west-2| docker login --username AWS --password-stdin 126489223387.dkr.ecr.us-west-2.amazonaws.com

docker compose up -d

::Answer
docker tag answer_create:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_create
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_create

docker tag answer_delete:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_delete
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_delete

docker tag answer_read_all:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_read_all
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_read_all

docker tag answer_read_one:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_read_one
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_read_one

docker tag answer_update:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_update
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:answer_update

::Course
docker tag course_create:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:course_create
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:course_create

docker tag course_delete:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:course_delete
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:course_delete

docker tag course_read_all:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomling:course_read_all
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:course_read_all

docker tag course_read_one:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomling:course_read_one
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:course_read_one

docker tag course_update_name:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:course_update_name
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:course_update_name

::Lesson
docker tag lesson_create:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_create
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_create

docker tag lesson_delete:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_delete
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_delete

docker tag lesson_read_all:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_read_all
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_read_all

docker tag lesson_read_course:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_read_course
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_read_course

docker tag lesson_read_one:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_read_one
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_read_one

docker tag lesson_update_name:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_update_name
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_update_name

::Question
docker tag question_create:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_create
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_create

docker tag question_delete:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_delete
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:lesson_delete

docker tag question_read_all:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_read_all
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_read_all

docker tag question_read_lesson:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_read_lesson
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_read_lesson

docker tag question_read_one:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_read_one
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_read_one

docker tag question_update_answer:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_update_answer
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_update_answer

docker tag question_update_name:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_update_name
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_update_name

::User
docker tag user_create:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_create
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_create

docker tag user_delete:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_delete
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_delete

docker tag user_read_all:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:question_ruser_read_allead_all
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_read_all

docker tag user_read_one:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_read_one
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_read_one

docker tag user_update_dob:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_dob
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_dob

docker tag user_update_email:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_email
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_email

docker tag user_update_firstname:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_firstname
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_firstname

docker tag user_update_lastname:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_lastname
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_lastname

docker tag user_update_password:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_password
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:user_update_password

::Webscraper
docker tag webscraper:1.0 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:webscraper
docker push 126489223387.dkr.ecr.us-west-2.amazonaws.com/boomlingo:webscraper

pause