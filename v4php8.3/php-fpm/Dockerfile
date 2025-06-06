FROM php:8.3-fpm

RUN ls -l /

RUN chmod -R 777 /tmp

RUN ls -l /

RUN apt-get update \
    && apt-get install librdkafka-dev -y \
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
    && docker-php-ext-install exif \
    && apt-get update && apt-get install -y libmemcached11 libmemcachedutil2 libmemcached-dev libz-dev git \
    && apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev \
    && apt-get autoremove -y

RUN curl -sS https://getcomposer.org/installer | php \
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


RUN docker-php-ext-configure pcntl --enable-pcntl && \
    docker-php-ext-install pcntl 

RUN docker-php-ext-install mysqli

RUN pecl install rdkafka

RUN pecl install --onlyreqdeps --force redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis

# need vpn in iran, comment and do it after build, then commit
RUN apt-get install ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

RUN echo  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update
RUN apt install docker-ce docker-ce-cli containerd.io -y

# RUN wget http://ftp.us.debian.org/debian/pool/main/libm/libmcrypt/libmcrypt-dev_2.5.8-3.4+b1_amd64.deb \
#     && wget http://ftp.us.debian.org/debian/pool/main/libm/libmcrypt/libmcrypt4_2.5.8-3.4+b1_amd64.deb \
#     && dpkg -i libmcrypt4_2.5.8-3.4+b1_amd64.deb \
#     && dpkg -i libmcrypt-dev_2.5.8-3.4+b1_amd64.deb \
#     && docker-php-ext-install mcrypt

ENV http_proxy ''
ENV https_proxy ''

RUN groupadd -g 1000 nginxx

RUN useradd -d /opt -s /bin/bash -u 1000 -g 1000 nginxx

# User and group own home directory
RUN chown -R nginxx:nginxx /opt

WORKDIR /var/www/html

CMD ["/bin/bash", "-c" ,"php-fpm --nodaemonize ; php artisan horizon"]

