# Using the official PHP 8.2 image with Apache
FROM php:8.2-apache

ENV COMPOSER_ALLOW_SUPERUSER=1

# Apache configuration
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install application dependencies 
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev unzip \
  && rm -rf /var/lib/apt/lists/*

# Configuration of locales
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
  && echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen \
  && locale-gen

# Install Composer  
RUN curl -sS https://getcomposer.org/installer | php -- \
  && mv composer.phar /usr/local/bin/composer

# Install NodeJS  
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash \
  && apt-get install -y nodejs

# Install Symfony CLI  
RUN curl -sS https://get.symfony.com/cli/installer | bash \
  && echo 'export PATH="$HOME/.symfony/bin:$PATH"' >> /root/.bashrc

# Install PHP extensions  
RUN docker-php-ext-configure intl \
  && docker-php-ext-install pdo pdo_mysql opcache intl zip calendar dom mbstring gd xsl \
  && pecl install apcu && docker-php-ext-enable apcu

# Install additional dependencies needed for 'make entity'
RUN apt-get update \
  && apt-get install -y make \
  && rm -rf /var/lib/apt/lists/*

# Copy the Docker entrypoint script
COPY docker-php-entrypoint.sh /usr/local/bin/

# Set permissions on the entrypoint script
RUN chmod +x /usr/local/bin/docker-php-entrypoint.sh

# Set the working directory for the application
WORKDIR /var/www/adminGVT

# Copy the application code into the container
COPY . /var/www/adminGVT

# Expose port 80 to the host machine
EXPOSE 80

# Start Apache server using the custom entrypoint script
ENTRYPOINT ["docker-php-entrypoint.sh"]
CMD ["apache2-foreground"]

#test