echo "where backup path:"
read path
echo "backup name:"
read backupname
mkdir /tmp/"${backupname}"$(date +"%Y%m%d")-backup
cd /tmp/"${backupname}"$(date +"%Y%m%d")-backup
/etc/init.d/mysql stop
tar -zcvf - "${path}" |openssl des3 -salt -k 5zq2o3y5ec | dd of="${backupname}"$(date +"%Y%m%d").des3
split -b 100m -a 3 -d "${backupname}"$(date +"%Y%m%d").des3 "${backupname}"$(date +"%Y%m%d").part
rm -rf "${backupname}"$(date +"%Y%m%d").des3
#tar -zcf - /root|openssl des3 -salt -k ra5i27mytd | dd of=root$(date +"%Y%m%d").des3
sh /root/dropbox_uploader.sh upload /tmp/"${backupname}"$(date +"%Y%m%d")-backup /"${backupname}"$(date +"%Y%m%d")
/etc/init.d/mysql start
rm -rf /tmp/"${backupname}"$(date +"%Y%m%d")-backup
