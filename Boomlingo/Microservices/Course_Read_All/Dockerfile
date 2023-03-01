FROM public.ecr.aws/lambda/python:3.9
COPY Exercise-1a.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
COPY course_read_all.py ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"
CMD ["course_read_all.lambda_handler"]
