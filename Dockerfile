FROM ubuntu:22.04

MAINTAINER Kenny Van de Maele <kenny@adimian.com>

ARG TERRAFORM_VER="0.14.7"
ENV DEBIAN_FRONTEND=noninteractive
RUN  apt-get update && apt-get -y install git curl wget unzip zip python3-pip
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VER}_linux_amd64.zip
RUN  apt update && \
    apt -y upgrade && \
    apt-get -y install postgresql-client && \
    mv terraform /usr/local/bin/
RUN psql --version
# default command: display packer version
CMD [ "terraform", "--version" ]
