FROM ubuntu:16.04

RUN apt-get update && apt-get install -y gdebi
COPY BeerSmith-2.3.12_amd64.deb /tmp
RUN gdebi --non-interactive /tmp/BeerSmith-2.3.12_amd64.deb 
COPY BeerSmith2-jselk /home/developer/BeerSmith2-developer

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

#RUN useradd -ms /bin/bash developer
#RUN dbus-uuidgen > /var/lib/dbus/machine-id

USER developer
ENV HOME /home/developer
CMD /usr/bin/beersmith2
