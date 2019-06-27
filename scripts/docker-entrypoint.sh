#!/bin/sh
# helpers functions
changeTemplateToConst() {
    $(command -v sed) -i -e "s/$1/$2/g" "$3"
}

if [ -z "$PHP_UPSTREAM" ]; then
    PHP_UPSTREAM="php:9000" 
fi


echo "Upstream ${PHP_UPSTREAM}"
echo "Root $NGINX_ROOT"

changeTemplateToConst "%NGINX_ROOT%" "$NGINX_ROOT" "/etc/nginx/vhosts/localhost.conf"
changeTemplateToConst "%PHP_UPSTREAM%" "$PHP_UPSTREAM" "/etc/nginx/vhosts/localhost.conf"

cat /etc/nginx/vhosts/localhost.conf

nginx
