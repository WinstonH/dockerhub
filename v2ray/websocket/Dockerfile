FROM alpine:latest
ENV UUID=""
ENV PORT 8001

COPY config.json /etc/v2ray/config.json
COPY entrypoint.sh /usr/bin/

RUN set -ex \
&& apk --no-cache add curl wget unzip nginx ca-certificates \
&& mkdir /var/log/v2ray/  \
&& mkdir /run/nginx \
&& VER=$(curl -s https://api.github.com/repos/v2ray/v2ray-core/releases/latest | grep tag_name | awk  -F '"' '{print $4}') \
&& wget https://github.com/v2ray/v2ray-core/releases/download/$VER/v2ray-linux-64.zip \
&& unzip v2ray-linux-64.zip \
&& cd v2ray-$VER-linux-64 \
&& mkdir -p /usr/bin/v2ray/ \
&& mv v2ray /usr/bin/v2ray/ \
&& mv v2ctl /usr/bin/v2ray/ \
&& mv *.dat /usr/bin/v2ray/ \
&& cd .. \
&& rm -rf v2ray-$VER-linux-64 v2ray-linux-64.zip \
&& chmod +x /usr/bin/v2ray/v2ctl \
&& chmod +x /usr/bin/v2ray/v2ray \
&& apk del --purge curl wget

COPY default.conf /etc/nginx/conf.d/default.conf
ENV PATH /usr/bin/v2ray:$PATH

EXPOSE $PORT
ENTRYPOINT ["entrypoint.sh"]
