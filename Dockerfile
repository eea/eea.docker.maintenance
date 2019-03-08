FROM httpd

RUN apt-get -y update && \
    apt-get -y install curl

ADD EEA_agency_logo.svg  /usr/local/apache2/htdocs/

ADD index.html /

ADD httpd-foreground /usr/local/bin/

RUN chmod a+x /usr/local/bin/httpd-foreground

#CMD ["httpd-foreground"]
