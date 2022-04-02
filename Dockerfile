# init a base image (Alpine is small linux distro)

FROM python:3.6.1-alpine

#define the present working directory
RUN pip install --upgrade pip
RUN sudo apt update
RUN sudo apt install curl
WORKDIR /docker-flask-test

#copy the contents into the working directory
ADD . /docker-flask-test

#run pip to install all the dependencies in requirement.txt
RUN pip install -r requirements.txt

#define the command to start the container
CMD ["python", "app.py"]
