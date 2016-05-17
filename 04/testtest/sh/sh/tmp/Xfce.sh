yum -y update
yum -y install tigervnc
yum -y install tigervnc-server
wget https://unxmail.googlecode.com/files/epel-release-6-7.noarch.rpm
rpm -ivh epel-release-6-7.noarch.rpm
yum search xfce
yum groupinfo xfce
yum groupinstall xfce
yum -y groupinstall chinese-support
 
yum -y groupinstall chinese-support
yum -y install firefox
wget http://fpdownload.macromedia.com/get/flashplayer/pdc/11.2.202.238/install_flash_player_11_linux.x86_64.tar.gz
tar zxvf install_flash_player_11_linux.x86_64.tar.gz
mkdir -p ~/.mozilla/plugins/
cp libflashplayer.so ~/.mozilla/plugins/
