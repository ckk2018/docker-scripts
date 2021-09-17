FROM python:3.7.10-slim
LABEL maintainer="ckk2018"

# 设置本地时间的时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# 设置pip镜像源
RUN python -m pip config set global.index-url "https://mirrors.aliyun.com/pypi/simple"

CMD [ "echo", "hello python~" ]
