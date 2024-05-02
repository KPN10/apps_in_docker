#!/bin/bash

log_dir="/mnt/ramdisk/log/wg3proxy"
if [ ! -d $log_dir ]; then
    sudo mkdir -p $log_dir
    sudo mount -t tmpfs -o size=128M tmpfs $log_dir
    sudo chown -R user:root $log_dir
    sudo chmod -R 777 $log_dir
fi

docker run \
    --rm \
    -d \
    --name="wg_3proxy" \
    --cap-add NET_ADMIN \
    --cap-add SYS_MODULE \
    --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
    --sysctl="net.ipv6.conf.all.disable_ipv6=0" \
    -p 56120:56120 \
    --privileged \
    -v $log_dir:/var/log/3proxy \
    -v ~/wg3proxy/wg0.conf:/etc/wireguard/wg0.conf \
    -v ~/wg3proxy/3proxy.cfg:/etc/3proxy/3proxy.cfg \
    wg3proxy 

sudo iptables -A FORWARD -i enx503eaa4968ed -o docker0 -p tcp --syn --dport 56120 -m conntrack --ctstate NEW -j ACCEPT
sudo iptables -A FORWARD -i docker0 -o enx503eaa4968ed -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -i enx503eaa4968ed -o docker0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -A PREROUTING -i docker0 -p tcp --dport 56120 -j DNAT --to-destination 172.17.0.3
sudo iptables -t nat -A POSTROUTING -o docker0 -p tcp --dport 56120 -d 172.17.0.3 -j SNAT --to-source 172.17.0.1

