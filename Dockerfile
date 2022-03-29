FROM python:3.10-slim

WORKDIR /app

ADD requirements.txt .

RUN pip install -r requirements.txt

ADD . .

EXPOSE 80
CMD gunicorn --bind 0.0.0.0:$PORT --log-file - herokudocker.wsgi
