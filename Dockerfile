FROM nginx:latest

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/project.zip https://github.com/arp242/hello-css/archive/refs/heads/master.zip \
    && unzip /tmp/project.zip -d /usr/share/nginx/html \
    && rm /tmp/project.zip

EXPOSE 80
