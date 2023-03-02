FROM public.ecr.aws/lambda/python:3.9
COPY user_read_one.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
COPY user_read_one.py ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"
CMD ["user_read_one.lambda_handler"]
