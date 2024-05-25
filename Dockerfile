# Resmi Node.js görüntüsünü kullan
FROM node:alpine

# Çalışma dizinini /uygulama olarak ayarla
WORKDIR /uygulama

# Uygulama kodunu kopyala
COPY index.js .

# Uygulamayı çalıştır
CMD ["node", "index.js"]
