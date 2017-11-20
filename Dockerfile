FROM alpine:3.6
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.11.188 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
RUN   apk update \                                                                    &&   apk add ca-certificates wget \
      &&   update-ca-certificates 

RUN wget https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip

RUN unzip terraform_0.10.8_linux_amd64.zip

RUN cp terraform /usr/local/bin

