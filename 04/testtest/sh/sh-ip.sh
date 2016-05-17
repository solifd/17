cp /etc/hosts.allow /etc/hosts.allow.old
echo "sshd:106.185.28.223" >> /etc/hosts.allow
echo "sshd:106.185.28.223" >> /etc/hosts.allow
cp /etc/hosts.deny  /etc/hosts.deny.old
echo "sshd: ALL " >> /etc/hosts.deny

