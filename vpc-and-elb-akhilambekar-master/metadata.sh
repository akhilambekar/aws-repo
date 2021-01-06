#!/bin/bash

# assign variables
ACTION=${1}

function create_file() {

nc -vz ecotech-db1.clbgbh3ebgur.us-east-1.rds.amazonaws.com 3306 > rds-message.txt

curl http://169.254.169.254/latest/dynamic/instance-identity/document/ > ecoweb1-identity.json

}

function show_version() {

echo "0.1.0"
}

function display_help() {

cat << EOF
Usage: ${0} {-c|--create|-help|--help|-v|--version}

OPTIONS: 
	-c| --create	Create a new file with rds details
	-h| --help	Display the command help
	-v| --version	Display the script version

	Examples:
		Create a new file:
			$ ${0} -c
		Display help:
			$ ${0} -h
		Show script version:
			$ ${0} -v

EOF
}

case "$ACTION" in
	-h|--help)
		display_help
		;;
	-c|--create)
		create_file
		;;
	-v|--version)
		show_version
		;;
	*)
	echo "Usage ${0} {-c|-h|-v}"
	exit 1
esac
