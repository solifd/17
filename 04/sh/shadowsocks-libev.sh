yum install build-essential autoconf libtool openssl-devel gcc -y
yum install git -y
git clone https://github.com/madeye/shadowsocks-libev.git
cd shadowsocks-libev
./configure
make && make install
#nohup /usr/local/bin/ss-server -s 156.132.67.213 -p 8981 -k admin888 -m aes-256-cfb &
#echo "nohup /usr/local/bin/ss-server -s IP地址 -p 端口 -k 密码 -m 加密方式 &" >> /etc/rc.local
#echo "sh /root/ss.sraer" >> /etc/rc.local
