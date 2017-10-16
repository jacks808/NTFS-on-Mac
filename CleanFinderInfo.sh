echo "#####################################"
echo "#  Begin to clean mac finder info   #"
echo "#####################################"

cd ~/Desktop/Disk/;find . -exec xattr -c {} \;
