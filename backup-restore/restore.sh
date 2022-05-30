# TODO: Configure miniconda install
# TODO: Install mackup using pip
echo "Installing brew packages ..."
# Homebrew taps
TAPS=(
    homebrew/cask-fonts
    homebrew/cask-versions
    homebrew/cask
)
# Main processing
# Install command line tools
xcode-select --install
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
for tap in ${TAPS[@]}; do
    echo "Tapping : $tap"
    brew tap $tap
done
#echo "to update setuptools & pip run: pip install --upgrade setuptools pip install --upgrade pip"
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
brew cleanup

FNAME=brew_packages.txt
while read line; do
    echo $line | awk '{print $1}' | xargs brew install ;
done < $FNAME
brew cleanup
echo "Done."

echo "Installing brew cask packages using timeout of 180secs:"
echo "NOTE1: Packages asking for password will timeout and be killed ..."
echo "NOTE2: Large packages might be killed ..."
FNAME=brewcask_packages.txt
parallel -a brewcask_packages.txt --timeout 180 'brew install --cask --appdir=/Applications {}'
echo "Done."
brew cleanup

#echo "Installing conda packages with anaconda conda ..."
#PIPFILE=conda_packages.txt
#while read line; do
#    echo $line | awk '{print $1}' | xargs ~/miniconda3/bin/conda install -y  
#done < $PIPFILE
#echo "Done."

#echo "Installing pip packages with anaconda pip ..."
#PIPFILE=pip_packages.txt
#while read line; do
#    echo $line | awk '{print $1}' | xargs ~/miniconda3/bin/pip install --upgrade 
#done < $PIPFILE
#echo "Done."

#echo "Installing gem packages ..."
#GEMFILE=gem_packages.txt
#while read line; do
#    echo $line | awk '{print $1}' | xargs sudo gem update  ;
#done < $GEMFILE
#echo "Done."

#PERL_MODULES=(
#    Capture::Tiny
#    Clipboard
#    Crypt::Rijndael
#    File::KeePass
#    Mac::Pasteboard
#    Sort::Naturally
#    Term::ReadLine::Gnu
#    Term::ShellUI
#)
#echo "Installing cpan-perl modules ..."
#for MOD in ${PERL_MODULES[@]}; do
#    sudo cpan ${MOD}
#done
#echo "DO NOT FORGET TO REINSTALL kpcli AND UPDATE THE ALIAS"
#echo "Done."

echo "Restoring applications configurations with mackup"
echo "NOTE: You should have linked  .mackup.cfg from Dropbox \
for correct functioning ..."
sleep 10
mackup restore
echo "Done."


echo "TODO: DO NOT FORGET TO restore crontab from crontab.txt"
echo "TODO: DO NOT FORGET TO COPY YOUR .gnupg CONFIG DIRECTORY FROM THE TRUSTED LOCATION"
echo "TODO: DO NOT FORGET TO COPY YOUR .ssh CONFIG DIRECTORY FROM THE TRUSTED LOCATION"

echo "TODO: Add, to logins items: Quicksilver, flux, Dash, Appcleaner, Spectacle, Emacs Daemon"
echo "TODO: Configure sshguard and maybe fail2ban"

echo "Install manually the following apps:, iserial reader, Pocket, Popcorn-time, Serial Seeker , TIPP10"
