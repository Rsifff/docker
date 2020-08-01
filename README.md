# docker
sudo apt install docker.io
wget https://raw.githubusercontent.com/Rsifff/docker/master/dockerfile
docker build -t dockerfile .
docker run -tid --name sarada dockerfile:latest
docker exec -ti sarada zsh     
