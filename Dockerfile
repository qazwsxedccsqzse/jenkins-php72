FROM phusion/baseimage:focal-1.0.0alpha1-amd64
RUN apt-get update && apt-get install -y wget tar make libpcre3 libpcre3-dev openssl libssl-dev openssl libssl-dev supervisor software-properties-common git
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
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
php composer-setup.php && \
php -r "unlink('composer-setup.php');" && \
mv composer.phar /usr/local/bin/composer
WORKDIR /var/lib/jenkins
