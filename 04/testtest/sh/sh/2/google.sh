yum -y install wget gcc make pam-devel libpng-devel


wget http://fukuchi.org/works/qrencode/qrencode-3.3.1.tar.gz
tar zxf qrencode-3.3.1.tar.gz
cd qrencode-3.3.1
./configure --prefix=/usr && make && make install



wget http://google-authenticator.googlecode.com/files/libpam-google-authenticator-1.0-source.tar.bz2
tar jxf libpam-google-authenticator-1.0-source.tar.bz2
cd libpam-google-authenticator-1.0
make && make install

google-authenticator
