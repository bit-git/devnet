FROM python:alpine3.12

RUN apk update && apk upgrade && apk add vim nano bash gcc musl-dev libc-dev libc6-compat linux-headers build-base git libffi-dev openssl-dev curl libxml2-dev libxslt-dev

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

CMD ["sh"]