tar zxvf gperftools-2.0.tar.gz 
cd gperftools-2.0 
./configure  
make && make install 
echo "/usr/local/lib" > /etc/ld.so.conf.d/usr_local_lib.conf 
/sbin/ldconfig
mkdir /tmp/tcmalloc
chmod 0777 /tmp/tcmalloc
cd ..
tar zxvf nginx-1.5.0.tar.gz 
tar zxvf nginx-accesskey-2.0.3.tar.gz 
tar zxvf openssl-1.0.1e.tar.gz 
unzip  nginx-http-footer-filter-1.2.2.zip
mv  nginx-accesskey-2.0.3  openssl-1.0.1e nginx-http-footer-filter-1.2.2  nginx-1.5.0
cd nginx-1.5.0 
./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-ipv6 --with-google_perftools_module --add-module=nginx-accesskey-2.0.3 --with-openssl=openssl-1.0.1e/ --add-module=nginx-http-footer-filter-1.2.2/ --with-http_realip_module
 make && make install
cd ..

rm -rf nginx-1.5.0

rm -rf gperftools-2.0

yum -y install make libpcap iptables gcc-c++ logrotate tar cpio perl pam tcp_wrappers
service iptables start
iptables --flush

iptables -t nat -F
iptables -t nat -X
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT
iptables -t mangle -F
iptables -t mangle -X
iptables -t mangle -P PREROUTING ACCEPT
iptables -t mangle -P INPUT ACCEPT
iptables -t mangle -P FORWARD ACCEPT
iptables -t mangle -P OUTPUT ACCEPT
iptables -t mangle -P POSTROUTING ACCEPT
iptables -F
iptables -X
iptables -P FORWARD ACCEPT
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t raw -F
iptables -t raw -X
iptables -t raw -P PREROUTING ACCEPT
iptables -t raw -P OUTPUT ACCEPT

#Default Policy
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

#INPUT Chain
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --dport 25 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 25 -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -i eth0 -m state --state NEW -m recent --set
iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
iptables -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT
iptables -A INPUT -p tcp --syn -m recent --name portscan --rcheck --seconds 60 --hitcount 10 -j LOG
iptables -A INPUT -p tcp --syn -m recent --name portscan --set -j DROP

#OUTPUT Chain
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
iptables -A OUTPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT

iptables -t nat -A POSTROUTING -s 172.16.36.0/24 -j SNAT --to-source 192.81.129.64
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A INPUT -i eth0 -p tcp --dport 1723 -j ACCEPT
iptables -A INPUT -i eth0 -p gre -j ACCEPT
iptables -A FORWARD -i ppp+ -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT
iptables -A OUTPUT -p tcp --dport 1723 -j ACCEPT
iptables -A OUTPUT -p gre -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --dport 443 --syn -m state --state NEW -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 80 --syn -m state --state NEW -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 21 --syn -m state --state NEW -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --dport 53 -m state --state NEW -j ACCEPT

#iptables save
service iptables save
service iptables restart

/usr/local/nginx/sbin/nginx -v
iptables -L -n --line-numbers
