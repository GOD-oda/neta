FROM php:apache

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
    apt-get -y install git libzip-dev unzip libicu-dev libonig-dev
