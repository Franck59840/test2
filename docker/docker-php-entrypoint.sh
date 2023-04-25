#!/bin/bash
set -e

# Install dependencies with Composer
composer install --no-progress --no-interaction --no-suggest --no-scripts --prefer-dist

# Start Apache
apache2-foreground