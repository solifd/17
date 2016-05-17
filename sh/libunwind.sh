if [ -s libunwind-1.1.tar.gz ]; then
echo "libunwind-1.1.tar.gz [found]"
else
echo "Error: libunwind-1.1.tar.gz not found!!!download now......"

wget -c http://mk88-10010277.file.myqcloud.com/libunwind-1.1.tar.gz
fi
tar zxvf libunwind-1.1.tar.gz
cd libunwind-1.1/
CFLAGS=-fPIC ./configure --prefix=/usr
make CFLAGS=-fPIC
make CFLAGS=-fPIC install
cd ..
rm -rf libunwind-1.1
