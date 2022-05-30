# This script includes a minimal setup to configure mint/ubuntu/debian

echo "Asking for sudo: please write your password "
sudo ls

echo "Configuring sources for apt"
#fix apt slow mirrors
if [ "" == "$(grep edatel /etc/apt/sources.list | grep -v grep)" ]; then
    sudo mv /etc/apt/sources.list /etc/apt/sources.list.old
    cat <<EOF >> sources.list
deb http://mirrors.advancedhosters.com/linuxmint/packages rosa main upstream import
deb http://extra.linuxmint.com rosa main
deb http://mirror.edatel.net.co/ubuntu trusty main restricted universe multiverse
deb http://mirror.edatel.net.co/ubuntu trusty-updates main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://archive.canonical.com/ubuntu/ trusty partner
deb-src http://archive.ubuntu.com/ubuntu trusty main restricted #Added by software-properties
deb-src http://archive.ubuntu.com/ubuntu trusty main restricted #Added by software-properties
deb-src http://gb.archive.ubuntu.com/ubuntu/ trusty restricted main universe multiverse #Added by software-properties
deb-src http://gb.archive.ubuntu.com/ubuntu/ trusty-updates restricted main universe multiverse #Added by software-properties
deb-src http://gb.archive.ubuntu.com/ubuntu/ trusty-backports main restricted universe multiverse #Added by software-properties
deb-src http://security.ubuntu.com/ubuntu trusty-security restricted main universe multiverse #Added by software-properties
deb-src http://gb.archive.ubuntu.com/ubuntu/ trusty-proposed restricted main universe multiverse #Added by software-properties
EOF
sudo mv sources.list /etc/apt/
fi


echo "Installing packages"
#sudo apt-get update 
sudo apt-get install -y build-essential w3m htop 
sudo apt-get install -y okular kdelibs-bin kdelibs5-data kdelibs5-plugins
sudo apt-get install -y inkscape wine 

echo "Updating git"
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install git


echo "Installing latest emacs, only if emacs does not exists"
STATUS=$(emacs --version)
if [ "0" != $? ]; then
    # Fix png error when anaconda is already installed and is replacin libpng-config
    PATH_OLD=$PATH
    export PATH= 

    sudo apt-get install -y libxaw7-dev libgcrypt11-dev
    sudo apt-get build-dep -y emacs24 

    cd ~/Downloads
    mkdir emacs
    cd emacs
    wget -c -nc  http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
    tar xf emacs-24.5.tar.gz && cd emacs-24.5
    ./configure 
    make -j 4
    sudo make install
    cd
    export PATH=$PATH_OLD
fi

echo "Installing and upgrading  anaconda"
STATUS=$(conda --version)
if [ "0" != "$?" ]; then 
    FNAME=Anaconda2-2.5.0-Linux-x86_64.sh
    wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/${FNAME}
    bash ${FNAME} -b
    conda update conda
    conda upgrade --all
fi

echo "Installing dropbox"
sudo apt-get install -y dropbox
echo "Now you have to run dropbox start -i in order to configure the daemon"

echo "Installing keepassx "
STATUS=$(keepassx -v &> /dev/null)  
if [ "0" != "$?" ]; then
    sudo apt-get install -y git cmake qtbase5-dev libqt5x11extras5-dev qttools5-dev qttools5-dev-tools libgcrypt20-dev zlib1g-dev
    git clone https://github.com/keepassx/keepassx.git 
    cd keepassx
    mkdir build
    cd build
    cmake .. 
    make -j 4
    sudo make install
fi

echo "Linking some usefull config"
for cname in .emacs .emacs.d .bashrc; do 
    mv ~/$cname ~/$cname.old
    ln -s ~/Dropbox/Apps/Mackup/$cname ~/$cname
done

echo "Installing scidavis through wine"
sudo apt-get install -y wine
wget "http://downloads.sourceforge.net/project/scidavis/SciDAVis/1.D9/scidavis.1.D009-win-dist.msi?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fscidavis%2Ffiles%2FSciDAVis%2F1.D9%2F&ts=1459874682&use_mirror=netix" -O scidavis.1.D009-win-dist.msi
msiexec /i scidavis.1.D009-win-dist.msi

echo "Installing and upgrading tex (this could take a lot of time)"
cd ~/Downloads
mkdir texlive && cd texlive
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xf install-tl-unx.tar.gz 
cd install-tl-20160313
sudo apt-get install -y perl-doc
echo "I assume you have put a profile in the current directory ..."
sudo ./install-tl --profile=tlmgr-mint.profile
#sudo ln -s /usr/local/texlive/2015/bin/x86_64-linux/* /usr/local/bin/ 

echo "Done"

