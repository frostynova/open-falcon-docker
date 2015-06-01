#!/bin/sh

WORKDIR=/home/work/open-falcon

cd $WORKDIR/dashboard

apt-get -y install libmysqlclient-dev python-dev python-pip python-virtualenv
virtualenv ./env
./env/bin/pip install -r pip_requirements.txt 
apt-get -y clean

