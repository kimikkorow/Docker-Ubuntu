FROM ubuntu/nginx:latest

ENV TZ=Asia/Shanghai

ADD . /app

RUN cd /app && sh init.sh

WORKDIR /app/