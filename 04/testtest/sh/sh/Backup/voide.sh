mkdir /tmp/backup
cd /tmp
cp -a /home/www/wordpress/video /tmp/backup/video
tar -zcvf - /tmp/backup |openssl des3 -salt -k password | dd of=video$(date +"%Y%m%d").des3
rm -rf /tmp/backup
split -b 400m -a 3 -d video$(date +"%Y%m%d").des3 video$(date +"%Y%m%d").part
rm -rf video$(date +"%Y%m%d").des3
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload  /tmp/video$(date +"%Y%m%d").part001
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload  /tmp/video$(date +"%Y%m%d").part000
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh delete video$(date -d -8day +"%Y%m%d").part001
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh delete video$(date -d -8day +"%Y%m%d").part000
rm -rf /tmp/video*
