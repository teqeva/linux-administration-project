# Linux Administration Independent Project

## Project Overview

This project demonstrates practical Linux Administration skills including system setup, user and permission management, shell scripting, NGINX deployment, and troubleshooting.

**Author:** EVA MUTHONI
**Date:** June 29, 2026
**OS:** Ubuntu 22.04 LTS

---

# Project Structure

```
LINUX_PROJECT_WEEK1/
│
├── README.md
│
├── docs/
│   ├── milestone1.md
│   ├── milestone2.md
│   ├── milestone3.md
│   └── milestone4.md
│
├── scripts/
│   └── nginx_health_checker.sh
│
├── config/
│   └── linux_project.conf
│
└── html/
    ├── index.html
    └── styles.css
```

---

# Documentation Link

Complete project documentation, screenshots, and evidence:

Google Drive:
https://docs.google.com/document/d/1Uw2XQw82zofxMeuRcBvR0Hk-z7uOlaxPa537N2YkS9c/edit?usp=sharing

---

# Project Milestones

## Milestone 1: Linux System Setup

Completed:

* Created project directory structure
* Managed Linux users and groups
* Configured ownership and permissions
* Created secure working environment

---

## Milestone 2: Shell Scripting Automation

Completed:

* Created `nginx_health_checker.sh`
* Automated NGINX health checks
* Checked service status
* Checked configuration
* Checked website availability
* Generated PASS/FAIL reports

Run script:

```bash
sudo ./scripts/nginx_health_checker.sh
```

---

## Milestone 3: NGINX Deployment

Completed:

* Installed NGINX web server
* Created static website
* Configured NGINX server block
* Deployed website on port 8080
* Tested configuration

Website:

```
http://localhost:8080
```

---

## Milestone 4: Troubleshooting

Documented and solved:

1. Port conflicts
2. Permission errors
3. Missing website files
4. NGINX configuration errors

Used troubleshooting commands:

```bash
nginx -t
systemctl status nginx
netstat -tlnp
tail /var/log/nginx/error.log
```

---

# Environment Details

| Component        | Details                 |
| ---------------- | ----------------------- |
| Operating System | Ubuntu 22.04 LTS        |
| Web Server       | NGINX                   |
| Website Port     | 8080                    |
| Project Location | /var/www/linux_project/ |

---

# Key Skills Demonstrated

* Linux file management
* Users and groups administration
* File permissions
* Bash scripting
* Server configuration
* NGINX deployment
* Troubleshooting
* Documentation

---

# Commands Used

Create directories:

```bash
sudo mkdir -p /var/www/linux_project/{html,config,logs,scripts,backups}
```

Install NGINX:

```bash
sudo apt install nginx -y
```

Test NGINX:

```bash
sudo nginx -t
```

Restart service:

```bash
sudo systemctl restart nginx
```

Check website:

```bash
curl http://localhost:8080
```

---

# Lessons Learned

This project improved my understanding of Linux administration by practicing:

* Managing system resources
* Automating administrative tasks
* Deploying web services
* Securing file access
* Diagnosing server problems

---

# Author

Name: EVA MUTHONI

Linux Administration Independent Project
June 29, 2026


End of Project Documentation
