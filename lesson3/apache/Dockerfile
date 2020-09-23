FROM httpd:2.4

RUN apt update && apt install -y curl && rm -rf /var/lib/apt/lists/*

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY static/* /usr/local/apache2/htdocs/

CMD ["httpd", "-D", "FOREGROUND"]
