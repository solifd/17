#!/bin/sh
mysqldump --user=root --password=ggflying --lock-all-tables --all-databases >/root/backup-db/databasename$(date +"%Y%m%d").sql
rm -rf /root/backup-db/databasename$(date -d -7day +"%Y%m%d").sql
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload  /root/backup-db/databasename$(date +"%Y%m%d").sql
