chmod 777 /usr/local/mysqlback.sh

crontab -e
0 03 * * * /usr/local/mysqlback.sh > /dev/null 2>&1
