FROM python:3.7.6-buster
LABEL maintainer="Iwan Buetti <iwan.buetti@gmail.com>"
# https://github.com/amancevice/docker-pandas/blob/master/Dockerfile
# https://hub.docker.com/r/amancevice/pandas

RUN apt update && apt install -y liblapack3 libgfortran4

COPY SCIPOptSuite-6.0.2-Linux.sh /src/

ENV SCIPOPTDIR /src/scipoptsuite
RUN mkdir $SCIPOPTDIR

RUN sh /src/SCIPOptSuite-6.0.2-Linux.sh --skip-license --prefix=$SCIPOPTDIR
RUN rm /src/SCIPOptSuite-6.0.2-Linux.sh
RUN pip3 install pyscipopt

COPY requirements.txt /src/
RUN pip install -r /src/requirements.txt


# docker build -t iwan/scipopt-0.2 .


# docker run -it iwan/scipopt-0.2 /bin/bash
