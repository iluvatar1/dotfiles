# In this file I specify some backup directories to be copied and verified
DIRS=(~/Desktop/work
      ~/Desktop/ScientificLibrary
      ~/Music
      ~/.gnupg
      ~/.ssh
      /etc
      /Library/LaunchDaemons
     )

TARGETBCKDIR="/Volumes/My Passport/BACKUP"
for a in ${DIRS[@]}; do
    bname=$(basename $a)
    echo "Copying : $a ..."
    cp -u -av "$a" "$TARGETBCKDIR/" 1>LOGS/log-cp-$bname 2>LOGS/err-cp-$bname 
    echo "Verifying copy with rsync ..."
    rsync --delete -av -P "$a"/ "$TARGETBCKDIR/$bname/" 1> LOGS/log-rsync-$bname 2> LOGS/err-rsync-$bname
    du -sh "$a"/ "$TARGETBCKDIR/$bname/"
    echo "Done."
done
