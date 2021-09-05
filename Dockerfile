FROM debian:latest

EXPOSE 17500
EXPOSE 17500/udp

RUN apt update && apt install -y python python3 libglib2.0-0 libc6 libglapi-mesa libxdamage1 libxfixes3 libxcb-glx0 libxcb-dri2-0 libxcb-dri3-0 libxcb-present0 libxcb-sync1 libxshmfence1 libxxf86vm1
RUN apt-get clean autoclean  && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
RUN wget https://www.dropbox.com/download?dl=packages/dropbox.py -O /usr/local/bin/dropbox.py && chmod +x /usr/local/bin/dropbox.py

RUN install -dm0 ~/.dropbox-dist
CMD ["/root/.dropbox-dist/dropboxd"]
