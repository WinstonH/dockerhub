FROM alpine:edge
RUN apk --update add --no-cache npm git \
&& git clone https://github.com/denghongcai/forsaken-mail.git /forsaken-mail \
&& apk del --purge git \
&& rm -rf /var/cache/apk/*
WORKDIR /forsaken-mail
RUN npm install
EXPOSE 25 3000
CMD npm start