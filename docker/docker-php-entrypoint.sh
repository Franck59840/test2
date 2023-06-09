#!/bin/bash
set -e

# Create logs and cache directories
mkdir -p var/log
chmod -R 777 var/log
mkdir -p var/cache
chmod -R 777 var/cache


# Install dependencies with Composer
composer install --no-progress --no-interaction --no-suggest --prefer-dist

# Start Apache
apache2-foreground