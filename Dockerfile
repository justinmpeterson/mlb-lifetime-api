FROM python:3.8.8-slim-buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y netcat-openbsd gcc libpq-dev
RUN apt-get clean

RUN addgroup --system jedi && adduser --system --no-create-home --ingroup jedi luke

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN mkdir src

COPY ./requirements.txt .
COPY ./src/ ./src/

RUN chown -R jedi:luke /usr/src/app && chmod -R 755 /usr/src/app
USER luke

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "src/app.py"]
