FROM public.ecr.aws/lambda/python:3.9
COPY question_update_answer.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
COPY question_update_answer.py ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"
CMD ["question_update_answer.lambda_handler"]
