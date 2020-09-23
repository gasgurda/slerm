#!/bin/sh

echo -en "\033[37;1;42m Check NGINX start page: \033[0m"

curl -H "Host: nginx" --silent --show-error --fail -I http://nginx/

echo -e "----------------\n"

sleep 1

echo -en "\033[37;1;42m Check Apache start page: \033[0m"

curl -H "Host: nginx" --silent --show-error --fail -I http://nginx/apache


