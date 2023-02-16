FROM public.ecr.aws/lambda/java:11
COPY target/Course_Create-1.0-SNAPSHOT.jar ${LAMBDA_TASK_ROOT}/lib/
CMD ["org.example.Course_Create::handleRequest"]