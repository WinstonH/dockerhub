#!/bin/sh
if [ -n "$UUID" ];then
    sed -i "s/UUID/$UUID/g" /etc/v2ray/config.json
else
    export UUID=$(uuidgen) && sed -i "s/UUID/$UUID/g" /etc/v2ray/config.json && echo "New generated UUID:$UUID"
fi

sed -i "s/PORT/$PORT/g" /etc/v2ray/config.json
v2ray -config=/etc/v2ray/config.json
