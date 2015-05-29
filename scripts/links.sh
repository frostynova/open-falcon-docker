#!/bin/sh

WORKDIR=/home/work/open-falcon

cd $WORKDIR/links

virtualenv ./env
./env/bin/pip install -r pip_requirements.txt -i http://pypi.douban.com/simple/

