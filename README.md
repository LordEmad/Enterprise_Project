# Mini Enterprise Infrastructure Lab

A hands-on home lab simulating a real enterprise environment, covering networking, Linux administration, Bash scripting automation, and Ansible configuration management.

---

## Project Structure

enterprise-lab/
├── bash/
│   ├── server_health.sh
│   ├── backup.sh
│   ├── user_audit.sh
│   └── network_check.sh
├── ansible/
│   ├── inventory
│   ├── install_apache.yml
│   └── install_db.yml
└── README.md


---

## Scripts

### Bash
| Script | Description |
|--------|-------------|
| server_health.sh | Monitors CPU, RAM, disk usage and service status |
| backup.sh | Automated compressed backups with retention policy |
| user_audit.sh | Audits user accounts for security issues |
| network_check.sh | Checks connectivity, open ports, DNS and gateway |

### Ansible
| Playbook | Description |
|----------|-------------|
| install_apache.yml | Installs web server across RHEL and Ubuntu hosts |
| install_db.yml | Installs MariaDB across RHEL and Ubuntu hosts |

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
