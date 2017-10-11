#!/bin/sh
# launch ssr
python /shadowsocksr/shadowsocks/server.py -p $PORT -k $PASSWD -m $METHOD -O $PROTOCOL -o $OBFS start -d
# launch kcptun server or client
/kcptun/${MODE}_linux_amd64 -c /kcptun/${MODE}-config.json 2>&1 &
