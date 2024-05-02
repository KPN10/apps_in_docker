FROM ubuntu:latest
RUN apt update && apt upgrade -y
RUN apt install -y --no-install-recommends ntp
#ENTRYPOINT ["/usr/sbin/ntpd"]
CMD ["service ntp start"]
CMD ["sleep", "infinity"]

