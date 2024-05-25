FROM centos

# Gerekli paketleri yükleyin
RUN yum install -y curl unzip httpd

# Dosyayı indirin ve dizine kopyalayın
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/spering.zip /var/www/html/

# Çalışma dizinini ayarlayın ve dosyayı açın
WORKDIR /var/www/html/
RUN unzip -q spering.zip && \
    mv spering/* . && \
    rm -rf spering spering.zip

# Apache HTTP sunucusunu başlatın
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Port 80'i dışa açın
EXPOSE 80
