FROM public.ecr.aws/lambda/python:3.9
COPY user_update_password.py ${LAMBDA_TASK_ROOT}
COPY requirements.txt .
COPY user_update_password.py ${LAMBDA_TASK_ROOT}
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"
CMD ["user_update_passwword.lambda_handler"]
