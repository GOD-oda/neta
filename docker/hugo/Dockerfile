FROM klakegg/hugo:0.94.2-alpine-ci

WORKDIR /var/www/html

RUN apk update && \
    apk add git

CMD ["hugo", "server", "-w"]