FROM ubuntu:latest
LABEL maintainer="Abhishek AN <darkabhi1520@gmail.com>"

RUN apt-get update && apt-get install -y \
  nginx php7.2-fpm supervisor \
  wget unzip patch

RUN service php7.2-fpm start

# install h5ai and patch configuration
RUN wget http://release.larsjung.de/h5ai/h5ai-0.29.2.zip
RUN unzip h5ai-0.29.2.zip -d /usr/share/h5ai

# add h5ai as the only nginx site
ADD h5ai.nginx.conf /etc/nginx/sites-available/default

# patch h5ai because we want to deploy it ouside of the document root and use /var/www as root for browsing
ADD h5ai-path.patch patch
RUN patch -p1 -u -d /usr/share/h5ai/_h5ai/private/php/core/ -i /patch && rm patch

# use supervisor to monitor all services
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD supervisord -c /etc/supervisor/conf.d/supervisord.conf

# expose only nginx HTTP port
EXPOSE 80

# expose path
VOLUME /var/www

