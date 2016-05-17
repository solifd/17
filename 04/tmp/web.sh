cat web.part* >web.des3
rm -rf web.part* 
dd if=web.des3  |openssl des3 -d -k 5zq2o3y5ec|tar zxf -
rm -rf  web.des3
mv web /
