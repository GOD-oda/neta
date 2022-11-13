FROM php:8.1.12-apache-bullseye

ENV COMPOSER_ALLOW_SUPERUSER=1 \
	COMPOSER_HOME=/composer

COPY --from=composer:2.1 /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
    apt-get -y install git zip unzip libzip-dev libicu-dev libonig-dev && \
    docker-php-ext-install pdo_mysql intl zip bcmath

RUN mv /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled
RUN /bin/sh -c a2enmod rewrite

ADD 000-default.conf /etc/apache2/sites-available/
RUN a2ensite 000-default

