#!/bin/sh

/opt/farm/ext/cloud-client-ec2/internal/download-ami-table.sh \
	|/opt/farm/ext/versioning/save.sh daily /var/cache/cloud-config-history ubuntu-ec2-images.json

/opt/farm/ext/cloud-client-ec2/internal/download-instance-types.sh \
	|/opt/farm/ext/versioning/save.sh daily /var/cache/cloud-config-history instance-types.html
