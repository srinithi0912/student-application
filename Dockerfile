FROM nginx:alpine

COPY public /usr/share/nginx/html

RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf && \
    sed -i 's/listen  \[::\]:80;/listen       8080;/g' /etc/nginx/conf.d/default.conf && \
    sed -i 's|pid        /var/run/nginx.pid;|pid        /tmp/nginx.pid;|' /etc/nginx/nginx.conf && \
    sed -i 's|/var/cache/nginx/client_temp|/tmp/client_temp|' /etc/nginx/nginx.conf && \
    mkdir -p /tmp/client_temp && \
    chmod -R 777 /tmp/client_temp /usr/share/nginx/html

EXPOSE 8080
