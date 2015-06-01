#!/bin/sh

WORKDIR=/home/work/open-falcon

function deploy_config {
    if [ ! -f "$WORKDIR/conf/$1" ]; then
        cp /conf/$1 $WORKDIR/conf/
    fi
}


if [ ! -d "$WORKDIR/mysql/mysql" ]; then
    rsync -a /var/lib/mysql $WORKDIR/
fi


deploy_config my.cnf
deploy_config redis.conf
deploy_config alarm.cfg
deploy_config fe.cfg 
deploy_config graph.cfg
deploy_config graph_backends.txt
deploy_config hbs.cfg
deploy_config judge.cfg
deploy_config query.cfg
deploy_config sender.cfg
deploy_config transfer.cfg

deploy_config dashboard.py
deploy_config dashboard-gunicorn.conf
rm $WORKDIR/dashboard/rrd/config.py
rm $WORKDIR/dashboard/gunicorn.conf
ln -s $WORKDIR/conf/dashboard.py $WORKDIR/dashboard/rrd/config.py
ln -s $WORKDIR/conf/dashboard-gunicorn.conf $WORKDIR/dashboard/gunicorn.conf

deploy_config portal.py
deploy_config portal-gunicorn.conf
rm $WORKDIR/portal/frame/config.py
rm $WORKDIR/portal/gunicorn.conf
ln -s $WORKDIR/conf/portal.py $WORKDIR/portal/frame/config.py
ln -s $WORKDIR/conf/portal-gunicorn.conf $WORKDIR/portal/gunicorn.conf

deploy_config links.py
deploy_config links-gunicorn.conf
rm $WORKDIR/links/frame/config.py
rm $WORKDIR/links/gunicorn.conf
ln -s $WORKDIR/conf/links.py $WORKDIR/links/frame/config.py
ln -s $WORKDIR/conf/links-gunicorn.conf $WORKDIR/links/gunicorn.conf

supervisorctl start mysql
supervisorctl start redis
sleep 5
supervisorctl start alarm
supervisorctl start dashboard
supervisorctl start fe
supervisorctl start graph
supervisorctl start hbs
supervisorctl start judge
supervisorctl start query
supervisorctl start sender
supervisorctl start transfer
supervisorctl start links
supervisorctl start portal
