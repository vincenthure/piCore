sur le mac
sudo git clone git://gcc.gnu.org/git/gcc.git

######### transfert file from mac to raspberry #############

sudo scp vincent@192.168.0.15:/Volumes/DATA/vincent/gcc.zip  gcc.zip
sudo unzip gcc.zip

tce-load -iw compiletc perl5 ncursesw-dev bash mpc-dev udev-lib-dev texinfo coreutils glibc_apps rsync gettext python3.6 git 
tce-load -iw mpc-dev gmp-dev mpfr-dev
cd /mnt/mmcblk0p2

######### expand swap file #############
 
dd if=/dev/zero of=swapfile1 bs=1024 count=102400
chown root:root swapfile1
chmod 0600 swapfile1
mkswap swapfile1
swapon swapfile1
free -m

########## compile #################

sudo mkdir build
cd build

export CFLAGS="-march=armv6zk -mtune=arm1176jzf-s -mfpu=vfp"
export CXXFLAGS="-march=armv6zk -mtune=arm1176jzf-s -mfpu=vfp"

sudo /mnt/mmcblk0p2/gcc/configure --prefix=/usr/local --enable-languages=c,c++,fortran --disable-multili
b --disable-bootstrap --with-system-zlib --libexecdir=/usr/local/lib


