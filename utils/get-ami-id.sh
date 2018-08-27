#!/bin/sh

if [ "$2" = "" ]; then
	echo "usage:   $0 <region> <ubuntu-version>"
	echo "example: $0 eu-west-1 18.04"
	exit 1
fi

region=$1
distro=$2

path=/var/cache/cloud-config-history
table=ubuntu-ec2-images.json

if [ ! -s $path/$table ] || [ `stat -c %Y $path/$table` -le `date -d yesterday +%s` ]; then
	/opt/farm/ext/cloud-client-ec2/internal/download-ami-table.sh |/opt/farm/ext/versioning/save.sh daily $path $table
fi

cat $path/$table |grep hvm:ebs-ssd |grep amd64 |grep $region |grep "$distro" |egrep -o 'ami-[0-9a-f]{8,17}' |head -n1
