# Technical Findings

## Before Firewall

- **UFW Status**: Inactive — no protection
- **iptables**: All chains set to ACCEPT with no rules
- **Open ports**: 22 (SSH), 53 (DNS), 68 (DHCP), 323 (NTP)
- **Ping**: Responds — 4/4 packets received, 0% loss
- **Nmap**: Port 22 open, accessible from any IP
- **Risk level**: High — system fully exposed to network reconnaissance and attacks

## After Firewall

- **UFW Status**: Active with 7 rules (4 IPv4 + 3 IPv6)
- **Default policy**: Deny incoming, Allow outgoing
- **Ping**: Blocked — 0/4 packets received, 100% loss
- **Nmap**: Only port 22 visible, 999 ports filtered (no-response)
- **SSH**: Allowed only from 192.168.64.1 (host machine)
- **Telnet**: Blocked — connection timeout after 5 seconds
- **Risk level**: Low — minimal attack surface

## Comparative Analysis

| Aspect | Before | After |
|--------|--------|-------|
| Firewall status | Inactive | Active — 7 rules |
| Default policy | ACCEPT (all allowed) | DENY incoming / ALLOW outgoing |
| Port 22 (SSH) | Open to any IP | Restricted to 192.168.64.1 |
| Port 23 (Telnet) | No restriction | Explicitly denied |
| Ports 80/443 (Web) | Unmanaged | Controlled ALLOW |
| Ping (ICMP) | Responds (0% loss) | DROP (100% loss) |
| Nmap visibility | Port 22 open | Only 22, 999 filtered |
| Attack surface | Maximum exposure | Minimum exposure |

## Conclusions

1. UFW provides a robust yet simple interface for firewall management on Linux.
2. The deny-by-default approach drastically reduces the attack surface.
3. IP-restricted SSH access prevents brute-force attacks from unauthorized origins.
4. Blocking insecure protocols like Telnet is an essential hardening practice.
5. ICMP blocking adds an obscurity layer by hiding host presence on the network.
6. A firewall alone is not sufficient — it must be integrated with IDS/IPS, antivirus, and VPN as part of a defense-in-depth strategy.
