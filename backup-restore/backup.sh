echo "Backing up brew packages ..."
brew leaves > brew_packages.txt
echo "Done."

echo "Backing up brew cask packages ..."
brew list --cask > brewcask_packages.txt
echo "Done."

echo "Backing up general configurations with mackup ..."
mackup backup
echo "Done."

# echo "Backing up conda packages ..."
# conda list | awk '{print $1}' > conda_packages.txt
# echo "Done."

# echo "Backing up pip packages ..."
# pip list | awk '{print $1}' > pip_packages.txt
# echo "Done."

# echo "Backing up gem packages ..."
# gem list > gem_packages.txt
# echo "Done."

echo "Backing up crontab config ..."
crontab -l > crontab.txt
echo "Done."

echo "DO NOT FORGET TO EDIT AND RUN THE backup_directories.sh script."
#echo "DO NOT FORGET TO CHECK THE CPAN MODULES FROM instmodsh AND THE RESTORE SCRIPT"
echo "DO NOT FORGET TO COPY YOUR ~/Library/Application Support/Plex Media Server/"
