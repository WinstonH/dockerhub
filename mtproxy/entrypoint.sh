#!/bin/bash
if [ -n "$TGKEY" ];then
    echo "You've set a Key"
else
    echo "Cannot find a Key, use random one."
    TGKEY=$(head -c 16 /dev/urandom | xxd -ps)
fi
docker_ip=$(tail -n 1 /etc/hosts | awk '{print $1}')
ip=$(curl -s https://cloudfile.azurewebsites.net/getip.php)
tls_url=bing.com
hexurl=$(echo -n bing.com | xxd -ps)
echo "The config is auto-generated as below:"
echo "tg://proxy?server=${ip}&port=8080&secret=ee${TGKEY}${hexurl}"
/etc/mtproxy/mtproto-proxy -u nobody -p 10240 -H 8080 -S ${TGKEY} --nat-info ${docker_ip}:${ip} --aes-pwd proxy-secret proxy-multi.conf -D ${tls_url}
