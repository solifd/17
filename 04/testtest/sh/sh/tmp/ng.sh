kill -USR2 `cat /usr/local/nginx/logs/nginx.pid`
kill -QUIT `cat /usr/local/nginx/logs/nginx.pid.oldbin`
/etc/init.d/nginx  stop
/etc/init.d/nginx start
/usr/local/nginx/sbin/nginx -v
