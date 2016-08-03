#
# Nova CLI Dockerfile
#

FROM python:2.7.12-alpine

RUN apk add --no-cache --virtual .pycrypto-build-deps \
       gcc \
       g++ \
       make \
       libffi-dev \
       openssl-dev \
       build-base \
    && apk add --no-cache git \
    && pip install -U gilt-nova \
    && apk del .pycrypto-build-deps \
    && rm -rf ~/.cache

WORKDIR /root

ENTRYPOINT [ "nova" ]
