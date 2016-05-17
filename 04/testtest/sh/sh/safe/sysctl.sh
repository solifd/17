cp /etc/sysctl.conf /etc/sysctl.conf.old
modprobe bridge
lsmod|grep bridge
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.conf
echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.log_martians = 1 " >> /etc/sysctl.conf
echo "net.ipv4.conf.default.log_martians = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter = 1 " >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_redirects = 0 " >> /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_redirects = 0 " >> /etc/sysctl.conf
echo "net.ipv4.conf.all.secure_redirects = 0 " >> /etc/sysctl.conf
echo "net.ipv4.conf.default.secure_redirects = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.send_redirects = 0 " >> /etc/sysctl.conf
echo "kernel.randomize_va_space = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.secure_redirects = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.secure_redirects = 0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.router_solicitations = 0 " >> /etc/sysctl.conf
echo "net.ipv6.conf.default.accept_ra_pinfo = 0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.accept_ra_defrtr = 0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.autoconf = 0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.dad_transmits = 0 " >> /etc/sysctl.conf
echo "net.ipv6.conf.default.max_addresses = 1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.conf
echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.conf
echo "net.ipv4.ip_local_port_range = 2000 65000 " >> /etc/sysctl.conf
echo "net.ipv4.tcp_rmem = 4096 87380 8388608" >> /etc/sysctl.conf
echo "net.ipv4.tcp_wmem = 4096 87380 8388608 " >> /etc/sysctl.conf
echo "net.core.rmem_max = 8388608 " >> /etc/sysctl.conf
echo "net.core.wmem_max = 8388608 " >> /etc/sysctl.conf
echo "net.core.netdev_max_backlog = 5000" >> /etc/sysctl.conf
sed -i "s/net.ipv4.tcp_syncookies = 1/#net.ipv4.tcp_syncookies = 1/g"  `grep "net.ipv4.tcp_syncookies = 1"  -rl /etc/sysctl.conf` 
sysctl -p
