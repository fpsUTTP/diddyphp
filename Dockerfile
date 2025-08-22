# Use PHP 7.4 with Apache (compatible with Gallery 3)
FROM php:7.4-apache

# Install dependencies for GD (image processing)
RUN apt-get update && apt-get install -y \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && apt-get clean

# Enable Apache mod_rewrite for URL handling
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy all files from repo into container
COPY . .

# Create required 'var' folder and set permissions
RUN mkdir -p /var/www/html/var \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 777 /var/www/html/var

# Expose port 8080 for Render
EXPOSE 8080

# Start Apache
CMD ["apache2-foreground"]