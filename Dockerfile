FROM    ubuntu:trusty

ADD     scripts /
ADD     conf    /

RUN     sh /scripts/env_prepare.sh
RUN     sh /scripts/dashboard.sh
RUN     sh /scripts/fe.sh
RUN     sh /scripts/portal.sh
RUN     sh /scripts/env_clean.sh 

ADD     supervisord.conf /etc/supervisor/supervisord.conf

CMD     ["/usr/bin/supervisord"]
