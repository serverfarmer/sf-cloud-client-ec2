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
