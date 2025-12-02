FROM php:8.2-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo pdo_mysql mysqli \
    && a2enmod rewrite \
    && apt-get clean

# Set working directory
WORKDIR /var/www/html

# Set environment variable
ENV DOCKER_ENV=true

# Copy application files
COPY ./dist /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80
