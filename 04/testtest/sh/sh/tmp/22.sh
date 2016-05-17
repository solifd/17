iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

    #iptables save
    service iptables save
    service iptables restart
