# Mini Enterprise Infrastructure Lab

A hands-on home lab simulating a real enterprise environment, covering networking, Linux administration, Bash scripting automation, and Ansible configuration management.

---

## Project Structure

```
Enterprise_Project/
├── bash/
│   ├── server_health.sh
│   ├── BackupP.sh
│   ├── useraudit.sh
│   ├── NetCheck
│   ├── firewallRules.sh
│   ├── dhcp_check.sh
│   └── vlan.sh
├── ansible/
│   ├── inventory
│   ├── install_apache.yml
│   ├── network_audit.yml
│   ├── usercreate.yml
│   ├── firewall.yml
│   ├── dhcp_setup.yml
│   ├── dns_setup.yml
│   └── templates/
│       ├── dhcpd.conf.j2
│       ├── named.conf.j2
│       └── zone.db.j2
└── README.md
```


---

## Scripts

### Bash
| Script | Description |
|--------|-------------|
| server_health.sh | Monitors CPU, RAM, disk usage and service status; logs to /var/log/health_report.log |
| BackupP.sh | Compresses and backs up /etc with a timestamped archive |
| useraudit.sh | Audits user accounts — removes inactive/never-logged-in users, flags accounts with no password or sudo privileges, and checks account expiry |
| NetCheck | Checks internet connectivity, open ports (22/80/443), IP addresses, interface status, DNS resolution, and default gateway |
| firewallRules.sh | Configures firewalld: sets default zone, allows services (ssh/http/https/cockpit), opens port 8080, blocks Telnet/FTP, adds SSH brute-force rate limiting, enables logging, and checks panic mode |
| dhcp_check.sh | Verifies DHCP service is running, counts total leases, and lists all active leases with IP, MAC, hostname, and expiry |
| vlan.sh | Creates VLAN subinterfaces (VLANs 10/20/30) on a base interface using nmcli with static IP assignment |

### Ansible
| Playbook | Description |
|----------|-------------|
| install_apache.yml | Installs Apache (httpd/apache2) on web servers and MariaDB on db servers across RHEL and Ubuntu hosts |
| network_audit.yml | Gathers IP addresses, routing tables, open ports, and ping connectivity between hosts across all nodes |
| usercreate.yml | Creates a user, sets a 90-day password policy, installs and starts nginx, and deploys an nginx config from a template |
| firewall.yml | Manages firewalld: opens port 443, sets default zone to public, blocks port 23 (Telnet), allows SSH, ensures firewall is running, and whitelists a specific IP via rich rule |
| dhcp_setup.yml | Installs dhcp-server, deploys config from Jinja2 template, starts and enables the service, and opens UDP port 67 in the firewall |
| dns_setup.yml | Installs BIND (bind/bind-utils), deploys named.conf and zone file from templates, starts the named service, and opens DNS ports 53/tcp and 53/udp |

---

## Technologies Used

- RHEL 9 / Ubuntu
- Bash Scripting
- Ansible
- Linux Administration
- Networking (VLANs, DNS, DHCP, Firewall)

---

## How to Run

### Bash Scripts
```bash
chmod +x script_name.sh
./script_name.sh
```

### Ansible Playbooks
```bash
ansible-playbook playbook.yml
```

---

## Lab Phases

- Phase 1 - Networking: VLANs, subnetting, DNS, DHCP, firewall rules
- Phase 2 - Linux Administration: User management, services, storage, permissions
- Phase 3 - Bash Scripting: Automation scripts for monitoring, backup, and auditing
- Phase 4 - Ansible: Configuration management and automated provisioning
