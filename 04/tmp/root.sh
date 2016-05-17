cat root.part* >root.des3
rm -rf root.part* 
dd if=root.des3  |openssl des3 -d -k 5zq2o3y5ec|tar zxf -
rm -rf  root.des3
#rm -rf /root*
#cd root
#mv * /root
