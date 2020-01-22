#!/usr/bin/env bash

PYTHON=python3.7
PIP=pip3.7
FLAGS="--user"

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
	# #fix any pending issues with homebrew
	# brew doctor

	# fix permissions
	sudo chown -R $(whoami) $(brew --prefix)/*

	# install python
	brew install sashkab/python/python37

	#install sqlite3
	brew install sqlite3
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform

	# install python
	sudo apt-get install -y python3.7 python3.7-venv

	#install sqlite3
	sudo apt-get install -y sqlite3
fi

# install venv
$PYTHON -m venv env

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$PYTHON get-pip.py $FLAGS

# upgrade pip to latest version
$PIP install --upgrade pip $FLAGS

#activate venv
source env/bin/activate

# (optional) install any requirements of your current app in this venv
$PIP install -r requirements.txt $FLAGS
