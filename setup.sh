#!/bin/bash

echo "skipping setup (deprecated extension)"
exit 0

/opt/farm/ext/cloud-client-ec2/setup-awscli.sh

/opt/farm/scripts/setup/extension.sh sf-php
/opt/farm/scripts/setup/extension.sh sf-versioning

echo "setting up base directories"
mkdir -p /etc/local/.cloud/ec2 /var/cache/cloud-config-history

if ! grep -q /opt/farm/ext/cloud-client-ec2/cron /etc/crontab && [ -d /opt/farm/ext/farm-inspector ]; then
	echo "setting up crontab entry"
	echo "$((RANDOM%60)) 8 * * * root /opt/farm/ext/cloud-client-ec2/cron/update.sh" >>/etc/crontab
fi
