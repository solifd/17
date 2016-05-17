mkdir video$(date +"%Y%m%d")-backup
cd video$(date +"%Y%m%d")-backup
tar zcvf video.tar.gz /home/wordpress/video  
cd ..
sh /home/shell/dropbox_uploader.sh upload video$(date +"%Y%m%d")-backup video$(date +"%Y%m%d")-backup
#sh /home/shell/dropbox_uploader.sh  delete video$(date -d -7day +"%Y%m%d")-backup
rm -rf video$(date +"%Y%m%d")-backup
