FROM python:3.7.10-alpine
LABEL maintainer="ckk2018"
RUN apk add --no-cache tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && python -m pip config set global.index-url "https://mirrors.aliyun.com/pypi/simple"
CMD [ "echo", "hello world~" ]
