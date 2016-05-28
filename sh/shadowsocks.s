wget -c  http://soli-10006287.cos.myqcloud.com/oneinstack.tar.gz
tar xzf oneinstack.tar.gz
cd oneinstack
./shadowsocks.sh install
chkconfig --add shadowsocks
wget  http://fs.d1sm.net/finalspeed/install_fs.sh
chmod +x install_fs.sh
./install_fs.sh 2>&1 | tee install.log
