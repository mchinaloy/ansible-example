FROM alpine:3.5
MAINTAINER Michael Chinaloy <mikechin59@hotmail.com>
RUN echo "==== Adding alpine edge repository ====" && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    \
    echo "==== Updating apk ====" && \
    apk update && \
    \
    echo "==== Installing python dependencies ====" && \
    apk add python py2-pip openssl ca-certificates && \
    \
    echo "==== Installing build dependencies ====" && \
    apk add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
    \
    echo "==== Installing pip ====" && \
    pip install --upgrade pip && \
    \
    echo "==== Installing ansible and awscli tools ====" && \
    pip install ansible awscli && \
    \
    echo "==== Removing redundant build dependencies ====" && \
    apk del build-dependencies
RUN mkdir /data
VOLUME ~/code/aws/ansible-docker-example 
CMD ["ansible", "--version"]
