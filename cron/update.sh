#!/bin/sh

/opt/farm/ext/cloud-client-ec2/internal/download-ami-table.sh \
	|/opt/farm/ext/versioning/save.sh daily /var/cache/cloud-config-history ubuntu-ec2-images.json
