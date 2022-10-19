all:
	$(MAKE) all -C ./Bash/managedkaos
	sudo apt-get install -y carton
	$(MAKE) all -C ./Perl/managedkaos || echo "Still working on it..."
