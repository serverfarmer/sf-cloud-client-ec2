#!/bin/sh

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account>"
	exit 1
elif [ ! -f /etc/local/.cloud/ec2/$1.sh ]; then
	echo "error: cloud account \"$1\" not configured"
	exit 1
fi

account=$1
version="18.04"

region=`/opt/farm/ext/cloud-client-ec2/utils/get-configured-region.sh $account`

/opt/farm/ext/cloud-client-ec2/utils/get-ami-id.sh $region $version
