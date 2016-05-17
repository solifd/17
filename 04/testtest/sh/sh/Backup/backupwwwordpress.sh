cd /
tar -zcvf - /home/www|openssl des3 -salt -k k3g5ZmSuIInJOR7MFcpy | dd of=stuff$(date +"%Y%m%d").des3

mv stuff$(date +"%Y%m%d").des3 /root
rm -rf  /root/stuff$(date -d -7day +"%Y%m%d").des3
