mkdir /tmp/wordpress$(date +"%Y%m%d")-backup
cd /tmp/wordpress$(date +"%Y%m%d")-backup

#mysqldump --user=root --password=ggflying --lock-all-tables wordpress >/tmp/wordpress$(date +"%Y%m%d")-backup/wordpress$(date +"%Y%m%d").sql
mysqldump --user=root --password=ggflying --lock-all-tables --all-databases >/tmp/wordpress$(date +"%Y%m%d")-backup/databasename$(date +"%Y%m%d-%H").sql


tar -zcvf - /web/wordpress |openssl des3 -salt -k 5zq2o3y5ec | dd of=wordpress$(date +"%Y%m%d").des3
split -b 100m -a 3 -d wordpress$(date +"%Y%m%d").des3 wordpress$(date +"%Y%m%d").part
rm -rf wordpress$(date +"%Y%m%d").des3
#cp -p /etc/my.cnf /tmp/wordpress$(date +"%Y%m%d")-backup
#cp -p /usr/local/php/etc/php.ini /tmp/wordpress$(date +"%Y%m%d")-backup
#cp -p /etc/init.d/iptables /tmp/wordpress$(date +"%Y%m%d")-backup/iptables.backup
tar -zcf - /usr/local/nginx/conf|openssl des3 -salt -k ra5i27mytd | dd of=conf$(date +"%Y%m%d").des3
sh /web/dropbox_uploader.sh upload /tmp/wordpress$(date +"%Y%m%d")-backup /wordpress$(date +"%Y%m%d")

rm -rf /tmp/wordpress$(date +"%Y%m%d")-backup

