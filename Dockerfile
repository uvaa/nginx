FROM nginx:alpine

ENV RENEWAL_INTERVAL="0 3 */7 * *"

COPY 00-init.sh /docker-entrypoint.d

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk add --no-cache certbot-nginx && \
	chmod u+x /docker-entrypoint.d/00-init.sh

VOLUME ["/etc/nginx", "/etc/letsencrypt"]
