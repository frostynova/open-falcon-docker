#!/bin/sh

WORKDIR=/home/work/open-falcon
ls $WORKDIR
cd $WORKDIR/portal

virtualenv ./env
./env/bin/pip install -r pip_requirements.txt -i http://pypi.douban.com/simple/
