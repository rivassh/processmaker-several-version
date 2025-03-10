#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

# # Check if database has been initialized
# NUM_TABLES=$(mysql -u pm -p'pass' -h mysql -N -B -e 'show tables;' processmaker | wc -l)

# if [ $NUM_TABLES -eq 0 ]; then
#     mysql -u pm -p'pass' -h mysql processmaker < mysqldump.sql
# fi

if [[ ! -z "${DB_HOSTNAME}" ]]; then
    while ! mysqladmin ping -u ${DB_USERNAME} -p${DB_PASSWORD} -h ${DB_HOSTNAME} --silent; do
        echo "Waiting for database"
        sleep 1
    done

    while ! nc -z docker 2375; do
        echo "Waiting for Docker"
        sleep 1
    done

    if [ "${PM_APP_PORT}" = "80" ]; then
        PORT_WITH_PREFIX=""
    else
        PORT_WITH_PREFIX=":${PM_APP_PORT}"
    fi

    # LARAVEL_ECHO_SERVER_AUTH_HOST=http://localhost
    SESSION_SECURE_COOKIE=false

    mkdir -p storage/framework/{sessions,views,cache}
    # chmod -R 777 storage

    composer install

    php artisan config:cache
    php artisan config:clear
    php artisan cache:clear
    php artisan migrate
    php artisan passport:install
    php artisan storage:link
    php artisan vendor:publish --tag=telescope-assets --force
    php artisan horizon:install
    echo '####################################################################################'
    sleep 10
    # php artisan docker-executor-php:install
    # php artisan docker-executor-lua:install
    # php artisan docker-executor-node:install

    php artisan migrate --seed
    # php artisan upgrade
    php artisan horizon
fi

service supervisor start
supervisorctl start horizon

php-fpm
