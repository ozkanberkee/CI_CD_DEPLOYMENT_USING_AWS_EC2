# Resmi Node.js görüntüsünü kullan
FROM node:alpine

# Çalışma dizinini /uygulama olarak ayarla
WORKDIR /uygulama

# Paket.json dosyasını kopyala
COPY package.json .

# Bağımlılıkları yükle
RUN npm install

# Uygulama kaynak dosyalarını kopyala
COPY . .

# Uygulamayı çalıştır
CMD ["node", "index.js"]
