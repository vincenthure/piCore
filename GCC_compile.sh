sur le mac
sudo git clone git://gcc.gnu.org/git/gcc.git

######### transfert file from mac to raspberry #############

sudo scp vincent@192.168.0.15:/Volumes/DATA/vincent/gcc.zip  gcc.zip
sudo unzip gcc.zip

tce-load -i compiletc perl5 bash mpc-dev udev-lib-dev texinfo coreutils glibc_apps rsync gettext python3.6 git 
tce-load -i mpc-dev gmp-dev mpfr-dev coreutils
cd /mnt/mmcblk0p2
sudo git clone https://gcc.gnu.org/git/gcc.git

######### expand swap file #############
 
sudo dd if=/dev/zero of=swapfile1 bs=1024 count=1024000
sudo chown root:root swapfile1
sudo chmod 0600 swapfile1
sudo mkswap swapfile1
sudo swapon swapfile1
free -m

########## compile #################

cd gcc
sudo mkdir gcc-build
cd gcc-build

sudo ../configure --prefix=$HOME/gcc-trunk --enable-languages=c,fortran --enable-checking=release --disable-bootstrap --disable-build-poststage1-with-cxx --disable-libstdcxx-pch

sudo make -j 4

