#!/bin/bash -ex

cd nginx

./auto/configure \
  --prefix=/opt/nginx \
  \
  --add-module=../nginx-module-rtmp \
  \
  --with-pcre \
  \
  --without-http_mirror_module \
  --without-http_autoindex_module \
  --without-http_geo_module \
  --without-http_map_module \
  --without-http_split_clients_module \
  --without-http_referer_module \
  --without-http_rewrite_module \
  --without-http_proxy_module \
  --without-http_fastcgi_module \
  --without-http_uwsgi_module \
  --without-http_scgi_module \
  --without-http_grpc_module \
  --without-http_memcached_module \
  --without-http_empty_gif_module \
  --without-http_browser_module \
  \
  --with-cpu-opt=generic64 \

make -j6

test -d ../install_root && rm -r ../install_root
mkdir -p ../install_root/opt/nginx/{sbin,logs}
cp objs/nginx ../install_root/opt/nginx/sbin/nginx
cp -r conf/ ../install_root/opt/nginx/conf
