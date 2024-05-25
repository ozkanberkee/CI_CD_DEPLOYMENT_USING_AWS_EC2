FROM node:latest

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/project.zip https://github.com/berkaltiok/food-delivery/archive/refs/heads/master.zip \
    && unzip /tmp/project.zip -d /usr/src/app \
    && rm /tmp/project.zip

WORKDIR /usr/src/app/food-delivery-master

RUN npm install

CMD ["npm", "run", "start"]
