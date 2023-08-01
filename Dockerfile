
FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apt-get update && apt-get install -y \
    postgresql-client

COPY src/requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY src/ /app/

# CMD ["python", "src/manage.py", "runserver", "0.0.0.0:8000"]
CMD ["sh", "-c", "python src/manage.py runserver 0.0.0.0:8000 & python src/manage.py weekly_email"]