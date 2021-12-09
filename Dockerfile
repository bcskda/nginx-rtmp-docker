FROM alpine:3.14.3

RUN apk add --no-cache \
  libc6-compat \
  openssl \
  pcre \
  zlib

COPY install_root/ /
COPY nginx.conf /opt/nginx/conf/nginx.conf

EXPOSE 80 1935
ENTRYPOINT ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]
