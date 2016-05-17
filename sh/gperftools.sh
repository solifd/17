if [ -s gperftools-2.2.1.tar.gz ]; then
echo "gperftools-2.2.1.tar.gz [found]"
else
echo "Error: gperftools-2.2.1.tar.gz not found!!!download now......"

wget -c http://mk88-10010277.file.myqcloud.com/gperftools-2.2.1.tar.gz
fi
tar zxvf gperftools-2.2.1.tar.gz 
cd gperftools-2.2.1
./configure  
make && make install 
echo "/usr/local/lib" > /etc/ld.so.conf.d/usr_local_lib.conf 
/sbin/ldconfig
mkdir /tmp/tcmalloc
chmod 0777 /tmp/tcmalloc
cd ..
rm -rf gperftools-2.2.1
