FROM ubuntu:22.04

MAINTAINER Kenny Van de Maele <kenny@adimian.com>

ARG TERRAFORM_VER="0.14.7"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install git curl wget unzip zip python3-pip && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VER}_linux_amd64.zip && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
    apt update && \
    apt -y upgrade && \
    apt-get -y install postgresql-client-12 && \
    mv terraform /usr/local/bin/

# default command: display packer version
CMD [ "terraform", "--version" ]
