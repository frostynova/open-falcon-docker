#!/bin/sh

WORKDIR=/home/work/open-falcon

rm $WORKDIR/*.tar.gz
rm $WORKDIR/tmp/*

apt-get -y clean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*
rm -rf /var/tmp/*

chown -R work.work $WORKDIR
