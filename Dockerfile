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

EXPOSE  [8433, 6030, 8080, 6060, 9966]

CMD     ["/usr/bin/supervisord", "-c", "/home/work/open-falcon/conf/supervisord.conf"]
