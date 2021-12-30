########### load dependency ############

tce-load -i comiletc
tce-load -i python3.8-dev
tce-load -i squashfs-tools

########### compile #########

wget -c https://github.com/RTIMULib/RTIMULib2.git
cd RTIMULib2-master/Linux/python
python3 setup.py build
sudo python3 setup.py install

########### prepare tempory folder ###########

cd /tmp
mkdir -p rtimulib/usr/local/lib/python3.8/site-packages

########### move file to tempory folder #############

cd /usr/local/lib/python3.8/site-packages
sudo mv RTI* /tmp/rtimulib/usr/local/lib/python3.8/site-packages
cd /tmp
ls rtimulib/usr/local/lib/python3.8/site-packages

################ make tcz file ##############

mksquashfs rtimulib rtimulib.tcz
cp -v rtimulib.tcz /etc/sysconfig/tcedir/optional

############## add to list to load on boot ############

cd /etc/sysconfig/tcedir
nano onboot.lst
filetool.sh -b
