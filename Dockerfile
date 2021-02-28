FROM python:3.9-slim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN mkdir src

COPY ./requirements.txt .

COPY ./src/ ./src/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "src/app.py"]
