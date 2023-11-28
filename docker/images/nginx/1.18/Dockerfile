FROM nginx:1.18-alpine

ARG APP_ID=1000

# Create www-data user and group
RUN groupadd -g 1000 app && useradd -u 1000 -g www-data -s /bin/bash app
# Allow www-data user to use sudo without a password
RUN mkdir -p /etc/sudoers.d/
RUN echo "app ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/app

RUN addgroup -g "$APP_ID" app \
 && adduser -G app -u "$APP_ID" -h /var/www -s /bin/bash -S app
RUN touch /var/run/nginx.pid
RUN mkdir /sock

RUN apk add --no-cache curl nss-tools openssl

COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/default.conf /etc/nginx/conf.d/

RUN mkdir -p /etc/nginx/html /var/www/html \
  && chown -R app:app /etc/nginx /var/www /var/cache/nginx /var/run/nginx.pid /sock

EXPOSE 8443

USER app:app

VOLUME /var/www

WORKDIR /var/www/html
