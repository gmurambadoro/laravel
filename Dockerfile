FROM php:8.2-apache

WORKDIR /var/www/laravel/

# install dependencies
RUN apt-get update \
    && apt-get install -y curl apt-transport-https ca-certificates gnupg \
    && apt-get install -y git zip unzip libicu-dev zlib1g-dev g++

# install php extensions
RUN docker-php-ext-install pdo pdo_mysql bcmath \
    && docker-php-ext-configure intl && docker-php-ext-install intl

# install composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

EXPOSE 80
