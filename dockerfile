# Author : Roman Le Page (Rsifff)
FROM kalilinux/kali-rolling

ADD https://raw.githubusercontent.com/Rsifff/docker/master/install_docker.sh /root/install.sh
RUN chmod +x /root/install.sh && /root/install.sh && rm /root/install.sh
WORKDIR /share
