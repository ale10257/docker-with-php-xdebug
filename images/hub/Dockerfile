FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
        git \
        curl \
        wget \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev zlib1g-dev libicu-dev g++ libmagickwand-dev --no-install-recommends libxml2-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring zip xml gd mcrypt pdo_mysql \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable xdebug

