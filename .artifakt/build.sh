#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "

RUNTIME_NAME="Ruby"
RUNTIME_LOGO="ruby.png"
REPO_NAME=base-html
REPO_BRANCH=main
ARCHIVE_FILE=$REPO_NAME-$REPO_BRANCH

curl -sSLO https://github.com/artifakt-io/${REPO_NAME}/archive/refs/heads/${REPO_BRANCH}.tar.gz && \
	tar -xzf ${REPO_BRANCH}.tar.gz -C /tmp && \
	mv /tmp/${ARCHIVE_FILE}/* /var/www/html && \
	chown -R www-data:www-data /var/www/html && \
	rm ${REPO_BRANCH}.tar.gz

sed -i "s/__RUNTIME_NAME__/${RUNTIME_NAME}/" /var/www/html/index.html
sed -i "s/__RUNTIME_LOGO__/${RUNTIME_LOGO}/" /var/www/html/index.html


echo ">>>>>>>>>>>>>> END CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
