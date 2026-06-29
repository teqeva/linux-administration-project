# Linux Administration Independent Project


## Project Overview


This project demonstrates practical Linux Administration skills including:

- Linux system setup
- User and group management
- File ownership and permissions
- Shell scripting automation
- NGINX installation and deployment
- Troubleshooting and operations validation


**Author:** EVA MUTHONI  
**Date:** June 29, 2026  
**Operating System:** Ubuntu 22.04 LTS


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

# Project Documentation


Detailed documentation, screenshots, evidence, and explanations for each milestone can be found in the `docs` directory.


Access milestone documentation:


```text
docs/

├── milestone1.md   → Linux System Setup and Administration Basics

├── milestone2.md   → Shell Scripting and Automation

├── milestone3.md   → NGINX Static Website Deployment

└── milestone4.md   → Troubleshooting and Operations Validation
```


Each file contains:
- Commands used
- Configuration steps
- Screenshots/evidence
- Problem-solving process
- Results and verification


---

# Project Milestones


## Milestone 1: Linux System Setup


Completed:

- Created Linux project workspace
- Created users and groups
- Assigned users to appropriate groups
- Configured ownership and permissions
- Organized project directories securely


Documentation:

```text
docs/milestone1.md
```


---

## Milestone 2: Shell Scripting and Automation


Completed:

- Created `nginx_health_checker.sh`
- Automated NGINX health checks
- Checked NGINX installation
- Checked service status
- Verified configuration files
- Tested website availability


Run script:

```bash
sudo ./scripts/nginx_health_checker.sh
```


Documentation:

```text
docs/milestone2.md
```


---

## Milestone 3: NGINX Static Website Deployment


Completed:

- Installed NGINX web server
- Created static website
- Configured NGINX server block
- Deployed website files
- Tested local accessibility


Website:

```text
http://localhost:8080
```


Website files:

```text
/var/www/linux_project/html/

├── index.html
└── styles.css
```


## Website Deployment Evidence


The deployed website was successfully accessed through NGINX.


Screenshot showing the working website:


```text
(Insert website screenshot here)
```


The screenshot confirms:

- NGINX is serving the website successfully
- HTML and CSS files are loading correctly
- The custom project page is accessible locally


Documentation:

```text
docs/milestone3.md
```


---

## Milestone 4: Troubleshooting and Operations Validation


Documented and resolved:


1. Port conflict (Port 8080 already in use)

2. Permission denied (403 Forbidden)

3. Wrong website being served (Incorrect NGINX path)


Troubleshooting commands used:

```bash
nginx -t

systemctl status nginx

netstat -tlnp

tail /var/log/nginx/error.log

curl -I http://localhost
```


Documentation:

```text
docs/milestone4.md
```


---

# Environment Details


| Component | Details |
|---|---|
| Operating System | Ubuntu 22.04 LTS |
| Web Server | NGINX |
| Website Port | 8080 |
| Project Directory | /var/www/linux_project/ |
| Website Directory | /var/www/linux_project/html/ |


---

# Key Skills Demonstrated


- Linux file management
- User and group administration
- File permissions
- Bash scripting
- NGINX configuration
- Static website deployment
- Troubleshooting
- System documentation


---

# Important Commands Used


## Create Project Directories

```bash
sudo mkdir -p /var/www/linux_project/{html,config,logs,scripts,backups}
```


## Install NGINX

```bash
sudo apt install nginx -y
```


## Test NGINX Configuration

```bash
sudo nginx -t
```


## Restart NGINX

```bash
sudo systemctl restart nginx
```


## Check Website Availability

```bash
curl -I http://localhost:8080
```


## Check Permissions

```bash
ls -la /var/www/linux_project/html
```


---

# Lessons Learned


This project improved my understanding of Linux administration through practical experience with:


- Managing Linux users and permissions
- Securing file access
- Automating administrative tasks
- Deploying web services
- Configuring NGINX
- Troubleshooting real server issues


---

# Author

**EVA MUTHONI**

Linux Administration Independent Project  

June 29, 2026

