tar -zxf rutorrent-3.3.tar.gz
mv rutorrent  /home/www
chown -R www:www  /home/www/rutorrent/share/
sed -i 's/\/\/ $scgi/$scgi/g' /home/www/rutorrent/conf/config.php
sed -i 's/$scgi_port = 5000/\/\/ $scgi_port = 5000/g' /home/www/rutorrent/conf/config.php
sed -i 's/$scgi_host = "127/\/\/ $scgi_host = "127/g' /home/www/rutorrent/conf/config.php
