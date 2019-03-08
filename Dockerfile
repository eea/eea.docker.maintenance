FROM httpd

RUN apt-get -y update && \
    apt-get -y install curl

ADD EEA_agency_logo.svg  /usr/local/apache2/htdocs/

RUN curl -o /getRequiredHead.html  http://www.eea.europa.eu/templates/v2/getRequiredHead

RUN curl -o /getHeader.html http://www.eea.europa.eu/templates/v2/getHeader

RUN curl -o /getFooter.html http://www.eea.europa.eu/templates/v2/getFooter

RUN cat /getRequiredHead.html > /usr/local/apache2/htdocs/index.html

ADD index.html /

RUN cat /getHeader.html >> /usr/local/apache2/htdocs/index.html

RUN cat /index.html >> /usr/local/apache2/htdocs/index.html

RUN cat /getFooter.html >> /usr/local/apache2/htdocs/index.html

#ADD run.sh /
#RUN chmod a+x /run.sh
#ENTRYPOINT /run.sh

#CMD ["httpd-foreground"]
