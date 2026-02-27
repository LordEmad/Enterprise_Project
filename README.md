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
│   └── NetCheck
├── ansible/
│   ├── inventory
│   ├── install_apache.yml
│   ├── network_audit.yml
│   └── usercreate.yml
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

### Ansible
| Playbook | Description |
|----------|-------------|
| install_apache.yml | Installs Apache (httpd/apache2) on web servers and MariaDB on db servers across RHEL and Ubuntu hosts |
| network_audit.yml | Gathers IP addresses, routing tables, open ports, and ping connectivity between hosts across all nodes |
| usercreate.yml | Creates a user, sets a 90-day password policy, installs and starts nginx, and deploys an nginx config from a template |

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
