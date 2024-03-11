FROM ubuntu 
RUN apt update 
RUN apt install apache2 -y
RUN apt install -y apache2-utils
COPY index.html /var/www/html
COPY server.css /var/www/html
RUN sed -i '/Listen 80/a\Listen 8088/a\ Listen 8000'  /etc/apache2/ports.conf
EXPOSE 8088
CMD ["apache2ctl", "-D", "FOREGROUND"]
