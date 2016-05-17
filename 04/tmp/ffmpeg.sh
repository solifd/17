cat FFmpeginstal* >FFmpeginstall.des3
dd if=FFmpeginstall.part000 |openssl des3 -d -k 5zq2o3y5ec|tar zxf -
