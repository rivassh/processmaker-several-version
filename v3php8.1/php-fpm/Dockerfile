FROM php:8.1-fpm-alpine

RUN apk add libxml2-dev

RUN  apk add git

ENV http_proxy ''
ENV https_proxy ''

RUN docker-php-ext-install soap
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql

RUN apk add libzip-dev

RUN docker-php-ext-install zip

RUN  apk add libpng
RUN apk add --no-cache libjpeg-turbo-dev 
RUN apk add --no-cache libwebp-dev 
RUN apk add --no-cache zlib-dev 

RUN apk add --no-cache libpng 
RUN apk add --no-cache libpng-dev 
RUN docker-php-ext-install gd 
RUN apk del libjpeg-turbo-dev libwebp-dev zlib-dev libxpm-dev libpng-dev

ENV http_proxy ''
ENV https_proxy ''

RUN adduser nginxx -D -h /opt -s /bin/bash -u 1000  

RUN chown -R nginxx:nginxx /opt

WORKDIR /opt
 
CMD ["php-fpm", "--nodaemonize"]
