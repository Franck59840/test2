#Using the official PHP 8.2 image with Apache
FROM php:8.2-apache

ENV COMPOSER_ALLOW_SUPERUSER=1


# Apache configuration
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
  \
# Install application dependencies 
  &&  apt-get update \
  &&  apt-get install -y --no-install-recommends \
  locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev unzip \
  \
# Configuration of locales
  &&  echo "en_US.UTF-8 UTF-8" > /etc/locale.gen  \
  &&  echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen \
  &&  locale-gen \
  \
# Install Composer  
  &&  curl -sS https://getcomposer.org/installer | php -- \
  &&  mv composer.phar /usr/local/bin/composer \
  \
#Install NodeJS  
  && curl -sL https://deb.nodesource.com/setup_18.x | bash \
  && apt-get install nodejs \
  \
# Install Symfony CLI  
  &&  curl -sS https://get.symfony.com/cli/installer | bash \
  &&  echo 'export PATH="$HOME/.symfony/bin:$PATH"' >> /root/.bashrc  \
  \
# Install PHP extensions  
  &&  docker-php-ext-configure \
  intl \
  &&  docker-php-ext-install \
  pdo pdo_mysql opcache intl zip calendar dom mbstring gd xsl \
  \
  &&  pecl install apcu && docker-php-ext-enable apcu 
# Installation of the application
WORKDIR /var/www/adminGVT
