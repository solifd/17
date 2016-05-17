cat >>~/.rtorrent.rc<<-EOF
min_peers = 500
max_peers = 5000
max_uploads = 10
download_rate = 0
upload_rate = 2000
port_range = 19000-55000
encoding_list = UTF-8
directory = /home
session = /home/session
schedule = watch_directory,5,5,load_start=/home/wwwroot/torrent/*.torrent
dht = on
dht_port = 50000
execute_nothrow=rm,/tmp/rpc.socket
scgi_local = /tmp/rpc.socket
schedule = chmod,0,0,"execute=chmod,777,/tmp/rpc.socket"
EOF

mkdir /home/session
