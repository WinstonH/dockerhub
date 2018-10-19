FROM alpine:latest
ENV PORT 8080

COPY config.json /etc/v2ray/config.json
COPY entrypoint.sh /usr/bin/

RUN set -ex \
&& apk --no-cache add curl wget unzip nginx ca-certificates \
&& mkdir -p /usr/bin/v2ray/ \
&& cd /usr/bin/v2ray/ \
&& VER=$(curl -s https://api.github.com/repos/v2ray/v2ray-core/releases/latest | grep tag_name | awk  -F '"' '{print $4}') \
&& wget https://github.com/v2ray/v2ray-core/releases/download/$VER/v2ray-linux-64.zip \
&& unzip v2ray-linux-64.zip \
&& rm v2ray-linux-64.zip \
&& mkdir /var/log/v2ray/  \
&& mkdir /run/nginx \
&& chmod +x /usr/bin/v2ray/v2ray /usr/bin/v2ray/v2ctl \
&& apk del --purge curl wget

COPY default.conf /etc/nginx/conf.d/default.conf
ENV PATH /usr/bin/v2ray:$PATH

EXPOSE $PORT
ENTRYPOINT ["entrypoint.sh"]
