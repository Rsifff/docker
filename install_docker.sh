#!/bin/bash
#filename            	: install_dotfiles.sh
#description    	: This script is used to install the dotfiles of my github: https://github.com/Rsifff/dotfiles/
#author             	: Roman Le Page (Rsifff)
#date                	: 2020/07/31
#version             	: 1.0
#usage               	: $ chmod +x install_dotfiles.sh && sudo ./install_dotfiles.sh
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
	colorecho "[+] Installing APT packages"
	apt install -y curl zsh python3-pip git tmux neofetch wget
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
			wget -O /root/.tmux.conf https://raw.githubusercontent.com/Rsifff/dotfiles/master/.tmux.conf
			wget -O /root/.zshrc https://raw.githubusercontent.com/Rsifff/dotfiles/master/.zshrc
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

if [[ $EUID -ne 0 ]]; then
	echo "You must be a root user" 2>&1
else
	echo "[!] Warning: This script is created to be executed in a docker"
    	echo "[*] Sleeping 5 seconds, just in case... You can still stop this"
      	sleep 5
        main "$@"
fi
colorecho "\e[5m                             End of installation 				   "
colorecho "================================================================================"
colorecho "   Replace your terminal's font with Hack Nerd Font Regular to get the icons" 
colorecho "================================================================================"
