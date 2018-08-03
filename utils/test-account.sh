#!/bin/sh

# Valid account -> no messages (unless --json).
# So this script can be used straight from cron.

if [ "$1" = "" ]; then
	echo "usage: $0 <cloud-account> [--json]"
	exit 1
fi

account=$1
result=`aws --profile $account iam get-user 2>/dev/null`

if [ "$result" = "" ]; then
	echo "error: cloud account \"$1\" has invalid credentials"
elif [ "$2" = "--json" ]; then
	echo "$result"
fi
