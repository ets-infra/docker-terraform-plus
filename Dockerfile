FROM ubuntu:18.04

MAINTAINER Kenny Van de Maele <kenny@adimian.com>

ARG TERRAFORM_VER="0.13.0"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install curl wget unzip zip python3-pip && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VER}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ 

# default command: display packer version
CMD [ "terraform", "--version" ]
