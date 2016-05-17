if [ -s openssl-1.0.2d.tar.gz ]; then
echo "openssl-1.0.2d.tar.gz [found]"
else
echo "Error: openssl-1.0.2d.tar.gz not found!!!download now......"

wget -c http://mk88-10010277.file.myqcloud.com/openssl-1.0.2d.tar.gz
fi
tar zxvf openssl*.tar.gz  
cd openssl* 
./config --prefix=/usr/local/openssl  
make && make install  
mv /usr/bin/openssl /usr/bin/openssl.OFF  
mv /usr/include/openssl /usr/include/openssl.OFF  
ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl  
ln -s /usr/local/openssl/include/openssl /usr/include/openssl  
echo "/usr/local/openssl/lib">>/etc/ld.so.conf  
ldconfig -v  
openssl version -a 
