    IPT="/sbin/iptables"
    $IPT --delete-chain
    $IPT --flush
    
    $IPT -t nat -F
    $IPT -t nat -X
    $IPT -t nat -P PREROUTING ACCEPT
    $IPT -t nat -P POSTROUTING ACCEPT
    $IPT -t nat -P OUTPUT ACCEPT
    $IPT -t mangle -F
    $IPT -t mangle -X
    $IPT -t mangle -P PREROUTING ACCEPT
    $IPT -t mangle -P INPUT ACCEPT
    $IPT -t mangle -P FORWARD ACCEPT
    $IPT -t mangle -P OUTPUT ACCEPT
    $IPT -t mangle -P POSTROUTING ACCEPT
    $IPT -F
    $IPT -X
    $IPT -P FORWARD ACCEPT
    $IPT -P INPUT ACCEPT
    $IPT -P OUTPUT ACCEPT
    $IPT -t raw -F
    $IPT -t raw -X
    $IPT -t raw -P PREROUTING ACCEPT
    $IPT -t raw -P OUTPUT ACCEPT
 
    #Default Policy
    $IPT -P INPUT DROP   
    $IPT -P FORWARD DROP
    $IPT -P OUTPUT DROP
     
    #INPUT Chain
    $IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    $IPT -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    $IPT -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
    $IPT -A OUTPUT -o ${PUB_IF} -p udp --dport 123 -m state --state NEW,ESTABLISHED -j ACCEPT
    $IPT -A INPUT -i ${PUB_IF} -p udp --sport 123 -m state --state ESTABLISHED -j ACCEPT
    
    $IPT -A OUTPUT -o ${PUB_IF} -p tcp --dport 25 -m state --state NEW,ESTABLISHED -j ACCEPT
    $IPT -A INPUT -i ${PUB_IF} -p tcp --sport 25 -m state --state ESTABLISHED -j ACCEPT
    
    $IPT -A INPUT -i lo -j ACCEPT
    $IPT -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
    $IPT -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT
    $IPT -A INPUT -p tcp --syn -m recent --name portscan --rcheck --seconds 60 --hitcount 10 -j LOG
    $IPT -A INPUT -p tcp --syn -m recent --name portscan --set -j DROP
    #OUTPUT Chain
    $IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    $IPT -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
    $IPT -A OUTPUT -o lo -j ACCEPT
    $IPT -A OUTPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
    $IPT -A OUTPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT

    $IPT -t nat -A POSTROUTING -s 172.16.36.0/24 -j SNAT --to-source 192.81.129.64
    $IPT -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    $IPT -A INPUT -i eth0 -p tcp --dport 1723 -j ACCEPT
    $IPT -A INPUT -i eth0 -p gre -j ACCEPT
    $IPT -A FORWARD -i ppp+ -o eth0 -j ACCEPT
    $IPT -A FORWARD -i eth0 -o ppp+ -j ACCEPT
    $IPT -A OUTPUT -p tcp --dport 1723 -j ACCEPT
    $IPT -A OUTPUT -p gre -j ACCEPT     
    #iptables save
    service iptables save
    service iptables restart
