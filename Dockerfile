FROM debian:buster

RUN apt update && \
      apt -y --no-install-recommends install \
	curl \
	iptables \
	openvpn \
        vim-nox \
        udhcpd

COPY config.ovpn cred udhcpd.conf run /

CMD bash /run
