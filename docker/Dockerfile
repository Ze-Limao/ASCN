# Dockerfile for the Moonshot application
# TO DO

FROM ubuntu:24.04

ARG TZ=US
ARG DEBIAN_FRONTEND=noninteractive

# Define default values for the Enviroment Variables
ENV SEED=false

RUN apt-get update -y && apt install software-properties-common -y

RUN apt update -y

RUN apt install curl -y

#install python dependencies
RUN add-apt-repusitory ppa:deadsnakes/ppa -y

RUN apt update -y

RUN apt install python3.11 -y

RUN apt install python3-pip -y


RUN python3 get-pip.py

RUN python3 -m pip install --upgrade pip 

#install postgresql dependencies

RUN apt install postgresql -y

RUN apt update -y

WORKDIR moonshot
COPY . .


RUN pip install -r requirements.txt

# Copy start script
COPY ./script.sh .

# Add execution permission to start script
RUN chmod +x script.sh

EXPOSE 8000

CMD [ "./script.sh" ]
