#!/bin/bash
# UFW Firewall Configuration Script
# CY-501 Lab — Ubuntu Server 26.04 LTS

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH only from host machine
sudo ufw allow from 192.168.64.1 to any port 22 proto tcp

# Allow web traffic (HTTP and HTTPS)
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Block Telnet (insecure, transmits credentials in plaintext)
sudo ufw deny 23/tcp

# Block ICMP echo-request (ping) — requires manual edit:
# In /etc/ufw/before.rules, change the line:
#   -A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT
# to:
#   -A ufw-before-input -p icmp --icmp-type echo-request -j DROP

# Enable firewall
sudo ufw enable

# Show active rules
sudo ufw status numbered
