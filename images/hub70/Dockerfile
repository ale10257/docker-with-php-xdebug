FROM php:7.0-fpm

RUN apt-get update && apt-get install -y \
        git \
        wkhtmltopdf xvfb \
        curl \
        wget \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev zlib1g-dev libicu-dev g++ libmagickwand-dev libxml2-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring zip xml gd mcrypt pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

ADD ./php.ini /usr/local/etc/php/php.ini

RUN wget https://getcomposer.org/installer -O - -q \
    | php -- --install-dir=/bin --filename=composer --quiet


#RUN addgroup --gid 1000 --system alex \
#  && adduser --uid 1000 --system --disabled-login --disabled-password --gid 1000 alex
  
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data  

WORKDIR /var/www

USER 1000:1000

CMD ["php-fpm"]
