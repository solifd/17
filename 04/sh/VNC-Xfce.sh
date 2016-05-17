yum -y update
yum -y install tigervnc
yum -y install tigervnc-server
wget https://unxmail.googlecode.com/files/epel-release-6-7.noarch.rpm 
rpm -ivh epel-release-6-7.noarch.rpm 
yum search xfce 
yum groupinfo xfce  -y
yum groupinstall xfce -y

cat >>/etc/sysconfig/vncservers<<-EOF
VNCSERVERS="1:root"
VNCSERVERARGS[1]="-geometry 800x600"
EOF
vncpasswd
service vncserver restart

yum -y groupinstall chinese-support
sed -i '1,$d' /root/.vnc/xstartup
cat >>/root/.vnc/xstartup<<-EOF
#!/bin/sh
# Uncomment the following two lines for normal desktop:
unset SESSION_MANAGER
#exec /etc/X11/xinit/xinitrc
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
#xterm -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
#twm &
startxfce4 &
EOF

sed -i '1,$d' /etc/sysconfig/i18n
echo "LANGUAGE="zh_CN.GB18030:zh_CN.GB2312:zh_CN"" >> /etc/sysconfig/i18n
echo "SUPPORTED="zh_CN.GB18030:zh_CN:zh:en_US.UTF-8:en_US:en"" >> /etc/sysconfig/i18n
echo "SYSFONT="lat0-sun16"" >> /etc/sysconfig/i18n
echo "export LC_ALL="zh_CN.GB18030"" >> /etc/sysconfig/i18n
yum -y install firefox
service vncserver restart
chkconfig vncserver on
#wget http://fpdownload.macromedia.com/get/flashplayer/pdc/11.2.202.238/install_flash_player_11_linux.x86_64.tar.gz
#tar zxvf install_flash_player_11_linux.x86_64.tar.gz
#mkdir -p ~/.mozilla/plugins/
#cp libflashplayer.so ~/.mozilla/plugins/

