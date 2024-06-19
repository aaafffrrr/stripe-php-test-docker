# Use the official PHP image as a base
FROM php:7.4-apache

# Set the working directory
WORKDIR /var/www/html

# Copy the contents of the public directory to the working directory
COPY public/ .

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy composer.json and composer.lock to the working directory
COPY composer.json composer.lock ./

# Install dependencies
RUN composer install

# Expose port 80
EXPOSE 80
