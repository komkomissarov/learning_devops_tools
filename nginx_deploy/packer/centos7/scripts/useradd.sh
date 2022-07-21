sudo /usr/bin/yum upgrade -y
# Install SUDO
/usr/bin/yum -y install sudo
 
# Create gamma user
/usr/sbin/useradd gamma
/bin/mkdir -p /home/gamma/.ssh
/bin/chmod 700 /home/gamma/.ssh
echo "ssssssshhhhhhhhhh key here gamma" > /home/gamma/.ssh/authorized_keys

/bin/chmod 600 /home/gamma/.ssh/authorized_keys
/bin/chown -R gamma /home/gamma/.ssh
 
# Add gamma user to SUDO
echo "gamma        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/gamma
echo "Defaults:gamma !requiretty"                 >> /etc/sudoers.d/gamma
chmod 0440 /etc/sudoers.d/gamma