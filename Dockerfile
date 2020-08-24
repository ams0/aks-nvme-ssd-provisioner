FROM debian:stretch-slim

RUN  apt-get update && apt-get -y install nvme-cli mdadm && apt-get -y clean && apt-get -y autoremove
COPY aks-nvme-ssd-provisioner.sh /usr/local/bin/

ENTRYPOINT ["aks-nvme-ssd-provisioner.sh"]