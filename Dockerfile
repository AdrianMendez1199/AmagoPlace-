FROM centos:7
MAINTAINER Adrian Mendez <mendezadrian149@gmail.com>
 

WORKDIR /www

# install Apache
RUN \
 yum install httpd -y && \
 yum install epel-release yum-utils -y && \
 yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y && \
 yum-config-manager --enable remi-php73 -y && \
 yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd -y

#install Composer 
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# EXPOSE 8000

CMD ["apachectl", "-DFOREGROUND"]

