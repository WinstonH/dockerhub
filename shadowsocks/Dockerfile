FROM alpine:edge

# Download applications
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
&& apk --update add --no-cache wget shadowsocks-libev \
# Get plugin
&& cd /tmp \
&& plugin_version=$(wget -O - https://api.github.com/repos/shadowsocks/v2ray-plugin/releases/latest | grep tag_name | awk  -F '"' '{print $4}') \
&& wget https://github.com/shadowsocks/v2ray-plugin/releases/download/$plugin_version/v2ray-plugin-linux-amd64-$plugin_version.tar.gz \
&& tar -xzvf v2ray-plugin-linux-amd64-*.tar.gz \
&& mv v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin \
# Clean
&& apk del wget \
&& rm -rf /tmp/* \
&& rm -rf /var/cache/apk/*

COPY entrypoint.sh /usr/local/bin/
COPY config.json /root/

EXPOSE 8080
CMD ["entrypoint.sh"]
