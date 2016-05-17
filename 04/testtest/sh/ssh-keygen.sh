rm -rf /root/.ssh
ssh-keygen -t rsa
cd ~/.ssh
cat id_rsa.pub >> authorized_keys
chmod 400 authorized_keys
zip -r  -P z86qsSXY8Czgx7J /web/tx/sh.zip /root/.ssh/id_rsa /root/.ssh/id_rsa.pub
rm -rf  /root/.ssh/id_rsa 
rm -rf  /root/.ssh/id_rsa.pub
sed -i 's/#Port 22/Port 59999/g'  /etc/ssh/sshd_config
sed -i 's/#ServerKeyBits 1024/#ServerKeyBits 1024/g'  /etc/ssh/sshd_config
sed -i 's/#RSAAuthentication yes/RSAAuthentication yes/g'  /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g'  /etc/ssh/sshd_config
sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/g'  /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g'  /etc/ssh/sshd_config
sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/g'  /etc/ssh/sshd_config
service sshd restart

