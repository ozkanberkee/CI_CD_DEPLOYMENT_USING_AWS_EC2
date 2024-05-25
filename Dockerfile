FROM centos

# Yum repositorilerini güncelleyin
RUN cd /etc/yum.repos.d/ && \
    sed -i 's/mirrorlist/#mirrorlist/g' CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' CentOS-*

# Gerekli paketleri yükleyin
RUN yum -y install java httpd zip unzip

# Web sayfasını kopyalayın
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Çalışma dizinini ayarlayın
WORKDIR /var/www/html/

# Zip dosyasını açın, içeriğini kopyalayın ve ardından zip dosyasını silin
RUN unzip -q "*.zip" && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Apache HTTP sunucusunu başlatın
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Port 80'i dışa açın
EXPOSE 80
