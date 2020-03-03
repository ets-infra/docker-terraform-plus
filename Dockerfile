FROM ubuntu:18.04

MAINTAINER Kenny Van de Maele <kenny@adimian.com>

ARG TERRAFORM_VER="0.12.21"
ARG AIVEN_VER="1.2.1"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install curl wget unzip zip python3-pip && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VER}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    mkdir -p ~/.terraform.d/plugins/linux_amd64/ && \
    curl -L https://github.com/aiven/terraform-provider-aiven/releases/download/v${AIVEN_VER}/terraform-provider-aiven-linux-amd64_v${AIVEN_VER} -o ~/.terraform.d/plugins/linux_amd64/terraform-provider-aiven && \
    chmod +x ~/.terraform.d/plugins/linux_amd64/terraform-provider-aiven

# default command: display packer version
CMD [ "terraform", "--version" ]
