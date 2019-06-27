FROM alpine:latest
LABEL  maintener="contato@gabrielpetry.com.br"

COPY ./scripts/docker-entrypoint.sh /

RUN apk update && \
    chmod +x /docker-entrypoint.sh && \
    apk add nginx && \
    apk add sed && \
    mkdir -p /run/nginx && \
    mkdir -p /etc/nginx && \
    mkdir -p /var/www/html && \
    /usr/sbin/nginx && \
    adduser -D -H www


COPY ./conf/ /etc/nginx/

EXPOSE 80 443

CMD ["/docker-entrypoint.sh"]
