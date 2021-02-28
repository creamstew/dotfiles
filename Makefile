bootstrap.sh:
	chmod +x bootstrap.sh
	./bootstrap.sh

set_ssh_config:
	mkdir ~/.ssh
	touch ~/.ssh/config
	sudo chown -R $(whoami):staff ~/.ssh
	sudo chmod 700 ~/.ssh
	sudo chmod -R 600 ~/.ssh/*
	xattr -cr ~/.ssh
	cat .ssh/config >> ~/.ssh/config
