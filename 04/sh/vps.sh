function wherebackup(){
curl "https://raw.githubusercontent.com/levelip/sh/master/backup.sh" -o backup.sh
chmod 755 backup.sh
./backup.sh
rm -rf backup.sh

}
function installVPN(){

if [ -s vpn.sh ]; then
echo "vpn.sh [found]"
else
echo "Error: vpn.sh not found!!!download now......"
curl "https://raw.githubusercontent.com/levelip/sh/master/vpn.sh" -o vpn.sh
chmod 755 vpn.sh
./vpn.sh
rm -rf vpn.sh
fi
}
function updateNginx(){

if [ -s nginx1.5.tar.gz ]; then
echo "nginx1.5.tar.gz [found]"
else
echo "Error: nginx1.5.tar.gz not found!!!download now......"
sh /root/dropbox_uploader.sh download nginx1.5.tar.gz /tmp/nginx1.5.tar.gz
cd /tmp
tar zxf nginx1.5.tar.gz
cd nginx1.5
sh nginxtmp.sh
fi
}
function installbt(){
if [ -s bt.tar.gz ]; then
echo "bt.tar.gz [found]"
else
echo "Error: bt.tar.gz not found!!!download now......"
sh /root/dropbox_uploader.sh download bt.tar.gz
tar zxvf bt.tar.gz
cd bt
sh bt.sh
echo "env[PATH] = $PATH" >> /usr/local/php/etc/php-fpm.conf
fi
}
function wordpressbackup(){
if [ -s wordpress.sh ]; then
echo "wordpress.sh [found]"
else
echo "Error: wordpress.sh not found!!!download now......"

curl "https://raw.githubusercontent.com/levelip/sh/master/wordpress.sh" -o wordpress.sh
fi
chmod 755 wordpress.sh
./wordpress.sh
rm -rf wordpress.sh

}
function meelikbackup(){
if [ -s blog.meelik.com.sh ]; then
echo "blog.meelik.com.sh [found]"
else
echo "Error: blog.meelik.com.sh not found!!!download now......"

curl "https://raw.githubusercontent.com/levelip/sh/master/blog.meelik.com.sh" -o blog.meelik.com.sh
fi
chmod 755 blog.meelik.com.sh
./blog.meelik.com.sh
rm -rf blog.meelik.com.sh

}
function lnmpinstall(){
if [ -s lnmp_install.sh ]; then
echo "lnmp_install.sh [found]"
else
echo "Error: lnmp_install.sh not found!!!download now......"

curl "https://raw.githubusercontent.com/levelip/sh/master/lnmp_install.sh" -o lnmp_install.sh
fi
chmod 755 lnmp_install.sh
./lnmp_install.sh
rm -rf lnmp_install.sh

}
function sysctlsafe(){
if [ -s sysctl.sh ]; then
echo "sysctl.sh [found]"
else
echo "Error: sysctl.sh not found!!!download now......"

curl "https://raw.githubusercontent.com/levelip/sh/master/sysctl.sh" -o sysctl.sh
fi
chmod 755 sysctl.sh
./sysctl.sh
rm -rf sysctl.sh
        }
function sshsafe(){
if [ -s ssh.sh ]; then
echo "ssh.sh [found]"
else
echo "Error: ssh.sh not found!!!download now......"

curl "https://raw.githubusercontent.com/levelip/sh/master/ssh.sh" -o ssh.sh
fi
chmod 755 ssh.sh
./ssh.sh
rm -rf ssh.sh
        }
function useradd(){
if [ -s useradd.sh ]; then
echo "useradd.sh [found]"
else
echo "Error: useradd.sh not found!!!download now......"

curl "https://raw.githubusercontent.com/levelip/sh/master/useradd.sh" -o useradd.sh
fi
chmod 755 useradd.sh
./useradd.sh
rm -rf useradd.sh
        }
echo "which do you want to?input the number."
echo "1. where backup"
echo "2. installVPN"
echo "3. updateNginx"
echo "4.install bt"
echo "5.wordpressbackup"
echo "6.blog.meelik.combackup"
echo "7.lnmp_install"
echo "8.sysctlsafe"
echo "9.sshsafe"
echo "10.useradd"
read num

case "$num" in
[1] ) (wherebackup);;
[2] ) (installVPN);;
[3] ) (updateNginx);;
[4] ) (installbt);;
[5] ) (wordpressbackup);;
[6] ) (meelikbackup);;
[7] ) (lnmpinstall);;
[8] ) (sysctlsafe);;
[9] ) (sshsafe);;
[10] ) (useradd);;
*) echo "nothing,exit";;
esac
