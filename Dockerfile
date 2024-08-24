# Use an official PHP 8.2 runtime as a parent image
FROM php:8.2-cli

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    git \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy the application code
COPY . .

# Install PHP dependencies
RUN composer install

# Expose the port
EXPOSE 8000

# Command to run your PHP application
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000"]
