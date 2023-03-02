FROM public.ecr.aws/lambda/python:3.9
COPY lesson_read_course.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
COPY lesson_read_course.py ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"
CMD ["lesson_read_all.lambda_handler"]
