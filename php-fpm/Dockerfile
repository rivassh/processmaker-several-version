FROM php:7.1-fpm

RUN apt-get update \
    && apt-get install -y libxml2-dev libcurl4-openssl-dev unzip wget \
    && docker-php-ext-install soap \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev  \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/    \
    && docker-php-ext-install gd \
    && apt-get install -y zlib1g-dev \
    && apt-get install -y libzip-dev zip \
    && docker-php-ext-install zip \
    && apt-get update && apt-get install -y libmemcached11 libmemcachedutil2 libmemcached-dev libz-dev git \
    && apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev \
    && apt-get autoremove -y \
    && curl -sS https://getcomposer.org/installer | php \ 
    && mv composer.phar /usr/local/bin/composer \
    &&  rm -rf /tmp/pear \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean


RUN set -x \
    && apt-get update \
    && apt-get install -y libldap2-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && apt-get purge -y --auto-remove libldap2-dev

RUN docker-php-ext-install bcmath \
    && docker-php-ext-install sockets

RUN apt-get update && \
    apt-get -y install libgmp-dev && \ 
    docker-php-ext-install gmp


RUN apt-get install -y libc-client-dev libkrb5-dev && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap

RUN docker-php-ext-configure pcntl --enable-pcntl && \ 
    docker-php-ext-install pcntl 

#RUN apt-get update \
#    && apt install libmcrypt4 
#RUN wget http://ftp.us.debian.org/debian/pool/main/libm/libmcrypt/libmcrypt-dev_2.5.8-3.3_amd64.deb \
#    && dpkg -i -f libmcrypt-dev_2.5.8-3.3_amd64.deb
RUN cat /etc/debian_version
RUN apt-get install libmcrypt-dev -y 
RUN docker-php-ext-install mcrypt

ENV http_proxy ''
ENV https_proxy ''

RUN groupadd -g 1000 nginxx
RUN useradd -d /opt -s /bin/bash -u 1000 -g 1000 nginxx
# User and group own home directory
RUN chown -R nginxx:nginxx /opt


WORKDIR /opt
 
CMD ["php-fpm", "--nodaemonize"]
