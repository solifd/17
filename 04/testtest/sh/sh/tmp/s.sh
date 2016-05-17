#AL SETTING
TOEMAIL='hellosolifd@gmail.com'
COMMENT='linode VPS data backup.'
DIR='linodebackup'
# END SETTING

#TEST
echo 'Test First' | mutt -s 'Test First' $TOEMAIL
#

#prepare dir for backup file
TMP='/tmp/'${DIR}
ATTTMP='/tmp/linodeatt/'${DIR}
rm -rf $TMP
mkdir -p $TMP
cd $TMP

mkdir nginxconf
#cp -a /home/wwwroot/wordpress $TMP
cp -a /home/www/wordpress/wp-content/uploads/  $TMP
mysqldump --user=root --password=ggflying --lock-all-tables --all-databases > databasename$(date +"%Y%m%d").sql
mv databasename$(date +"%Y%m%d").sql $TMP/sql
#cp -a /usr/local/mysql/var $TMP/sql
#cp -a /usr/local/nginx/conf/* $TMP/nginxconf

YYYYMMDD=`date +%Y%m%d`
SUBJECT='linode_of_'${DIR}'_'${YYYYMMDD};
rm -rf $ATTTMP
mkdir -p $ATTTMP
cd $ATTTMP

tar -zcvf - $TMP|openssl des3 -salt -k k3g5ZmSuIInJOR7MFcpy | dd of=stuff.des3
#tar zcPf backup.tar.gz $TMP
rm -rf $TMP
split -b 1m -a 3 -d stuff.des3 ${SUBJECT}.part
rm -f stuff.des3

for file in *
do
echo $COMMENT | mutt -s $SUBJECT $TOEMAIL -a $file
sleep 30s
done

rm -rf $ATTTMP
rm -rf /root/sent
rm -rf /tmp/linode*

