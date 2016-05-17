cd /tmp
cp -r /home/123 /tmp/123
tar -zcvf - /tmp/123|openssl des3 -salt -k k3g5ZmSuIInJOR7MFcpy | dd of=Company$(date +"%Y%m%d").des3
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh delete Company$(date -d -3day +"%Y%m%d").des3
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload  /tmp/Company$(date +"%Y%m%d").des3
rm -rf /tmp/Company*
rm -rf /tmp/123

