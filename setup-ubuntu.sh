#!/usr/bin/env bash

# install python
sudo apt-get install -y python3.7 python3.7-venv

# install venv
python3.7 -m venv env
# activate venv
source env/bin/activate
# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
# upgrade pip to latest version
pip install --upgrade pip
# (optional) install any requirements of your current app in this venv
pip install -r requirements.txt
