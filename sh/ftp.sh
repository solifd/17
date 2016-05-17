mkdir /tmp/ftp/
cd /tmp/ftp/
mysqldump --user=root --password=ggflying --lock-all-tables --all-databases >/tmp/vps-backup/databasename$(date +"%Y%m%d").sql
tar -zcvf - /usr/ftp |openssl des3 -salt -k 5zq2o3y5ec | dd of=ftp$(date +"%Y%m%d").des3
tar -zcf - /usr/local/nginx/conf |openssl des3 -salt -k ra5i27mytd | dd of=conf$(date +"%Y%m%d").des3
#cp -p /etc/my.cnf /tmp/ftp/doc
#cp -p /usr/local/php/etc/php.ini /tmp/ftp/doc
#sh /root/dropbox_uploader.sh upload /tmp/ftp/doc
#rm -rf /tmp/vps-backup
rm -rf /tmp/ftp/databasename$(date -d -8day +"%Y%m%d").sql
rm -rf /tmp/ftp/conf$(date -d -8day +"%Y%m%d").des3
rm -rf /tmp/ftp/ftp$(date -d -8day +"%Y%m%d").des3
