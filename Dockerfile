# Use official PHP with Apache
FROM php:8.3-apache

# Copy the site files to the web root
COPY . /var/www/html/

# Expose port 8080
EXPOSE 8080

# Start Apache
CMD ["apache2-foreground"]
