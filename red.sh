n=0;
if [ n==0 ]
 then
  service ssh start
  service apache2 start
fi

USER_NAME=user
cat /etc/passwd | grep ${USER_NAME} >/dev/null 2>&1

if [ $? -eq 0 ] ; then
    echo "User Exists"
else
    useradd user -m
    echo 'user:user1' | chpasswd
    usermod -s /bin/bash user
    usermod -aG sudo user
    chown -R user:user /home/user
    chown -R user:user /var/www/html
fi

exit 0
