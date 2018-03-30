## 多个基于alpine的v2ray镜像

- lite \
普通v2ray，无任何特殊加成，可通过环境变量修改端口和UUID
- http（待更新） \
底层协议使用websocket，利用nginx做了内部转发 \
设置正确的二级目录即可正常使用。
- kcptun（待更新） \
加装了kcptun的v2ray
- heroku \
可用于heroku平台，支持tls加密
