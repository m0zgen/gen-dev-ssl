#!/bin/bash
# Created by Yevgeniy Goncharov
# Generate self-signet certificate for web development

# Envs
# ---------------------------------------------------\
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

# Cert subj params
# ---------------------------------------------------\
country="US"
state="CA State"
locality="CA Country"
organization="CA Org"
organizationalunit="CA Org Unit"
email="info@ca.org"
CN="Local Certificate Authority"

# Cert subj params
# ---------------------------------------------------\
function gen-ssl() {

	# Generate SSL and config
	mkdir -p /etc/nginx/ssl

	openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	-keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt \
	-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$CN/emailAddress=$email"
}

gen-ssl