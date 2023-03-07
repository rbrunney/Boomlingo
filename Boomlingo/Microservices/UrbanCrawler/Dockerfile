FROM public.ecr.aws/lambda/python:3.9
COPY word_of_day.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
COPY word_of_day.py ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"
CMD ["word_of_day.lambda_handler"]