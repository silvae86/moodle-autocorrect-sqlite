#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
	PYTHON=python3.7
	PIP=pip3.7
	# #fix any pending issues with homebrew
	# brew doctor

	# fix permissions
	sudo chown -R $(whoami) $(brew --prefix)/*

	# install python
	brew install sashkab/python/python37
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
	PYTHON=python
	PIP=pip
	
	# install python
	sudo apt-get install -y python3.7 python3.7-venv
fi

# install venv
$PYTHON -m venv env

# activate venv
source env/bin/activate

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$PYTHON get-pip.py --user

# upgrade pip to latest version
$PIP install --upgrade pip --user

# (optional) install any requirements of your current app in this venv
$PIP install -r requirements.txt --user
