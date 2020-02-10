FROM php:7.4-apache
LABEL maintainer="Patrick Greene <pmg41494@protonmail.com>"

RUN a2enmod rewrite

RUN apt-get update
RUN apt-get install -y g++ git openssh-client gnupg
RUN apt-get install -y zlib1g-dev libicu-dev wget
RUN apt-get install -y libzip-dev unzip


RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev
RUN docker-php-ext-configure intl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install intl pdo_mysql zip bcmath gd

# install xdebug
RUN pecl install xdebug-2.9.2
RUN docker-php-ext-enable xdebug

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install yarn
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
  && apt-get install -y nodejs \
  && apt-get install -y yarn
