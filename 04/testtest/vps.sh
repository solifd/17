#mkdir /tmp/backup$(date +"%Y%m%d")-backup
mkdir /tmp/data
cd /tmp/data
/etc/init.d/mysql stop
cp -r /web ./
cp -r /usr/local/nginx ./
cp -r /shell ./
#cp /etc/ipsec.conf ./
#cp /etc/ipsec.conf ./
#cp /etc/xl2tpd/xl2tpd.conf ./
#cp /etc/ppp/options.xl2tpd ./
#cp /etc/ppp/chap-secrets  ./
#cp /etc/sysconfig/iptables  ./
#cd /tmp/backup$(date +"%Y%m%d")-backup
#tar -zcvf - /tmp/data  |openssl des3 -salt -k 5zq2o3y5ec | dd of=backup$(date +"%Y%m%d").des3
#split -b 100m -a 3 -d backup$(date +"%Y%m%d").des3 backup$(date +"%Y%m%d").part
#rm -rf backup$(date +"%Y%m%d").des3
sh /shell/dropbox_uploader.sh upload /tmp/backup$(date +"%Y%m%d")-backup /backup$(date +"%Y%m%d")
/etc/init.d/mysql start
rm -rf /tmp/backup$(date +"%Y%m%d")-backup
