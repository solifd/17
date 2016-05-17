mkdir /tmp/backup
cd /tmp
cp -a /home/www/wordpress/wp-content /tmp/backup/wp-content
tar -zcvf - /tmp/backup |openssl des3 -salt -k password | dd of=wp-content$(date +"%Y%m%d").des3
rm -rf /tmp/backup
split -b 50m -a 3 -d wp-content$(date +"%Y%m%d").des3 wp-content$(date +"%Y%m%d").part
rm -rf wp-content$(date +"%Y%m%d").des3
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload  /tmp/wp-content$(date +"%Y%m%d").part001
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload  /tmp/wp-content$(date +"%Y%m%d").part000
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload  /tmp/wp-content$(date +"%Y%m%d").part002
rm -rf /tmp/wp-content*
