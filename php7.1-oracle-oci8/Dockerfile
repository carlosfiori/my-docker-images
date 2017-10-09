####
# Ambientum 1.0
# Debian Jessie as Base Image (Dotdeb PHP builds)
######
FROM jub4/php7.0-with-mssql-apache

# Reset user to root to allow software install
USER root

# Repository/Image Maintainer
# MAINTAINER Juliano Bailao <julianobailao@gmail.com>
RUN apt-get update
RUN apt-get install -y \
        unzip \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libaio1 \
        nano 
    
    #&& docker-php-ext-install -j$(nproc) iconv mcrypt gettext \
    #&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    #&& docker-php-ext-install -j$(nproc) gd

RUN printf "log_errors = On \nerror_log = /dev/stderr\n" > /etc/php/7.0/fpm/php.ini

# Oracle instantclient
ADD instantclient-basiclite-linux.x64-12.2.0.1.0.zip /tmp/
ADD instantclient-sdk-linux.x64-12.2.0.1.0.zip /tmp/
ADD instantclient-sqlplus-linux.x64-12.2.0.1.0.zip /tmp/

RUN unzip /tmp/instantclient-basiclite-linux.x64-12.2.0.1.0.zip -d /usr/local/
RUN unzip /tmp/instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /usr/local/
RUN unzip /tmp/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip -d /usr/local/

RUN ln -s /usr/local/instantclient_12_2 /usr/local/instantclient
RUN ln -s /usr/local/instantclient/libclntsh.so.12.1 /usr/local/instantclient/libclntsh.so
RUN ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus

RUN echo 'export LD_LIBRARY_PATH="/usr/local/instantclient"' >> /root/.bashrc
RUN echo 'umask 002' >> /root/.bashrc

RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8
RUN echo "extension=oci8.so" > /etc/php/7.0/fpm/conf.d/php-oci8.ini

# Define the running user
USER php-user