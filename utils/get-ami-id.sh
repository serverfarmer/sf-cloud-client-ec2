#!/bin/sh

if [ "$2" = "" ]; then
	echo "usage:   $0 <region> <ubuntu-version>"
	echo "example: $0 eu-west-1 18.04"
	exit 1
fi

region=$1
distro=$2

images=/var/cache/cloud-config-history/ubuntu-ec2-images.json

cat $images |grep hvm:ebs-ssd |grep amd64 |grep $region |grep "$distro" |egrep -o 'ami-[0-9a-f]{8,17}' |head -n1
