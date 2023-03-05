aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin 884873584882.dkr.ecr.us-west-1.amazonaws.com

docker compose up -d

::Answer
docker tag word_of_day:1.0 884873584882.dkr.ecr.us-west-1.amazonaws.com/boomlingo:word_of_day
docker push 884873584882.dkr.ecr.us-west-1.amazonaws.com/boomlingo:word_of_day

pause