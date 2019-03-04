# Installing Ubuntu Gnome 16.04.4 and Ros Kinetic 

	# Boot from flash drive
	[check] Download update while installing gnome
	[check] install third party software
	[check] erase disk and install ubuntu gnome 1604

	# Reboot and remote flash drive
	# Run any updates that are required, reboot as necessary
	# Tweak tool: global dark theme


	# Install sublime
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && sudo apt-get install apt-transport-https
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo -- sh -c "echo '104.236.0.104    download.sublimetext.com' >> /etc/hosts"
	sudo apt-get update && sudo apt-get install -y sublime-text terminator ppa-purge xclip openssh-server git meld zip gzip tar network-manager-vpnc network-manager-vpnc-gnome python-pip

	# First, make a backup of your sshd_config file by copying it to your home directory, or by making a read-only copy in /etc/ssh by doing:
	sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults && sudo chmod a-w /etc/ssh/sshd_config.factory-defaults

	# create ssh identity
	ssh-keygen # hit enter until it stops asking questions
	ssh-agent /bin/bash &&	ssh-add ~/.ssh/id_rsa

	scp benjamin@saturn.local:~/.ssh/id_rsa.pub ~/.ssh/authorized_keys && scp ~/.ssh/id_rsa.pub benjamin@saturn.local:~/.ssh/juno.pub
	
	echo "Now go add your ssh key to github and bitbucket"
	## Set up Firefox:
	### Turn off password saver
	### Set bitbucket to home page
	### Add ssh key to bitbucket
	### Add ssh key to github

	### git init
	echo 'export HOST=$HOSTNAME' >> ~/.bashrc
	git config --global user.email "abruzzo2@gmail.com" && git config --global user.name "benjamin@saturn"
	mkdir -p ~/pipeline16044 && cd ~/pipeline16044 && git init
	git remote add bb git@bitbucket.org:benjaminabruzzo/pipeline16044.git && git pull bb master
	# https://bitbucket.di2e.net/projects/AGSREPO
	git remote add ags ssh://git@bitbucket.di2e.net:7999/agsrepo/abruzzo-pipeline16044.git




	
