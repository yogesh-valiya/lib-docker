FROM php:8.1-fpm-bullseye

ARG APP_ID=1000
RUN groupadd -g "$APP_ID" app \
  && useradd -g "$APP_ID" -u "$APP_ID" -d /var/www -s /bin/bash app

RUN mkdir -p /etc/nginx/html /var/www/html /sock \
  && chown -R app:app /etc/nginx /var/www /usr/local/etc/php/conf.d /sock

RUN apt-get update
RUN apt-get install -y cron
RUN apt-get install -y default-mysql-client
RUN apt-get install -y git
RUN apt-get install -y gnupg
RUN apt-get install -y gzip
RUN apt-get install -y libbz2-dev
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libmagickwand-dev
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y libonig-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libsodium-dev
RUN apt-get install -y libssh2-1-dev
RUN apt-get install -y libwebp-dev
RUN apt-get install -y libxslt1-dev
RUN apt-get install -y libzip-dev
RUN apt-get install -y lsof
RUN apt-get install -y mailutils
RUN apt-get install -y msmtp
RUN apt-get install -y nodejs
RUN apt-get install -y procps
RUN apt-get install -y vim
RUN apt-get install -y zip

RUN rm -rf /var/lib/apt/lists/*

RUN pecl channel-update pecl.php.net
RUN pecl install imagick xdebug
RUN pecl clear-cache
RUN rm -rf /tmp/pear

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp

RUN docker-php-ext-install bcmath
RUN docker-php-ext-install  bz2
RUN docker-php-ext-install  calendar
RUN docker-php-ext-install  exif
RUN docker-php-ext-install  gd
RUN docker-php-ext-install  gettext
RUN docker-php-ext-install  intl
RUN docker-php-ext-install  mbstring
RUN docker-php-ext-install  mysqli
RUN docker-php-ext-install  opcache
RUN docker-php-ext-install  pcntl
RUN docker-php-ext-install  pdo_mysql
RUN docker-php-ext-install  soap
RUN docker-php-ext-install  sockets
RUN docker-php-ext-install  sodium
RUN docker-php-ext-install  sysvmsg
RUN docker-php-ext-install  sysvsem
RUN docker-php-ext-install  sysvshm
RUN docker-php-ext-install  xsl
RUN docker-php-ext-install  zip
#RUN docker-php-ext-install  xdebug

#RUN docker-php-ext-enable xdebug
#RUN docker-php-ext-enable redis
#RUN docker-php-ext-enable ssh2
RUN docker-php-ext-enable imagick

RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/local/bin --filename=composer

COPY ./conf/php.ini $PHP_INI_DIR
COPY ./conf/php-fpm.conf /usr/local/etc/
COPY ./conf/www.conf /usr/local/etc/php-fpm.d/

USER app:app
VOLUME /var/www
WORKDIR /var/www/html

EXPOSE 9000