# https://github.com/nginxinc/docker-nginx-unprivileged
FROM ghcr.io/nginxinc/nginx-unprivileged:stable-alpine AS webserver

RUN echo "absolute_redirect off;" >/etc/nginx/conf.d/no-absolute_redirect.conf

COPY nginx-default.conf /etc/nginx/conf.d/default.conf

# Test configuration during docker build
RUN nginx -t

# Port the container will listen on
EXPOSE 8080

COPY index.html /usr/share/nginx/html/index.html
COPY offline_notice.png /usr/share/nginx/html/offline_notice.png
