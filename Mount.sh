# /usr/bash

# copy right
# 所有版权归属ziyi.wang(jacks808@163.com)所有. 你可以自由的使用\复制\修改本脚本.但是请勿用于商业化用途! 并请保留版权说明!
# All copyright receive ziyi.wang(jacks808@163.com). You can Use\Copy\Modify this shell free. But DO NOT use for business! Please keep this copy right description!

echo "###########################################"
echo "#          开始挂载USB NTFS硬盘           #"
echo "#     Begin to mount USB NTFS Disk        #"
echo "###########################################"

# find volumes and disk info
VOL_NAME=/Volumes/`ls /Volumes/ |grep -v MAC`/
echo "卷位置: "$VOL_NAME
if [ $VOL_NAME = '/Volumes//' ]; then 
	echo ""
	echo "###########################################"
	echo "#  无法找到USB硬盘设备, 请确认已经接入USB #"
	echo "#       Cat't fund USB disk device        #"
	echo "###########################################"
	exit 1
fi

DISK_PATH=`diskutil info $VOL_NAME |grep 'Device Node:'|awk '{print $3}'`

# umount volumes
sudo umount $VOL_NAME

# add filesystem mount point
mkdir -p /Users/didi/Desktop/Disk/

# mount new disk
sudo mount_ntfs -o rw,nobrowse $DISK_PATH ~/Desktop/Disk/



if [ $? -eq 0 ]; then 
	echo "###########################################"
	echo "#                 挂载成功                #"
	echo "#              Mount success              #"
	echo "###########################################"
fi

open ~/Desktop/Disk/

# remove Finder attribute info
cd ~/Desktop/Disk/
find . -exec xattr -c {} \;
