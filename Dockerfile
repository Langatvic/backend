FROM php:8.3-cli

# Install system packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install zip gd

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

# Copy project
COPY . .

# Install Laravel packages
RUN composer install --no-dev --optimize-autoloader

# Create .env
RUN cp .env.example .env || true

# Generate key
RUN php artisan key:generate --force || true

EXPOSE 10000

CMD php artisan serve --host=0.0.0.0 --port=$PORT