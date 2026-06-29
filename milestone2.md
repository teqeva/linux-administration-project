# Milestone 2: Shell Scripting and Automation

## Overview

This milestone focuses on creating a shell script that automates health checks for the NGINX web server environment.

The script performs automated checks for:

- NGINX installation
- NGINX service status
- Configuration file availability
- Error log verification
- Important directory checks
- Website accessibility


---

#  Creating the Script File


The health checker script was created at:


```text
LINUX_PROJECT_WEEK1/

└── scripts/

    └── nginx_health_checker.sh
```


The script automates multiple NGINX checks that would normally require running several commands manually.


## Evidence

<img width="570" height="907" alt="newer" src="https://github.com/user-attachments/assets/efb26fda-3de9-4dfc-9d3c-587edac01a10" />

<img width="564" height="462" alt="new" src="https://github.com/user-attachments/assets/0459b84d-595c-42e8-9b67-033655d741e6" />


---

#  Script Functionality


The `nginx_health_checker.sh` script performs the following tasks:


### 1. NGINX Installation Check

Verifies whether NGINX is installed on the system.

### 2. Service Status Check

Checks whether the NGINX service is currently running.


### 3. Configuration Validation

Confirms that the NGINX configuration file exists.


### 4. Error Log Monitoring

Checks the NGINX error log and displays recent issues for troubleshooting.


### 5. Directory Verification

Checks that important directories required by NGINX and the project exist.


### 6. Website Accessibility Test

Tests whether the deployed website is accessible through the configured port.

---

#  Making the Script Executable


The script was given execute permission so it can run as an executable file.


Command used:

```bash
chmod +x scripts/nginx_health_checker.sh
```


## Evidence

<img width="623" height="38" alt="image" src="https://github.com/user-attachments/assets/ef338868-9c0b-4668-8e9f-15ff4204aad8" />

---

# Running the Script


Command used:

```bash
sudo ./scripts/nginx_health_checker.sh
```

## Evidence: Successful Execution

<img width="1213" height="440" alt="image" src="https://github.com/user-attachments/assets/1f281bba-52b5-4c90-a6a1-8d6dca88e018" />

---

#  Benefits of the Script


## 1. Quick Health Status


Instead of manually running multiple commands such as:

```bash
which nginx

ps aux | grep nginx

ls -la /etc/nginx/nginx.conf

ls -la /var/log/nginx/error.log

curl -I http://localhost:8080
```


One command performs all checks:

```bash
sudo ./scripts/nginx_health_checker.sh
```


This saves time and provides a consistent health report.

---

## 2. Problem Identification


The script helps identify configuration and permission issues through error logs.


Example:

```text
Error log found at /var/log/nginx/error.log

last 2 error log entries:  > 2026/06/29 00:34:03 [error] ... "/var/www/linux_project/html/index.html" is forbidden (13: Permission denied)
```

This indicates that NGINX cannot access required website files, allowing the administrator to fix permissions quickly.

---

# Milestone 2 Summary


| Task | Status |
|---|---|
| Shell script created | Completed |
| Script stored in scripts directory | Completed |
| Execute permission added | Completed |
| Script tested successfully | Completed |
