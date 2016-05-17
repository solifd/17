wget -c http://soft.vpser.net/lnmp/lnmp1.1-full.tar.gz && tar zxvf lnmp1.1-full.tar.gz && cd lnmp1.1-full && sed -i 's/--with-mysqld-ldflags=-all-static/ /g' centos.sh && ./centos.sh

