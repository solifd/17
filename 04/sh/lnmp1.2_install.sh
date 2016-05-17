
wget -c http://soft.vpser.net/lnmp/lnmp1.2-full.tar.gz && tar zxf lnmp1.2-full.tar.gz && cd lnmp1.2-full &&sed -i 's/--with-mysqld-ldflags=-all-static/ /g' install.sh&&./install.sh
