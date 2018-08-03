#!/bin/sh
# https://cloud-images.ubuntu.com/locator/ec2/

curl -sS -H "User-Agent: Internet Explorer" https://cloud-images.ubuntu.com/locator/ec2/releasesTable \
	|/opt/farm/ext/versioning/save.sh daily /var/cache/cloud-config-history ubuntu-ec2-images.json
