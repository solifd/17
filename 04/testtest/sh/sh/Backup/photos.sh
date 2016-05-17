#AL SETTING
TOEMAIL='hellosolifd@gmail.com'
COMMENT='linode VPS data backup.'
DIR='linodebackup'
# END SETTING

#prepare dir for backup file
TMP='/tmp/'${DIR}
ATTTMP='/tmp/linodeatt/'${DIR}
rm -rf $TMP
mkdir -p $TMP
cd $TMP

mkdir nginxconf
#cp -a /home/wwwroot/wordpress $TMP
cp -a /home/photos/  $TMP
#mysqldump --user=root --password=ggflying --lock-all-tables --all-databases > databasename$(date +"%Y%m%d").sql
#mv databasename$(date +"%Y%m%d").sql $TMP/sql
#cp -a /usr/local/mysql/var $TMP/sql
#cp -a /usr/local/nginx/conf/* $TMP/nginxconf

YYYYMMDD=`date +%Y%m%d`
SUBJECT='linode_of_'${DIR}'_'${YYYYMMDD};
rm -rf $ATTTMP
mkdir -p $ATTTMP
cd $ATTTMP

tar -zcvf - $TMP|openssl des3 -salt -k k3g5ZmSuIInJOR7MFcpy | dd of=photos$(date +"%Y%m%d").des3
#tar zcPf backup.tar.gz $TMP
rm -rf $TMP
#split -b 20m -a 3 -d stuff.des3 $(date +"%Y%m%d").part
#rm -f stuff.des3

#for file in *
#do
#echo $COMMENT | mutt -s $SUBJECT $TOEMAIL -a $file
#sleep 30s
#done

#rm -rf $ATTTMP
#rm -rf /root/sent
#rm -rf /tmp/linode*
#sh /root/Dropbox-Uploader-master/dropbox_uploader.sh delete wordpress$(date -d -2day +"%Y%m%d").des3
sh /root/Dropbox-Uploader-master/dropbox_uploader.sh upload  /tmp/linodeatt/linodebackup/photos$(date +"%Y%m%d").des3

rm -rf /tmp/linodeatt/linodebackup/
