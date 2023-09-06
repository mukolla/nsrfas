FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing application directory contents
COPY --chown=www:www . /var/www

# Copy docker-php-entrypoint script
COPY ./docker-php-entrypoint /usr/local/bin/

# Set execute permission on docker-php-entrypoint
RUN chmod +x /usr/local/bin/docker-php-entrypoint
RUN chown www:www /usr/local/bin/docker-php-entrypoint

# Copy existing application directory permissions
RUN chown www:www /var/www

USER www

RUN chmod +x /usr/local/bin/docker-php-entrypoint

ENTRYPOINT ["docker-php-entrypoint"]

EXPOSE 9000
CMD ["php-fpm"]

#RUN php bin/console doctrine:migrations:migrate
