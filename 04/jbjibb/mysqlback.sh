# /bin/bash
DB_NAME="dsideal_db"
DB_USER="root"
DB_PASS="123456"
BACK_DIR="/usr/local/dbbak"
DATE="$DB_NAME-`date +'%Y-%m-%d=%H:%M:%S'`"
LogFile="$BACK_DIR"/dbbakup.log #日志记录保存的目录
BackNewFile=$DATE.sql

mysqldump --opt --force -u$DB_USER  -p$DB_PASS $DB_NAME > $BACK_DIR/$DATE.sql
echo -----------------------"$(date +"%y-%m-%d %H:%M:%S")"----------------------- >> $LogFile
echo  createFile:"$BackNewFile" >> $LogFile
find "/usr/local/dbbak/" -mtime +7 -type f -name "*.sql" -print > deleted.txt
echo -e "delete files:\n" >> $LogFile
#循环删除匹配到的文件
cat deleted.txt | while read LINE
do
    rm -rf $LINE
    echo $LINE>> $LogFile
done
echo "---------------------------------------------------------------" >> $LogFile
