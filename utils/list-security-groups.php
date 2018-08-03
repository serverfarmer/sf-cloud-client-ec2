#!/usr/bin/php
<?php
require_once "/opt/farm/ext/cloud-client-ec2/internal/include.php";

if ($argc < 2)
	die("usage: $argv[0] <cloud-account>\n");

$data = aws_request($argv[1], "ec2 describe-security-groups");

foreach ($data["SecurityGroups"] as $group) {
	$name = $group["GroupName"];
	$vpcid = $group["VpcId"];
	$id = $group["GroupId"];
	echo "$vpcid $id $name\n";
}
