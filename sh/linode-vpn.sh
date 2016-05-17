
yum -y install make libpcap iptables gcc-c++ logrotate tar cpio perl pam tcp_wrappers
yum install -y perl ppp iptables
rpm -ivh pptpd-1.3.4-2.el6.x86_64.rpm
echo "localip 172.16.36.1" >> /etc/pptpd.conf
echo "remoteip 172.16.36.2-254" >> /etc/pptpd.conf
echo "ms-dns 8.8.8.8" >> /etc/ppp/options.pptpd
echo "ms-dns 8.8.4.4" >> /etc/ppp/options.pptpd
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1 /g' /etc/sysctl.conf
sed -i 's/net.ipv4.tcp_syncookies = 1/#net.ipv4.tcp_syncookies = 1 /g' /etc/sysctl.conf
echo "vpn pptpd ggflying *" >> /etc/ppp/chap-secrets
sysctl -p
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j SNAT --to-source 74.207.241.17                 
/etc/init.d/iptables restart
chkconfig pptpd on
chkconfig iptables on
/etc/init.d/pptpd stop
