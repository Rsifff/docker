# Docker

This project was carried out to practice bash language and discover the docker environment.

## Installation

To install the docker, you have to use a user with admin rights.

```bash
sudo apt install docker.io 
wget https://raw.githubusercontent.com/Rsifff/docker/master/dockerfile 
sudo docker build -t dockerfile . 
sudo docker run -tid --name mondocker dockerfile:latest 
sudo docker exec -ti mondocker zsh
```
```
