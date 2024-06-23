FROM php:7.4-cli

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /app

# Copy all files to the container
COPY . /app

# Install dependencies
RUN composer install --prefer-dist --no-interaction --no-plugins --no-scripts --no-progress || cat /root/.composer/cache/repo/https---repo.packagist.org/provider-symfony$event-dispatcher.json

# Expose port 80
EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "public"]
