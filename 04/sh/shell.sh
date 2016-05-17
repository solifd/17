mkdir shell$(date +"%Y%m%d")-backup
cd shell$(date +"%Y%m%d")-backup
tar zcvf shell.tar.gz /home/shell
cd ..
sh /home/shell/dropbox_uploader.sh upload shell$(date +"%Y%m%d")-backup shell$(date +"%Y%m%d")-backup
#sh /home/shell/dropbox_uploader.sh  delete shell$(date -d -7day +"%Y%m%d")-backup
rm -rf shell$(date +"%Y%m%d")-backup
