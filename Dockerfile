# Author : Roman Le Page (Rsifff)
FROM kalilinux/kali-rolling

ADD https://github.com/Rsifff/dotfiles/blob/master/install_dotfiles.sh /root/install.sh
RUN chmod +x /root/install.sh && /root/install.sh && rm /root/install.sh
WORKDIR /share
