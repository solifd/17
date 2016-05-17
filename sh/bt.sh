yum -y install gcc-c++ libtool libsigc++20 libsigc++20-devel gcc gcc-c++ m4 make automake libtool pkgconfig perl openssl-devel ncurses-devel cppunit-devel xmlrpc-c-devel
yum install httpd
tar -xzxf curl-7.19.7.tar.gz 
tar -xzxf libsigc++-2.2.4.tar.gz
tar -xzxf libtorrent-0.13.3.tar.gz
tar -zxf  rtorrent-0.9.3.tar.gz 

cd curl-7.19.7
./configure
make && make install

cd ..
cd  libsigc++-2.2.4
./configure && make && make install

echo "/usr/local/lib/" >> /etc/ld.so.conf
ldconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
cd ..

cd libtorrent-0.13.3
rm -f scripts/{libtool,lt*}.m4
./autogen.sh
./configure
make && make install
cd ..

cd  rtorrent-0.9.3
rm -f scripts/{libtool,lt*}.m4
./autogen.sh
./configure --with-xmlrpc-c
make && make install
cd ..
rm -rf  libsigc++-2.2.4 
rm -rf  libtorrent-0.13.3 
rm -rf  curl-7.19.7
rm -rf  rtorrent-0.9.3


wget http://libtorrent.rakshasa.no/export/1105/trunk/rtorrent/doc/rtorrent.rc
rm -rf ~/.rtorrent.rc
mv rtorrent.rc ~/.rtorrent.rc

echo "/usr/local/lib/" >> /etc/ld.so.conf
ldconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
cat >>~/.rtorrent.rc<<-EOF
min_peers = 500
max_peers = 5000
max_uploads = 1000
download_rate = 0
upload_rate = 20
port_range = 19000-55000
encoding_list = UTF-8
directory = /home
session = /home/session
schedule = watch_directory,5,5,load_start=/home/wwwroot/torrent/*.torrent
dht = on
dht_port = 50000
execute_nothrow=rm,/tmp/rpc.socket
scgi_local = /tmp/rpc.socket
schedule = chmod,0,0,"execute=chmod,777,/tmp/rpc.socket"
EOF

rm -rf /home/session
mkdir /home/session
tar -zxf rutorrent-3.3.tar.gz
sed -i 's/\/\/ $scgi/$scgi/g' rutorrent/conf/config.php
sed -i 's/$scgi_port = 5000/\/\/ $scgi_port = 5000/g' rutorrent/conf/config.php
sed -i 's/$scgi_host = "127/\/\/ $scgi_host = "127/g' rutorrent/conf/config.php
chown -R www:www rutorrent/share/
mv rutorrent /home/wwwroot
sh err.sh
 
/usr/local/bin/rtorrent
