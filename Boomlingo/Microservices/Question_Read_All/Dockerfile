FROM public.ecr.aws/lambda/python:3.9
COPY question_read_all.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
COPY question_read_all.py ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"
CMD ["question_read_all.lambda_handler"]
