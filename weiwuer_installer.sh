#!/bin/bash

go_back() { cd ../; }

main() {
	packages=(
		"xorg" "openbox" "tint2" "i3" "i3blocks" "ranger" "vim" "firefox-esr"
		"dunst" "picom" "python3" "python3-pip"
		"build-essential" "zlib1g-dev" "libncurses5-dev" "libgdbm-dev"
		"libnss3-dev" "libssl-dev" "libreadline-dev" "libffi-dev"
		"libsqlite3-dev" "wget" "libbz2-dev" 
	)

	# download and setup packages
	sudo apt install ${packages[@]}

	# make python 3.10
	wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz
	tar -xf Python-3.10.*.tgz
	cd Python-3.10.*/
	./configure --enable-optimizations
	make -j $(nproc)
	sudo make altinstall
	go_back

	# download and setup rb.
	git clone https://github.com/rethyxyz/rb
	cd rb
	chmod u+x rb.py
	sudo mv rb.py /usr/bin/rb
	rb # testing
	go_back
}

main "$@"
