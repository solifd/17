mkdir photos$(date +"%Y%m%d")-backup
cd photos$(date +"%Y%m%d")-backup
tar zcvf photos.tar.gz /home/wordpress/photos  
cd ..
if [ -s dropbox_uploader.sh ]; then
echo "dropbox_uploader.sh [found]"
else
echo "Error: dropbox_uploader.sh not found!!!download now......"

curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader.sh
fi
chmod 755 dropbox_uploader.sh
./dropbox_uploader.sh upload photos$(date +"%Y%m%d")-backup photos$(date +"%Y%m%d")-backup
rm -rf dropbox_uploader.sh
#sh /home/shell/dropbox_uploader.sh  delete photos$(date -d -7day +"%Y%m%d")-backup
rm -rf photos$(date +"%Y%m%d")-backup
