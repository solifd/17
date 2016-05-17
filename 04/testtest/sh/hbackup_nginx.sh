sh /root/dropbox_uploader.sh download nginx.tar.gz nginx.tar.gz

rm -rf /usr/local/nginx/conf
cp -a /root/conf/ /usr/local/nginx/
/usr/local/nginx/sbin/nginx   -t
/etc/init.d/nginx   stop
/etc/init.d/nginx start
