FROM python:latest

COPY requirements.txt requirements.txt

RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

RUN useradd -m pml
USER pml

LABEL "uni.sem3.course"="Python for Machine Learning"
LABEL version="1.0"
LABEL description="This Dockerfile includes pre-installation of \
necessary python packages for PML course of Semester 3."

WORKDIR /home/pml/
