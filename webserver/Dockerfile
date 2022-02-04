# DAS PROGRAMM MAG DICH <3

FROM php:7.4.27-apache-buster
# Benötigte Programme installieren
RUN apt-get update && apt-get install -y git libtidy-dev cron
# In /var/www
WORKDIR /var/www
# apiCall clonen
RUN git clone https://github.com/RundesBalli/pr0gramm-apiCall.git && mv pr0gramm-apiCall apiCall
# Spendenraid clonen
RUN git clone https://github.com/RundesBalli/pr0gramm-Spendenraid.git && mv pr0gramm-Spendenraid html

# Nicht mehr benötigte Programme entfernen
RUN apt-get remove -y git && apt-get autoremove -y

# apiCall config einbinden
ADD config/apiCall-config.php apiCall/config.php
# spendenraid config einbinden
ADD config/spendenraid-config.php /var/www/html/pr0gramm-Spendenraid/public/inc/config.php

# php.ini bereitstellen
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# mysqli installieren und einschalten
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli && docker-php-ext-install tidy && docker-php-ext-enable tidy

# Apache mods einschalten
RUN a2enmod headers
RUN a2enmod rewrite

# Website root ändern 
ENV APACHE_DOCUMENT_ROOT /var/www/html/pr0gramm-Spendenraid/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Crontab eintragen
RUN echo "*/15 * * * * root php /var/www/html/pr0gramm-Spendenraid/cli_scripts/crawler.php full >> /data/crawler.log" >> /etc/crontab
RUN echo "5,10,20,25,35,40,50,55 * * * * root php /var/www/html/pr0gramm-Spendenraid/cli_scripts/crawler.php >> /data/crawler.log" >> /etc/crontab
RUN echo "# leere zeile benoetigt" >> /etc/crontab

# Cron bei containerstart starten
CMD ["cron", "-f"]
