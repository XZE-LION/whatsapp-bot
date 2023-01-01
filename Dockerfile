FROM ubuntu:20.04

RUN git clone https://github.com/XZE-LION/whatsapp-bot /root/whatsapp-bot
WORKDIR /root/whatsapp-bot/
ENV TZ=Asia/Jakarta
RUN npm install supervisor -g
RUN apk --no-cache --virtual build-dependencies add \
    python \
    make \
    g++ \
    && npm install \
    && apk del build-dependencies
RUN npm install

CMD ["node", "HandleMsg.js"]
