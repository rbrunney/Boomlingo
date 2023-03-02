FROM public.ecr.aws/lambda/python:3.9
COPY course_update_name.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
COPY course_update_name.py ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"
CMD ["course_update_name.lambda_handler"]
