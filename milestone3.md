# Milestone 3: NGINX Static Website Deployment

## Overview

This milestone focuses on installing, configuring, and deploying a static website using NGINX on a Linux system.

The tasks completed include:

- Installing and verifying NGINX
- Validating NGINX configuration
- Placing website files in the correct directory
- Testing local website accessibility
- Customizing the deployed website
- 
---

# 1. NGINX Installation Status

NGINX installation was verified to confirm that the web server is installed and ready for deployment.


Command used:

```bash
nginx -v
```

## Evidence
<img width="642" height="60" alt="Screenshot From 2026-06-29 01-16-49" src="https://github.com/user-attachments/assets/41f6140b-b08c-4ccf-8930-79fa65d761e9" />


### Importance

This command confirms the installed NGINX version and verifies that the web server is available on the system.

---

# 2. NGINX Configuration Validation

Before deploying the website, the NGINX configuration was tested to ensure there were no syntax errors.


Command used:

```bash
sudo nginx -t
```

## Evidence

<img width="640" height="78" alt="Screenshot From 2026-06-29 01-18-49" src="https://github.com/user-attachments/assets/ea717ef3-78c6-4449-bc7a-56e2532c16e3" />

### Importance

The command checks the NGINX configuration files before restarting or reloading the service.

It helps prevent deployment failures caused by incorrect configurations.

---

# 3. Site File Placement


The website files were placed in the NGINX web directory:


```text
/var/www/linux_project/html/
```


Website files:

```text
index.html

styles.css
```
<img width="642" height="225" alt="Screenshot From 2026-06-29 01-22-37" src="https://github.com/user-attachments/assets/0b34aec4-8e67-4e2b-98b4-7fa398577fa3" />

Applying Ownership

```bash

sudo chown -R webadmin:developers /var/www/linux_project/html

```

Accessing the files

```text
/var/www/linux_project/html/
```

### Importance

The correct file placement allows NGINX to locate and serve the website content when users access the server.



## Evidence
<img width="639" height="51" alt="image" src="https://github.com/user-attachments/assets/8ec9fff9-c664-46b0-9070-0331491eedae" />

<img width="650" height="168" alt="image" src="https://github.com/user-attachments/assets/b9e1f239-c6a6-4eeb-96a5-763f6797eb52" />


---

# 4. Successful Local Access


The deployed website was tested locally to confirm that NGINX was serving the website successfully.


Command used:

```bash
curl -I http://localhost:8080
```


Expected response:

```text
HTTP/1.1 200 OK
```


## Evidence

<img width="652" height="192" alt="image" src="https://github.com/user-attachments/assets/1e62a6b4-b3bb-49a9-93bc-b4dc0c5e7279" />

### Importance

The response confirms that:

- NGINX is running
- The website files are accessible
- The deployment was successful



---

# 5. Website Customization


The deployed website was customized to display project-specific information.


The website includes:

- Project title
- Deployment information
- Linux administration skills demonstrated
- NGINX deployment details
- Student project notes


Website files:

```text
index.html

styles.css
```


## Custom Features Added


The website displays:

- Hostname: `teqiee-server`
- Deployment date: `June 30, 2026`
- NGINX version information
- Project directory location
- Deployment author


## Evidence: Customized Website

<img width="1917" height="894" alt="image" src="https://github.com/user-attachments/assets/8d833947-abbf-4d9e-ba89-40c444d1661a" />
<img width="1917" height="668" alt="image" src="https://github.com/user-attachments/assets/7d120fed-0741-4c0c-96bf-ea8190a0b228" />

---

# Website Deployment Structure


```text
/var/www/linux_project/html/

├── index.html

└── styles.css
```


This structure separates website content and styling while allowing NGINX to serve the static website correctly.



---

# Milestone 3 Summary


| Task | Status |
|---|---|
| NGINX installed | Completed |
| Configuration validated | Completed |
| Website files deployed | Completed |
| Local access tested | Completed |
| Website customized | Completed |
