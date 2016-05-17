#AL SETTING
TOEMAIL='hellosolifd@gmail.com'
COMMENT='excle backup.'
DIR='linodebackup'
# END SETTING

#prepare dir for backup file
TMP='/tmp/'${DIR}
ATTTMP='/tmp/linodeatt/'${DIR}
rm -rf $TMP
mkdir -p $TMP
cd $TMP


cp -a /home/excle  $TMP



YYYYMMDD=`date +%Y%m%d`
SUBJECT='linode_of_'${DIR}'_'${YYYYMMDD};
rm -rf $ATTTMP
mkdir -p $ATTTMP
cd $ATTTMP

tar -zcvf - $TMP|openssl des3 -salt -k k3g5ZmSuIInJOR7MFcpy | dd of=stuff.des3

rm -rf $TMP
split -b 20m -a 3 -d stuff.des3 ${SUBJECT}.part
rm -f stuff.des3

for file in *
do
echo $COMMENT | mutt -s $SUBJECT $TOEMAIL -a $file
sleep 30s
done

rm -rf $ATTTMP
rm -rf /root/sent
rm -rf /tmp/linode*

