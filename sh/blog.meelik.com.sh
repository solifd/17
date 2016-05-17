mkdir /tmp/blog.meelik.com$(date +"%Y%m%d")-backup
cd /tmp/blog.meelik.com$(date +"%Y%m%d")-backup
mysqldump --user=root --password=ggflying --lock-all-tables --all-databases >/tmp/blog.meelik.com$(date +"%Y%m%d")-backup/databasename$(date +"%Y%m%d").sql
tar -zcvf - /web/blog.meelik.com |openssl des3 -salt -k 5zq2o3y5ec | dd of=blog.meelik.com$(date +"%Y%m%d").des3
split -b 100m -a 3 -d blog.meelik.com$(date +"%Y%m%d").des3 blog.meelik.com$(date +"%Y%m%d").part
rm -rf blog.meelik.com$(date +"%Y%m%d").des3
tar -zcf - /usr/local/nginx/conf|openssl des3 -salt -k ra5i27mytd | dd of=conf$(date +"%Y%m%d").des3
sh /root/dropbox_uploader.sh upload /tmp/blog.meelik.com$(date +"%Y%m%d")-backup /blog.meelik.com$(date +"%Y%m%d")
rm -rf /tmp/blog.meelik.com$(date +"%Y%m%d")-backup
