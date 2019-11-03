FROM composer:latest AS composer
FROM ale10257/php7.1-fpm

COPY --from=composer /usr/bin/composer /usr/bin/composer

ARG USER_ID
ARG GROUP_ID

ADD ./php.ini /usr/local/etc/php/php.ini

#RUN wget https://getcomposer.org/installer -O - -q   | php -- --install-dir=/bin --filename=composer --quiet

RUN usermod -u ${USER_ID} www-data && groupmod -g ${GROUP_ID} www-data

WORKDIR /var/www

USER "${USER_ID}:${GROUP_ID}"

CMD ["php-fpm"]
