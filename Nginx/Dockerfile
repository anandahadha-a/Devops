FROM ubuntu:latest

COPY . /src

# Install main rpms
RUN apt-get update && apt-get install -y \
        git \
        build-essential \
        wget \
        vim \
        usbutils \
        pciutils \
        kmod

# Install Nginx braries dependencies
RUN echo "Install Nginx braries dependencies"
RUN apt-get install -y \
        libpcre3-dev \
        zlib1g-dev

# Install Nginx from src
RUN chmod +x ./src/scripts/*.sh
RUN ./src/scripts/nginx.sh

RUN touch /lib/systemd/system/nginx.service
COPY files/nginx.service /lib/systemd/system/nginx.service


# Create openssl cerifcates and change nginx.config to support 433 protocol
RUN ./src/scripts/enable-https.sh
COPY files/nginx.conf /etc/nginx/nginx.conf

# Update default Nginx page
RUN ./src/scripts/data.sh
RUN cp data.txt /usr/local/nginx/html/
COPY files/index.html /usr/local/nginx/html/index.html

# Add headers values
RUN ./src/scripts/replace-headers.sh

EXPOSE 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
