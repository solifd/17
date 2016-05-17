yum -y install gcc-c++ libtool libsigc++20 libsigc++20-devel gcc gcc-c++ m4 make automake libtool pkgconfig perl openssl-devel ncurses-devel cppunit-devel xmlrpc-c-devel httpd
cp rutorrent.sh /etc/init.d/bt
./curl
cd ..
./libsigc
cd ..
./libtorrent
cd ..
./rtorrent
cd ..



wget http://libtorrent.rakshasa.no/export/1105/trunk/rtorrent/doc/rtorrent.rc
rm -rf ~/.rtorrent.rc
mv rtorrent.rc ~/.rtorrent.rc
mkdir /home/Video
echo "/usr/local/lib/" >> /etc/ld.so.conf
ldconfig
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
cat >>~/.rtorrent.rc<<-EOF
min_peers = 500
max_peers = 5000
max_uploads = 1000
download_rate = 0
upload_rate = 20
port_range = 37000-55000
encoding_list = UTF-8
directory = /home/Video
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
 
rm -rf /etc/init.d/bt
cp rtorrent.sh /etc/init.d/bt
chmod +x /etc/init.d/bt
/usr/local/bin/rtorrent

