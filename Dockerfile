FROM    ubuntu:trusty

ADD     scripts /scripts

RUN     sh /scripts/env_prepare.sh
RUN     sh /scripts/dashboard.sh
RUN     sh /scripts/fe.sh
RUN     sh /scripts/portal.sh
RUN     sh /scripts/links.sh
RUN     sh /scripts/env_clean.sh 

ADD     conf    /conf
ADD     startup.sh /scripts/startup.sh
ADD     supervisord.conf /home/work/open-falcon/conf/supervisord.conf

EXPOSE  8433
EXPOSE  6030
EXPOSE  5050
EXPOSE  8080
EXPOSE  8081
EXPOSE  6060

CMD     ["/usr/bin/supervisord", "-c", "/home/work/open-falcon/conf/supervisord.conf"]
