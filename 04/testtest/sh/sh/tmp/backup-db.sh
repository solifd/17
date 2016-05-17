#!/bin/sh
/usr/local/mysql/bin/mysqldump -uroot -pggflying --all-databases > /root/databasename$(date +"%Y%m%d").sql
rm /root/databasename$(date -d -7day +"%Y%m%d").sql
