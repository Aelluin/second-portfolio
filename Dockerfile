FROM php:8.0-cli

# Install any dependencies you need
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Set the working directory
WORKDIR /app

# Copy the application code
COPY . .

# Install Composer (if needed)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP dependencies
RUN composer install

# Expose the port
EXPOSE 8000

# Start the application
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "8000"]
