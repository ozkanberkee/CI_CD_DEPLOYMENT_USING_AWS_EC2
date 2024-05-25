FROM centos

# Update repositories
RUN yum install -y java httpd zip unzip

# Enable access to vault.centos.org
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Download and extract the ZIP file
ADD https://github.com/arp242/hello-css/archive/refs/heads/master.zip /tmp/
WORKDIR /tmp
RUN unzip -q master.zip -d /var/www/html/

# Clean up
RUN rm -f master.zip

# Start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
