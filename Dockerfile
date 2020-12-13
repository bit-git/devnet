# devnet dockerfile
FROM python:alpine3.12

RUN apk update && apk upgrade && apk add openssh \
                                         vim \
                                         nano \
                                         bash \
                                         curl \
                                         git \
                                         gcc musl-dev \
                                         libc-dev \
                                         libc6-compat \
                                         linux-headers \
                                         build-base \
                                         libffi-dev \
                                         openssl-dev \
                                         libxml2-dev \
                                         libxslt-dev \
                                         graphviz \
                                         graphviz-dev

WORKDIR /root/workspace/

# Repo
RUN git clone https://github.com/bit-git/devnet.git .
RUN python -m pip install -r requirements.txt

# DNA
RUN git clone https://github.com/CiscoDevNet/dne-dna-code

# Security
RUN git clone https://github.com/CiscoDevNet/dne-security-code

# Data Center Infrastructure
RUN git clone https://github.com/CiscoDevNet/dciv2-code

# Meraki
RUN git clone https://github.com/CiscoDevNet/meraki-code
RUN cd meraki-code && git clone -b solutions https://github.com/CiscoDevNet/meraki-code.git solutions && cd ..

# DevNet Express 
RUN git clone https://github.com/CiscoDevNet/devnet-express-code-samples

CMD ["sh"]