# Docker

This project to practice the bash language and discover the docker

## Installation

To install the docker, you have to use a user with admin rights.

```bash
sudo apt install docker.io 
wget https://raw.githubusercontent.com/Rsifff/docker/master/dockerfile 
sudo docker build -t dockerfile . docker run -tid --name mondocker dockerfile:latest 
sudo docker exec -ti mondocker zsh
```
```
