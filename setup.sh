#!/usr/bin/env bash

PYTHON=python
PIP=pip
FLAGS="--user"

# install python
sudo apt install python3.8 python3-venv

#install sqlite3
sudo apt-get install -y sqlite3

# install venv
$PYTHON -m venv env

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$PYTHON get-pip.py $FLAGS

# upgrade pip to latest version
$PIP install --upgrade pip $FLAGS

# #activate venv
# source env/bin/activate

# (optional) install any requirements of your current app in this venv
$PIP install -r requirements.txt $FLAGS
