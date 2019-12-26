# Herosocks
Heroku + shadowsocks \
Deploy shadowsocks on heroku
## Principle
Simple-obfs convert the traffic into websocket instead of ordinary tcp connection, which could serve behind nginx. \
Theoretically, this enables ss-server to use any CDN that support websocket traffic, for example, Cloudflare.
## Password
Currently support to conifg password only \
Config env "PASSWORD" to set password \
example: `PASSWORD=ss2018` \
If you don't set one, the default password is `herosocks`
## How to use
Host: <app_name>.herokuapp.com \
Port: 80 \
Plug-in: simple-obfs \
Plug-in-options: obfs=http;obfs-host=<app_name>.herokuapp.com
