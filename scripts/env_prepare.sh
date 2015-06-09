#!/bin/sh

WORKDIR=/home/work/open-falcon
OPEN_FALCON_BIN="http://7xiumq.com1.z0.glb.clouddn.com/open-falcon-binary-0.0.3.tar.gz"
#OPEN_FALCON_BIN="https://dl.dropboxusercontent.com/u/65132683/open-falcon-binary-0.0.2.tar.gz"

useradd -m work
mkdir $WORKDIR
mkdir $WORKDIR/mysql
mkdir $WORKDIR/conf
mkdir $WORKDIR/logs
mkdir $WORKDIR/data

echo 'mysql-server mysql-server/root_password password open-falcon' | debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password open-falcon' | debconf-set-selections
apt-get -y update
apt-get -y install git mysql-server redis-server supervisor wget

echo "manual" > /etc/init/mysql.override
echo "manual" > /etc/init/redis-server.override
rm -f /etc/rc*/*mysql
rm -f /etc/rc*/*redis-server

/etc/init.d/mysql start
mysql mysql -uroot -popen-falcon -e "UPDATE user SET Password='' WHERE User='root'; FLUSH PRIVILEGES;"

cd $WORKDIR
git clone https://github.com/open-falcon/scripts.git
cd scripts
mysql -u root < db_schema/graph-db-schema.sql
mysql -u root < db_schema/dashboard-db-schema.sql
mysql -u root < db_schema/portal-db-schema.sql
mysql -u root < db_schema/links-db-schema.sql
mysql -u root < db_schema/uic-db-schema.sql

/etc/init.d/mysql stop

cd $WORKDIR
mkdir tmp
wget $OPEN_FALCON_BIN -O open-falcon-latest.tar.gz
tar -zxf open-falcon-latest.tar.gz -C tmp/
for x in `find ./tmp/ -name "*.tar.gz"`;do \
    app=`echo $x|cut -d '-' -f2`; \
    mkdir -p $app; \
    tar -zxf $x -C $app; \
done

apt-get -y clean
