FROM centos

# Gerekli paketleri yükleyin
RUN yum install -y unzip httpd

# Dosyayı kopyalayın
COPY spering.zip /var/www/html/

# Çalışma dizinini ayarlayın ve dosyayı açın
WORKDIR /var/www/html/
RUN unzip -q spering.zip && \
    rm -f spering.zip

# Apache HTTP sunucusunu başlatın
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Port 80'i dışa açın
EXPOSE 80
