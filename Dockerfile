FROM centos

RUN yum install -y curl unzip httpd && \
    curl -L -o /var/www/html/photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    cd /var/www/html/ && \
    unzip -q photogenic.zip && \
    mv photogenic/* . && \
    rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
