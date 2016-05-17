echo "name:"
read name
echo "flie:"
read flie
useradd "${name}"
passwd "${name}"
groupadd test
usermod -G test "name:"
chgrp test "${file}"
chmod g+w  "${file}"
