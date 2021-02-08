FROM phusion/baseimage:focal-1.0.0alpha1-amd64
RUN apt-get update && apt-get install -y wget tar make libpcre3 libpcre3-dev openssl libssl-dev openssl libssl-dev supervisor software-properties-common
RUN apt-get install -y default-jdk
RUN apt-get install -y openjdk-11-jdk-headless
RUN update-alternatives --config java
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update && apt-get install -y jenkins
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
apt-get update && \
apt-get install -y php7.2-cli \
php7.2-common \
php7.2 \
php7.2-mysql \
php7.2-fpm \
php7.2-curl \
php7.2-bz2 \
php7.2-json \
php7.2-cgi \
php7.2-mbstring \
php7.2-gd \
php-imagick \
php-memcache \
php-pear \
php7.2-xml \
php7.2-dev \
php7.2-bcmath \
php7.2-zip \
php7.2-dom && \
apt-get install -y php-xdebug