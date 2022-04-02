# init a base image (Alpine is small linux distro)

FROM python:3.6.1-alpine

#define the present working directory
RUN pip install --upgrade pip
FROM debian:10.7

RUN apt-get update && \
    apt-get install --yes --no-install-recommends wget build-essential libcurl4 && \
    wget https://curl.se/download/curl-7.74.0.tar.gz && \
    tar -xvf curl-7.74.0.tar.gz && cd curl-7.74.0 && \
    ./configure && make && make install
WORKDIR /docker-flask-test

#copy the contents into the working directory
ADD . /docker-flask-test

#run pip to install all the dependencies in requirement.txt
RUN pip install -r requirements.txt

#define the command to start the container
CMD ["python", "app.py"]
