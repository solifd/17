#!/bin/bash

function list(){
sh /web/dropbox_uploader.sh  list
echo "dropbox list";
}

function download(){
echo "REMOTE_FILE:"
read REMOTE_FILE
echo "LOCAL_FILE:"
read LOCAL_FILE
sh /web/dropbox_uploader.sh  download  ${REMOTE_FILE}  ${LOCAL_FILE}
echo "dropbox download";
}

function upload(){
echo "REMOTE_FILE:"
read REMOTE_FILE
echo "LOCAL_FILE:"
read LOCAL_FILE
sh /web/dropbox_uploader.sh  upload    ${LOCAL_FILE}   ${REMOTE_FILE}
echo "dropbox upload";
}

function delete(){
echo "REMOTE_FILE:"
read REMOTE_FILE
sh /web/dropbox_uploader.sh  list
sh /web/dropbox_uploader.sh  delete       ${REMOTE_FILE}
echo "dropbox delete";
}

echo "which do you want to?input the number."
echo "1. list"
echo "2. download"
echo "3. upload"
echo "4.delete"
read num

case "$num" in
[1] ) (list);;
[2] ) (download);;
[3] ) (upload);;
[4] ) (delete);;
*) echo "nothing,exit";;
esac
