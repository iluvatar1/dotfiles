SSHFS_OPTIONS="reconnect,ServerAliveInterval=45,ServerAliveCountMax=3,transform_symlinks"

echo "Unmounting local file system"
fusermount -u -z mnt/laptop

# This part assumes that we need forst to go to the ssf server
#echo "ssh to ssf server"
##ssh -t -t oquendo@168.176.14.174 -p 443 $'fusermount -u mnt/laptop ; sshfs -o ssh_command=\'autossh -M 0\' -o '$SSHFS_OPTIONS'  oquendo@localhost:/Users/oquendo mnt/laptop/ -p 30022 '
##ssh -t -t oquendo@168.176.14.174 -p 443 "bash mount_laptop_sshfs.sh"
##echo "Run there the script mount_laptop_sshfs.sh" 
##ssh -t -t oquendo@168.176.14.174 -p 443  
#echo "Mounting locally"
#fusermount -u -z mnt/laptop
#sshfs -o ssh_command='autossh -M 0' -o "$SSHFS_OPTIONS"  oquendo@168.176.14.174:/home/oquendo/mnt/laptop mnt/laptop -p 443

# This part assumes that we can connect directly
echo "Mounting directly"
fusermount -u -z mnt/laptop
sshfs -o ssh_command='autossh -M 0' -o "$SSHFS_OPTIONS"  oquendo@valinorhome.ddns.net:/Users/oquendo mnt/laptop -p 443
