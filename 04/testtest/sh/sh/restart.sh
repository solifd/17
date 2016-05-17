#!/bin/bash

function nginxrestart(){
     /etc/init.d/nginx restart

}

function php-fpmrestart(){
        /etc/init.d/php-fpm restart
}

function mysqlrestart(){
       /etc/init.d/mysql restart
}
function memcachedrestart(){
 /etc/init.d/memcached restart
       }
function pureftpdrestart(){
  /etc/init.d/pureftpd restart
       }
echo "which do you want to?input the number."
echo "1. nginx restart"
echo "2. php-fpm restart"
echo "3. mysql restart"
echo "4.memcached restart"
echo "5.pureftpd restart"
read num

case "$num" in
[1] ) (nginxrestart);;
[2] ) (php-fpmrestart);;
[3] ) (mysqlrestart);;
[4] ) (memcachedrestart);;
[5] ) (pureftpdrestart);;
*) echo "nothing,exit";;
esac
