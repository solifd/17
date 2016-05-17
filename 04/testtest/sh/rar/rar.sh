tar zxvf rarlinux-x64-5.1.0.tar.gz
cd rar
make
make install
mkdir -p /usr/local/bin 
mkdir -p /usr/local/lib 
cp rar unrar /usr/local/bin 
cp rarfiles.lst /etc 
cp default.sfx /usr/local/lib
rar --help
