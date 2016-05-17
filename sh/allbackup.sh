mkdir /tmp/allbackup$(date +"%Y%m%d")-backup
cd /tmp/allbackup$(date +"%Y%m%d")-backup
/usr/local/mysql/bin/mysqldump -u root -pggflying --events --ignore-table=mysql.events --lock-all-tables  Wordpress | gzip > Wordpress$(date +"%Y%m%d-%H").sql.gz
tar -zcvf - /root Wordpress$(date +"%Y%m%d-%H").sql.gz /usr/local/nginx/conf /etc/pki/CA /home  --exclude=/home/wordpress/video  --exclude=/home/wordpress/photos --exclude=*.mp4 |openssl des3 -salt -k 5zq2o3y5ec | dd of=allbackup$(date +"%Y%m%d").des3
split -b 100m -a 3 -d allbackup$(date +"%Y%m%d").des3 allbackup$(date +"%Y%m%d").part
rm -rf allbackup$(date +"%Y%m%d").des3
#tar -zcf - /root|openssl des3 -salt -k ra5i27mytd | dd of=root$(date +"%Y%m%d").des3
cd ..
if [ -s dropbox_uploader.sh ]; then
echo "dropbox_uploader.sh [found]"
else
echo "Error: dropbox_uploader.sh not found!!!download now......"

curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh
fi
chmod 755 dropbox_uploader.sh



./dropbox_uploader.sh upload /tmp/allbackup$(date +"%Y%m%d")-backup /allbackup$(date +"%Y%m%d")
rm -rf /tmp/allbackup$(date +"%Y%m%d")-backup
rm -rf dropbox_uploader.sh
