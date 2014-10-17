#!/bin/bash
if [ $# -eq 1 ]; then
	USER=$1
else
	USER=popi
fi
echo "Mysql user: $USER"
mysql -u $USER -p popidb < select.sql
mysql -u $USER -p popidb -e "SELECT * FROM auction_user"
