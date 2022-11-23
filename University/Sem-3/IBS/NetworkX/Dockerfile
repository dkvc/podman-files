FROM python:3.11.0

COPY requirements.txt requirements.txt

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

RUN useradd -m networkx
USER networkx

LABEL "uni.sem3.course"="Intelligence of Biological Systems"
LABEL version="1.0"
LABEL description="This Dockerfile includes pre-installation of \
necessary python packages for IBS course of Semester 3."

WORKDIR /home/networkx/
