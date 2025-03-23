FROM ubuntu:latest

# Update package lists and install required packages
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysql \
    mariadb-server \
    supervisor \
    wget \
    tar \
    && apt-get clean

# Mount volumes
VOLUME /var/lib/mysql
VOLUME /var/log

# Download and extract WordPress
ADD https://wordpress.org/latest.tar.gz /var/www/html/
RUN tar -xzf /var/www/html/latest.tar.gz -C /var/www/html/ --strip-components=1 && rm /var/www/html/latest.tar.gz

# Copy configuration files
COPY files/apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY files/apache2/apache2.conf /etc/apache2/apache2.conf
COPY files/php/php.ini /etc/php/8.2/apache2/php.ini
COPY files/mariadb/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY files/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# copy the configuration file for wordpress from files/ directory
COPY files/wp-config.php /var/www/html/wordpress/wp-config.php

# Create MySQL socket directory and set permissions
RUN mkdir /var/run/mysqld && chown mysql:mysql /var/run/mysqld

# Expose port 80
EXPOSE 80

# Start supervisor
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]





# FROM debian:latest

# # Instaleaza apache2, php, mod_php pentru apache2, php-mysql si mariadb
# RUN apt-get update && \
#     apt-get install -y apache2 php libapache2-mod-php php-mysql mariadb-server supervisor wget && \
#     apt-get clean

# # Mounteaza volume pentru datele MySQL
# VOLUME /var/lib/mysql
# VOLUME /var/log

# # Download and extract the latest version of WordPress
# # Copy configuration files to the appropriate locations
# RUN wget -q -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz && \
#     tar -xzf /tmp/latest.tar.gz -C /var/www/html/ && \
#     rm /tmp/latest.tar.gz

# # Copiez fisierele de configurare in locatiile corespunzatoare 
# COPY files/apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
# COPY files/apache2/apache2.conf /etc/apache2/apache2.conf
# COPY files/php/php.ini /etc/php/8.2/apache2/php.ini
# COPY files/mariadb/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY files/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# COPY files/wp-config.php /var/www/html/wordpress/wp-config.php

# # Setez variabilele de mediu pentru MySQL
# RUN mkdir /var/run/mysqld && chown mysql:mysql /var/run/mysqld

# # Export port 80 la exterior 
# EXPOSE 80

# # Stare supervisor sa ruleze 
# CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Acest Dockerfile:
#     Instalează Apache, PHP, MariaDB și Supervisor.
#     Montează volume pentru persistența bazei de date și a logurilor.
#     Descarcă și instalează WordPress.
#     Copiază fișierele de configurare.
#     Setează permisiunile necesare pentru MySQL.
#     Expune portul 80 pentru acces la server.
#     Rulează supervisord pentru a porni Apache și MariaDB.


# # create from debian image
# FROM debian:latest

# # mount volume for mysql data
# VOLUME /var/lib/mysql

# # mount volume for logs
# VOLUME /var/log

# # install apache2, php, mod_php for apache2, php-mysql and mariadb
# RUN apt-get update && \
#     apt-get install -y apache2 php libapache2-mod-php php-mysql mariadb-server supervisor && \
#     apt-get clean

# # RUN apt-get update && \
# #     apt-get install -y apache2 php libapache2-mod-php php-mysql mariadb-server && \
# #     apt-get clean

# # add wordpress files to /var/www/html
# ADD https://wordpress.org/latest.tar.gz /var/www/html/

# # copy the configuration file for apache2 from files/ directory
# COPY files/apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
# COPY files/apache2/apache2.conf /etc/apache2/apache2.conf

# # copy the configuration file for php from files/ directory
# COPY files/php/php.ini /etc/php/8.2/apache2/php.ini

# # copy the configuration file for mysql from files/ directory
# COPY files/mariadb/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# # copy the supervisor configuration file
# #COPY files/supervisor/supervisord.conf /etc/supervisor/supervisord.conf

# COPY files/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# # create mysql socket directory
# RUN mkdir /var/run/mysqld && chown mysql:mysql /var/run/mysqld

# EXPOSE 80

# # start supervisor
# CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# # copy the configuration file for wordpress from files/ directory
# COPY files/wp-config.php /var/www/html/wordpress/wp-config.php