FROM public.ecr.aws/lambda/python:3.9
COPY answer_delete.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
COPY answer_delete.py ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"
CMD ["answer_delete.lambda_handler"]
