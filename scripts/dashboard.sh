#!/bin/sh

WORKDIR=/home/work/open-falcon

cd $WORKDIR/dashboard

apt-get -y install libmysqlclient-dev python-dev python-pip
pip install -r pip_requirements.txt

