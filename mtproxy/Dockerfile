FROM ubuntu:18.04
RUN apt-get update \
&& apt install git curl build-essential libssl-dev zlib1g-dev xxd -y \
&& cd /tmp \
&& git clone https://github.com/TelegramMessenger/MTProxy \
&& cd MTProxy \
&& make \
&& cd objs/bin \
&& mkdir /etc/mtproxy \
&& mv mtproto-proxy /etc/mtproxy/mtproto-proxy \
&& cd /etc/mtproxy \
&& curl -s https://core.telegram.org/getProxySecret -o proxy-secret \
&& curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf \
&& apt-get remove --purge git build-essential -y \
&& apt autoremove -y \
&& apt-get clean \
&& rm -rf /tmp/* /var/lib/apt/lists/*
COPY entrypoint.sh /usr/bin/
WORKDIR /etc/mtproxy
CMD entrypoint.sh
