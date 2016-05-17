mkdir /tmp/vps
cd /tmp/vps
mysqldump --user=root --password=ggflying --lock-all-tables --events --ignore-table=mysql.events >databasename$(date +"%Y%m%d-%H").sql
tar -zcvf - /web |openssl des3 -salt -k 5zq2o3y5ec | dd of=web.des3
split -b 100m -a 3 -d web.des3 web.part
rm -rf web.des3
tar -zcvf - /root |openssl des3 -salt -k 5zq2o3y5ec | dd of=root.des3
split -b 100m -a 3 -d root.des3 root.part
rm -rf root.des3
tar -zcf - /usr/local/nginx/conf|openssl des3 -salt -k ra5i27mytd | dd of=conf$(date +"%Y%m%d").des3
sh /web/dropbox_uploader.sh upload /tmp/vps  /vps$(date +"%Y%m%d")

rm -rf /tmp/vps
