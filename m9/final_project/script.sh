#!/bin/bash

apt update
apt install -y git python3 python3-pip python3-dev

pip3 install --upgrade pip

pip3 install ansible==6.1.0

HOME_DIRECTORY=/home/${server_username}


REPOSITORY=$HOME_DIRECTORY/infrastructure_source
git clone -b master ${repository_name} $REPOSITORY

cd $REPOSITORY/m9/final_project
ls
