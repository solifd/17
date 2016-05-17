yum -y install make libpcap iptables gcc-c++ logrotate tar cpio perl pam tcp_wrappers kernel-devel gcc iptables-services perl ppp iptable
cd /root/vpn
rpm -ivh dkms-2.2.0.3-21.el5.art.noarch.rpm
rpm  -ivh kernel_ppp_mppe-1.0.2-3dkms.noarch.rpm
rpm  -ivh pptpd-1.4.0-1.el6.x86_64.rpm
echo "localip 172.16.36.1" >> /etc/pptpd.conf
echo "remoteip 172.16.36.2-254" >> /etc/pptpd.conf
echo "ms-dns 8.8.8.8" >> /etc/ppp/options.pptpd
echo "ms-dns 8.8.4.4" >> /etc/ppp/options.pptpd
echo "vpn pptpd ggflying *" >> /etc/ppp/chap-secrets
sysctl -p
#iptables -t nat -A POSTROUTING -s 172.16.36.0/24 -j SNAT --to-source ‘ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk 'NR==1 { print $1}'’
iptables -t nat -A POSTROUTING -s 172.16.36.0/24 -j SNAT --to-source  106.185.28.223 
iptables -A FORWARD -p tcp --syn -s 172.16.36.0/24 -j TCPMSS --set-mss 1356
service iptables restar
chkconfig pptpd on
chkconfig iptables on
/etc/init.d/pptpd stop
service iptables save
service iptables restart
