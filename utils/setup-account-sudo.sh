#!/bin/sh

if [ -x /opt/polynimbus/drivers/aws/setup-account.sh ]; then
	sudo -H /opt/polynimbus/drivers/aws/setup-account.sh $1
else
	echo "Polynimbus is not installed on this host"
	exit 1
fi


