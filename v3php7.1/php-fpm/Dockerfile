FROM php:7.1-fpm-alpine

RUN apk add libxml2-dev

RUN  apk add git

ENV http_proxy ''
ENV https_proxy ''

RUN docker-php-ext-install soap
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip

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
