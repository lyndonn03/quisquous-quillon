FROM python:3.7-alpine

# All the environmental variables
# Tells the python to run in unbuffered mode which is
#  recommended when using docker
ENV PYTHONUNBUFFERED 1

#  The file uses to list all the requirements
COPY ./requirements.txt ./requirements.txt

RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Add user to the docker
RUN adduser -D user
USER user 