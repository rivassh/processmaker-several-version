FROM php:7.4-fpm-alpine

RUN apk add libxml2-dev
# RUN apk add libcurl4-openssl-dev
# RUN apk add unzip
# RUN apk add wget
# RUN  apt-get install -y libfreetype6-dev libjpeg62-turbo-dev 

# RUN  apt-get install -y zlib1g-dev
# RUN  apt-get install -y libzip-dev zip
# RUN  apt-get install -y libmemcached11
# RUN  apt-get install -y libmemcachedutil2 
# RUN  apt-get install -y libmemcached-dev
# RUN  apt-get install -y libz-dev


RUN  apk add git
# RUN  apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev



# RUN  curl -sS https://getcomposer.org/installer | php 
# RUN  mv composer.phar /usr/local/bin/composer

# RUN   rm -rf /tmp/pear
# RUN  rm -rf /var/lib/apt/lists/*


# RUN set -x \
#     && apt-get install -y libldap2-dev \
#     && rm -rf /var/lib/apt/lists/* \
#     && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
#     && docker-php-ext-install ldap \
#     && apt-get purge -y --auto-remove libldap2-dev

# RUN docker-php-ext-install bcmath \
#     && docker-php-ext-install sockets

# RUN apt-get update && \
#     apt-get -y install libgmp-dev && \ 
#     docker-php-ext-install gmp


# RUN apt-get install -y libc-client-dev libkrb5-dev && \
#     docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap

# RUN docker-php-ext-configure pcntl --enable-pcntl && \ 
#     docker-php-ext-install pcntl 

#RUN apt-get update \
#    && apt install libmcrypt4 
#RUN wget http://ftp.us.debian.org/debian/pool/main/libm/libmcrypt/libmcrypt-dev_2.5.8-3.3_amd64.deb \
#    && dpkg -i -f libmcrypt-dev_2.5.8-3.3_amd64.deb
# RUN cat /etc/debian_version
# RUN apt-get install libmcrypt-dev -y 
# RUN docker-php-ext-install mcrypt

ENV http_proxy ''
ENV https_proxy ''

RUN docker-php-ext-install soap
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN apk add libzip-dev zip
RUN docker-php-ext-install zip
     # && docker-php-ext-configure gd \
     # --with-freetype=/usr/include/ --with-jpeg=/usr/include/   \
RUN  apk add libpng
RUN apk add --no-cache libjpeg-turbo-dev 
RUN apk add --no-cache libwebp-dev 
RUN apk add --no-cache zlib-dev 
#RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
#RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r1/glibc-2.35-r1.apk
#RUN apk add glibc-2.35-r1.apk
# RUN apk add --no-cache libxpm-dev 
RUN apk add --no-cache libpng 
RUN apk add --no-cache libpng-dev 
RUN docker-php-ext-install gd 
RUN apk del libjpeg-turbo-dev libwebp-dev zlib-dev libxpm-dev libpng-dev
# RUN  docker-php-ext-configure gd --with-jpeg-dir=/usr/include/  

ENV http_proxy ''
ENV https_proxy ''

RUN adduser nginxx -D -h /opt -s /bin/bash -u 1000  

#RUN addgroup -g 1000 nginxx


# User and group own home directory
RUN chown -R nginxx:nginxx /opt

WORKDIR /opt
 
CMD ["php-fpm", "--nodaemonize"]
