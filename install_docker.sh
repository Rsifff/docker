#!/bin/bash
#filename            	: install_dotfiles.sh
#author             	: Roman Le Page (Rsifff)
#date                	: 2020/07/31
#version             	: 1.0
#======================================================================================

function colorecho() {
 	BG='\033[1;32m'
	NC='\033[0m'
	echo -e "${BG}$@${NC}"
	sleep 2
}

function update() {
	colorecho "[+] Updating, upgrading, cleaning"
	apt -y update && apt -y install apt-utils && apt -y upgrade && apt -y autoremove && apt clean
}

function apt_packages() {
	apt install -y curl zsh python3-pip git tmux wget 
}

function filesystem() {
	colorecho "[+] Preparing filesystem"
	mkdir -p /opt/tools/bin/ /share/
}

function ohmyzsh() {
	colorecho "[+] Installing Oh-My-Zsh, config, aliases"
	colorecho "[+] Installing Oh-My-Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	colorecho "[+] Installation of configuration files"
	wget -O /root/.tmux.conf https://raw.githubusercontent.com/Rsifff/docker/master/.tmux.conf
	wget -O /root/.zshrc https://raw.githubusercontent.com/Rsifff/docker/master/.zshrc
	
	#Install the theme and plugins
	git clone https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions.git /root/.oh-my-zsh/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-completions.git /root/.oh-my-zsh/plugins/zsh-completions
	source /root/.zshrc
}

function tools() {
	colorecho "[+] Installing tools "
	pip3 install lolcat
	pip3 install updog
	wget https://github.com/Peltoche/lsd/releases/download/0.17.0/lsd_0.17.0_amd64.deb
	dpkg -i lsd_0.17.0_amd64.deb
	rm -f lsd_0.17.0_amd64.deb
}

function pluginszsh() {
	colorecho "[+] Installing Plugins"
	
	#Autojump	
	git clone https://github.com/wting/autojump.git
	apt install autojump
	python3 autojump/install.py
	rm -rf autojump
	
	#TheFuck
	pip3 install thefuck
}

function main() {
	update
	apt_packages
	filesystem
	ohmyzsh
	tools
	pluginszsh
}

main "$@"

echo -e " \n"
colorecho "\e[5m                             End of installation 				   "
colorecho "================================================================================"
colorecho "   Replace your terminal's font with Hack Nerd Font Regular to get the icons" 
colorecho "================================================================================"
