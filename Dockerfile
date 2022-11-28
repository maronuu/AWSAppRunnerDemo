FROM python:3.9.15-slim
ENV PYTHONUNBUFFERED=1

RUN apt update
RUN pip install --upgrade pip
RUN pip install django

COPY "./apprunner_demo/*.py" /app/
COPY "./apprunner_demo/apprunner_demo/*.py" /app/apprunner_demo/
COPY "./apprunner_demo/hello/*.py" /app/hello/

WORKDIR /app

CMD ["python", "/app/manage.py", "runserver", "0.0.0.0:8000"]