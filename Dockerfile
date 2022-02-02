FROM debian
RUN apt update && apt install -y apache2 libapache2-mod-php7.4 php7.4 php7.4-mysql mariadb-client && apt clean && rm -rf /var/lib/apt/lists/*
RUN rm /var/www/html/index.html
EXPOSE 80
ADD ./bookmedik /var/www/html
ADD variables.sh /usr/local/bin/variables.sh
RUN chmod +x /usr/local/bin/variables.sh
CMD ["/usr/local/bin/variables.sh"]
