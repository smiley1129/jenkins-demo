FROM python:3.6

RUN apt-get update && apt-get install -y python3-pip

RUN pip install flask

COPY . /opt/

EXPOSE 8000

WORKDIR /opt

ENTRYPOINT ["python", "app.py"]
