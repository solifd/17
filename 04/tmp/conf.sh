dd if=conf.des3 |openssl des3 -d -k ra5i27mytd|tar zxf -
rm -rf /usr/local/nginx/conf
cd usr/local/nginx/
mv conf /conf /usr/local/nginx/
ls /usr/local/nginx/conf
/root/lnmp restart
##
