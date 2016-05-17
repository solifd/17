cd /tmp
mkdir vps-backups
cd /tmp/vps-backups
tar -zcf - /usr/local/nginx/conf|openssl des3 -salt -k ra5i27mytd | dd of=conf$(date +"%Y%m%d").des3
#sh /root/Dropbox-Uploader-master/dropbox_uploader.sh delete conft$(date -d -3day +"%Y%m%d").des3
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload /tmp/vps-backups /myvpsfilesbackups/conf-backups
#sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload  /tmp/root$(date +"%Y%m%d").des3
rm -rf /tmp/root*
#rm -rf /tmp/123
