FROM python:3.8.8-slim-buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gcc libpq-dev
RUN apt-get clean

RUN addgroup --system jedi && adduser --system --no-create-home --ingroup jedi luke

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN mkdir src

COPY ./requirements.txt .
COPY ./src/ ./src/
RUN pip install --no-cache-dir -r requirements.txt

RUN chown -R luke:jedi /usr/src/app && chmod -R 755 /usr/src/app
USER luke
WORKDIR /usr/src/app

EXPOSE 5000

CMD ["python", "src/app.py"]
