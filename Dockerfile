FROM ubuntu

RUN apt update 
RUN apt install -y net-tools nftables iptables iputils-ping \
    iproute2 wget netcat nginx ssh nano traceroute vim lynx

RUN ssh-keygen -t ed25519 -f /root/.ssh/id_ed25519 -N "" -q
RUN cp /root/.ssh/id_ed25519.pub /root/.ssh/authorized_keys
# to be able to use "wget https://heig-vd.ch", else it will fail with a security error
RUN echo "Options = UnsafeLegacyRenegotiation" >> /usr/lib/ssl/openssl.cnf

# Wait forever
CMD tail -f /dev/null