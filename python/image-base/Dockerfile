FROM python:3.7.10-alpine
LABEL maintainer="ckk2018"

# 设置本地时间的时区
RUN apk add --no-cache tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

CMD [ "echo", "hello python~" ]
