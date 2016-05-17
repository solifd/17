wget -c http://tengine.taobao.org/download/tengine-1.3.0.tar.gz

tar zxvf tengine-1.3.0.tar.gz

cd tengine-1.3.0

./configure

make

mv /usr/local/nginx/sbin/nginx /usr/local/nginx/sbin/nginx.old

cp -r objs/nginx /usr/local/nginx/sbin/nginx
