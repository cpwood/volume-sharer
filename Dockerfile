FROM dperson/samba

VOLUME ["/etc/samba"]


#Based on this, we now install docker inside this image
#this means we have to install cURL and docker
RUN apk update  && \
    apk add curl \
    curl -sSL https://get.docker.com | sh

#This is needed to ensure smbd is running as root to access
#all the files in the volumes directory
ENV USERID=0 GROUPID=0

#Copy the volume-sharer file to bin
COPY volume-sharer.sh /usr/bin/

EXPOSE 137/udp 138/udp 139 445

ENTRYPOINT ["volume-sharer.sh"]
