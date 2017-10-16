echo "#####################################"
echo "#  Begin to clean mac finder info   #"
echo "#####################################"

cd ~/Desktop/Disk/;
find . -type d -exec xattr -c {} \; -exec ls -l {} \;
