FROM    ubuntu:trusty

ADD     scripts /scripts
ADD     conf    /conf

RUN     sh /scripts/env_prepare.sh
RUN     sh /scripts/dashboard.sh
RUN     sh /scripts/fe.sh
RUN     sh /scripts/portal.sh
RUN     sh /scripts/env_clean.sh 

ADD     supervisord.conf /home/work/open-falcon/conf/supervisord.conf

CMD     ["/usr/bin/supervisord", "-c", "/home/work/open-falcon/conf/supervisord.conf"]
