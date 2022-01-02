sur le mac
sudo git clone git://gcc.gnu.org/git/gcc.git

sudo scp vincent@192.168.0.15:/Volumes/DATA/vincent/gcc.zip  gcc.zip
sudo unzip gcc.zip

tce-load -iw compiletc perl5 ncursesw-dev bash mpc-dev udev-lib-dev texinfo coreutils glibc_apps rsync gettext python3.6 git 
tce-load -iw mpc-dev gmp-dev mpfr-dev
cd /mnt/mmcblk0p2
sudo mkdir build
cd build
export CFLAGS="-march=armv6zk -mtune=arm1176jzf-s -mfpu=vfp"
export CXXFLAGS="-march=armv6zk -mtune=arm1176jzf-s -mfpu=vfp"

sudo /mnt/mmcblk0p2/gcc/configure
