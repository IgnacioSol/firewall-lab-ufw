# UFW Firewall Configuration Lab

Practical lab for **CY-501 Introduction to Cybersecurity** at Universidad Fidelitas (Group G8).

## Overview

This project demonstrates the installation, configuration, and testing of UFW (Uncomplicated Firewall) on Ubuntu Server 26.04 LTS running in a UTM virtual machine on macOS (Apple Silicon).

## Lab Environment

| Component | Detail |
|-----------|--------|
| Host | macOS, Apple Silicon (ARM64) |
| Hypervisor | UTM (QEMU), Shared Network |
| Guest OS | Ubuntu Server 26.04 LTS (aarch64) |
| VM IP | 192.168.64.8 |
| Host IP | 192.168.64.1 |
| Firewall | UFW (Uncomplicated Firewall) |

## Firewall Rules

| # | Rule | Purpose |
|---|------|---------|
| 1 | `ufw default deny incoming` | Block all incoming traffic by default |
| 2 | `ufw default allow outgoing` | Allow all outgoing traffic |
| 3 | `ufw allow from 192.168.64.1 to any port 22 proto tcp` | SSH access restricted to host IP |
| 4 | `ufw allow 80/tcp` / `ufw allow 443/tcp` | Allow HTTP and HTTPS |
| 5 | `ufw deny 23/tcp` | Block Telnet (insecure protocol) |
| 6 | `before.rules: echo-request ACCEPT → DROP` | Block ICMP ping |

## Testing Results

| Test | Result |
|------|--------|
| Ping (ICMP) | **Blocked** — 100% packet loss |
| Nmap scan | **Filtered** — only port 22 visible, 999 filtered |
| SSH from host | **Allowed** — connection successful |
| Telnet (port 23) | **Blocked** — connection timeout |

## Project Structure

```
firewall-lab-ufw/
├── README.md
├── ufw-rules.sh          # Firewall configuration script
├── findings.md            # Technical analysis
└── evidence/
    ├── before/            # Screenshots before firewall
    └── after/             # Screenshots after firewall
```

## Key Takeaways

- **Deny by default** minimizes attack surface by only allowing explicitly permitted traffic.
- **IP-restricted SSH** prevents brute-force attacks from unauthorized sources.
- **Blocking insecure protocols** like Telnet is a fundamental hardening practice.
- **ICMP blocking** hides host presence on the network.
- A firewall is one layer in a **defense-in-depth** strategy — it should be complemented with IDS/IPS, antivirus, and VPN.

## Course

CY-501 Introduction to Cybersecurity — Universidad Fidelitas, June 2026.
