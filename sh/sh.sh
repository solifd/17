cd /tmp
tar zcvf sh$(date +"%Y%m%d").tar.gz /root/sh
sh /web/dropbox_uploader.sh upload   /tmp/sh$(date +"%Y%m%d").tar.gz /sh/sh$(date +"%Y%m%d").tar.gz
#rm -rf /tmp/*.tar.gz
