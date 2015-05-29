#!/bin/sh

WORKDIR=/home/work/open-falcon
FE_BIN="http://7xiumq.com1.z0.glb.clouddn.com/open-falcon-fe-0.0.1.tar.gz"

cd $WORKDIR
mkdir fe
cd fe
wget $FE_BIN 
tar zxvf open-falcon-fe-0.0.1.tar.gz
/etc/init.d/mysql start
mysql -u root < scripts/schema.sql
/etc/init.d/mysql stop
