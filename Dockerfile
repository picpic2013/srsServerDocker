FROM ubuntu:18.04

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' > /etc/apt/sources.list \
&& echo 'Installing apt dependency' \
&& apt update > /dev/null \
&& apt install -y git gcc g++ unzip make python > /dev/null \
&& cd / \
&& git clone https://gitee.com/songboy/srs.git \
&& cd /srs/trunk \
&& echo "compilling..." \
&& /srs/trunk/configure > /dev/null 2>&1 && make > /dev/null 2>&1 \
&& echo '#!/bin/bash\ncd /srs/trunk\n./objs/srs -c ./conf/srs.conf\nwhile true; do sleep 1; done' > /start.sh \
&& chmod +x /start.sh

EXPOSE 1935

WORKDIR /srs/trunk

ENTRYPOINT ["/start.sh"]
