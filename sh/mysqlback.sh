 # /bin/bash 
    DB_NAME="--all-databases" 
    DB_USER="root" 
    DB_PASS="ggflying" 
    BIN_DIR="/usr/bin" 
    BACK_DIR="/data/backdata" 
    DATE="mysql-`date +'%Y%m%d-%H:%M:%S'`" 
    LogFile="$BACK_DIR"/dbbakup.log #日志记录保存的目录 
    BackNewFile=$DATE.sql 
    $BIN_DIR/mysqldump --opt --force -u$DB_USER  -p$DB_PASS $DB_NAME > $BACK_DIR/$DATE.sql 
    echo ----------"$(date +"%y-%m-%d %H:%M:%S")"------------ >> $LogFile 
    echo  createFile:"$BackNewFile" >> $LogFile 
    #find "/data/backdata/" -cmin +1 -type f -name "*.sql" -print > deleted.txt 
    find "/data/backdata/" -ctime +7 -type f -name "*.sql" -print > deleted.txt 
    echo -e "delete files:n" >> $LogFile 
    #循环删除匹配到的文件 
    cat deleted.txt | while read LINE 
    do 
    rm -rf $LINE 
    echo $LINE>> $LogFile 
    done 
    echo "---------------------------------------------------------------" >> $LogFile
