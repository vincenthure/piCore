sur le mac
sudo git clone git://gcc.gnu.org/git/gcc.git

######### transfert file from mac to raspberry #############

sudo scp vincent@192.168.0.15:/Volumes/DATA/vincent/gcc.zip  gcc.zip
sudo unzip gcc.zip

tce-load -i compiletc perl5 bash mpc-dev udev-lib-dev texinfo coreutils glibc_apps rsync gettext python3.6 git 
tce-load -i mpc-dev gmp-dev mpfr-dev coreutils
cd /mnt/mmcblk0p2

######### expand swap file #############
 
sudo dd if=/dev/zero of=swapfile1 bs=1024 count=1024000
sudo chown root:root swapfile1
sudo chmod 0600 swapfile1
sudo mkswap swapfile1
sudo swapon swapfile1
free -m

########## compile #################

sudo mkdir build
cd build

export CFLAGS="-march=armv6zk -mtune=arm1176jzf-s -mfpu=vfp"
export CXXFLAGS="-march=armv6zk -mtune=arm1176jzf-s -mfpu=vfp"

sudo ./configure --prefix=/usr/local --enable-languages=c,c++,fortran --disable-multilib --disable-bootstrap --with-system-zlib --libexecdir=/usr/local/lib

sudo make -j 4  DESTDIR=/mnt/mmcblk0p2/build

