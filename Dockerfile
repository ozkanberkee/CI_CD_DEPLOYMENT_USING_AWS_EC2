FROM centos
LABEL maintainer="berke.ozkan@ogr.sakarya.edu.tr"

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java httpd zip unzip

ADD https://bootstrapmade.com/content/templatefiles/Ninestars/Ninestars.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip -q "*.zip" && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
