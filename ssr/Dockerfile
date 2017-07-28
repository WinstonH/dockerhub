FROM alpine:latest
RUN apk --no-cache add git python && \
    git clone -b manyuser https://github.com/shadowsocksr-rm/shadowsocksr.git && \
    apk del git
WORKDIR shadowsocksr/shadowsocks
EXPOSE 8989
CMD python server.py -p 8989 -k alpine -m none -O auth_chain_a -o tls1.2_ticket_auth start
