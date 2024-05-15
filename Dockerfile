FROM centos

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum -y install java httpd zip unzip && \
    yum clean all

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip -q photogenic.zip && \
    mv photogenic/* . && \
    rm -rf photogenic.zip photogenic

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
