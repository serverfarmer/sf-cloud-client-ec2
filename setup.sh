#!/bin/sh
. /opt/farm/scripts/init

# http://docs.aws.amazon.com/cli/latest/userguide/installing.html

if grep -qFx $OSVER /opt/farm/ext/cloud-client-ec2/config/awscli-system-repo.conf; then
	/opt/farm/ext/packages/utils/install.sh awscli
else
	/opt/farm/ext/packages/utils/install.sh libyaml-dev libpython-dev python-yaml python-pip

	echo "checking for pip package awscli"
	if [ "`pip list |grep awscli`" = "" ]; then
		pip install awscli
	else
		pip install --upgrade awscli
	fi
fi

/opt/farm/scripts/setup/extension.sh sf-php
/opt/farm/scripts/setup/extension.sh sf-versioning

echo "setting up base directories"
mkdir -p /etc/local/.cloud/ec2 /var/cache/cloud-config-history

if ! grep -q /opt/farm/ext/cloud-client-ec2/cron /etc/crontab; then
	echo "setting up crontab entry"
	echo "45 8 * * * root /opt/farm/ext/cloud-client-ec2/cron/update.sh" >>/etc/crontab
fi
