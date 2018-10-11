#!/bin/sh

if grep -q /opt/farm/ext/cloud-client-ec2/cron /etc/crontab; then
	sed -i -e "/\/opt\/farm\/ext\/cloud-client-ec2\/cron/d" /etc/crontab
fi

echo "skipping setup (deprecated extension)"
