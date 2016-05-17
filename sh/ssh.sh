ssh-keygen -t rsa
cd ~/.ssh
cat id_rsa.pub >> authorized_keys
chmod 400 authorized_keys
tar zcvf /web/wordpress/ssh$(date +"%Y%m%d").tar.gz /root/.ssh
rm -rf  /root/.ssh/id_rsa 
rm -rf  /root/.ssh/id_rsa.pub
sed -i 's/#ServerKeyBits 1024/#ServerKeyBits 1024/g'  /etc/ssh/sshd_config
sed -i 's/#RSAAuthentication yes/RSAAuthentication yes/g'  /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g'  /etc/ssh/sshd_config
sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/g'  /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g'  /etc/ssh/sshd_config
sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/g'  /etc/ssh/sshd_config
service sshd restart
