# Milestone 4: Troubleshooting and Operations Validation

## Overview

This milestone focuses on identifying, investigating, and resolving Linux and NGINX-related issues using a structured troubleshooting approach.

The troubleshooting process involved:

- Identifying the problem
- Investigating using Linux commands
- Interpreting command output
- Applying the correct fix
- Verifying that the issue was resolved


Four issues were investigated and documented.
---

# 1. Port Conflict (Port 8080 Already in Use)


## Problem Statement

NGINX failed to start because port `8080` was already being used by another service.

Commands executed:
```bash
sudo systemctl start nginx
sudo journalctl -u nginx -n 10
```

## Evidence 

<img width="1049" height="477" alt="image" src="https://github.com/user-attachments/assets/dcbc1575-1a30-4870-a91a-876af15bca20" />


The error indicated:

```text
bind() to 0.0.0.0:8080 failed (98: Address already in use)
```

This meant another process was already using the required port.

---

# Investigation


## Checking NGINX Status


Command used:

```bash
sudo systemctl start nginx
```
## Evidence

<img width="699" height="206" alt="image" src="https://github.com/user-attachments/assets/dfa7ba35-b918-478a-972e-36b9ac4fe4ec" />

## Interpretation

- NGINX failed to start.
- The error showed that port 8080 was already occupied.
- Another service was preventing NGINX from binding to the port.



---

## Checking the Service Using Port 8080


Command used:

```bash
sudo netstat -tlnp | grep 8080
```
## Evidence 
<img width="665" height="54" alt="image" src="https://github.com/user-attachments/assets/1b55687a-cf94-46b1-8269-b3d1165c6e45" />


## Interpretation

The output showed:

- Python3 was using port 8080.
- Process ID was identified.
- The port was in LISTEN state.



---

## Checking NGINX Configuration


Command used:

```bash
sudo cat /etc/nginx/sites-available/linux_project | grep listen
```
<img width="675" height="82" alt="image" src="https://github.com/user-attachments/assets/34feaf06-9f2e-43cb-83c8-674569af3f54" />


## Interpretation

- NGINX configuration showed port 80.
- The error logs referenced port 8080.
- This showed a configuration mismatch.



---

# Fix Applied


## Stopping the Service Using Port 8080


Command used:

```bash
sudo kill 238463
```
## Evidence

<img width="587" height="17" alt="image" src="https://github.com/user-attachments/assets/cf488164-a950-4f1e-b602-9d975de7c7f4" />

This stopped the Python service occupying the port.

## Updating NGINX Configuration

Command used:

```bash
sudo nano /etc/nginx/sites-available/linux_project
```
The configuration was updated to use the correct port. (I manually changed the port from 8080 to 80 via the text editor)

## Evidence

<img width="590" height="263" alt="image" src="https://github.com/user-attachments/assets/6a2ba0d5-9536-43ed-9d16-633aac831e2d" />


## Testing Configuration


Command used:

```bash
sudo nginx -t
```
## Evidence

<img width="614" height="48" alt="image" src="https://github.com/user-attachments/assets/d8763bae-c45f-4794-899d-b826c969ee1c" />


## Starting NGINX


Command used:

```bash
sudo systemctl start nginx
```
## Evidence
<img width="642" height="57" alt="image" src="https://github.com/user-attachments/assets/e5d12a7f-6605-484c-a604-99794a2ad576" />

# Verification


Command used:

```bash
sudo systemctl status nginx
```
## Evidence

<img width="616" height="396" alt="image" src="https://github.com/user-attachments/assets/98f09746-589c-4a4e-bf9d-84b9028ca97a" />

NGINX started successfully after removing the port conflict.


## Cause of the Problem

The issue occurred because I started the following process earlier before starting NGINX:

```bash
python3 -m http.server 8080
````

This process occupied port `8080`, which was the same port configured for NGINX.

When I attempted to start NGINX afterwards, it failed because the port was already in use by the Python HTTP server, causing the error:

```text
bind() to 0.0.0.0:8080 failed (98: Address already in use)
```

---

# 2. Permission Denied (403 Forbidden)


## Problem Statement


The website returned a `403 Forbidden` error because NGINX could not read the website files when checking the website 

Command used:

```bash
curl -I http://localhost:80
```

## Evidence 

<img width="668" height="142" alt="image" src="https://github.com/user-attachments/assets/67e5fa4c-18ac-4761-bd4e-3208745591e4" />

Meaning:

- NGINX was running.
- The server was reachable.
- File access was blocked.

---

# Investigation

## Checking Error Logs


Command used:

```bash
sudo tail -10 /var/log/nginx/error.log
```
## Evidence 

<img width="932" height="188" alt="image" src="https://github.com/user-attachments/assets/236f1f60-c1e1-4abe-bfce-56eca03ae78d" />

## Interpretation

Showed: "/var/www/linux_project/html/index.html" is forbidden (13: Permission denied)
Error code 13 means Permission is denied
NGINX cannot read the file

## Checking File Permissions

Command used:

```bash
ls -la /var/www/linux_project/html/
```
## Evidence

<img width="707" height="58" alt="image" src="https://github.com/user-attachments/assets/9f8da687-323f-4dd8-a21f-b4acae627944" />

## Interpretation

The files had restrictive permissions, preventing NGINX from reading them.

---

# Fix Applied

Commands used:

```bash
sudo chmod 644 /var/www/linux_project/html/index.html

sudo chmod 644 /var/www/linux_project/html/styles.css

sudo chmod 755 /var/www/linux_project/html
```

## Evidence

<img width="683" height="106" alt="image" src="https://github.com/user-attachments/assets/c8fa6737-acbc-4f00-9c05-e353114c603d" />


## Reason for the specific file permissions:
- `644` allows files to be read by NGINX.
- `755` allows directory access thus Prevents unauthorized modification.
  
---

# Verification

Command used:

```bash
ls -la /var/www/linux_project/html/
```
## Evidence

<img width="690" height="119" alt="image" src="https://github.com/user-attachments/assets/081e2726-ab6e-4c1c-82e7-4b07666cf244" />

```bash
curl -I http://localhost:8080
```

The website became accessible after correcting permissions.

## Evidence

<img width="684" height="219" alt="image" src="https://github.com/user-attachments/assets/f30322f2-1570-4285-8e37-e54d25014cc8" />

## Cause of the Problem


The issue occurred because the website files had incorrect permissions that prevented NGINX from accessing and reading them.


The following restrictive permissions were applied:

```bash
sudo chmod 600 /var/www/linux_project/html/index.html

sudo chmod 600 /var/www/linux_project/html/styles.css

sudo chmod 700 /var/www/linux_project/html
````

These permissions allowed only the file owner to access the website files, while the NGINX service (`www-data` user) did not have the required permissions to read and serve the website content.

When users attempted to access the website, NGINX was running correctly, but it could not access the required files, resulting in the error:

```text
HTTP/1.1 403 Forbidden
```

The issue was resolved by changing the file and directory permissions to allow NGINX read access while maintaining secure file protection.

Fixed permissions:

```bash
sudo chmod 644 /var/www/linux_project/html/index.html

sudo chmod 644 /var/www/linux_project/html/styles.css

sudo chmod 755 /var/www/linux_project/html
```

After applying the correct permissions, NGINX was able to read the website files and serve the website successfully.

---

# 3. Wrong Website Being Served (Incorrect Path)

## Problem Statement

NGINX displayed the default welcome page instead of the project website.

The project files existed in:

```text
/var/www/linux_project/html/
```
but were not being used.

---

# Investigation

## Checking Current Website Output

Command used:

```bash
curl http://localhost:8080 | head -20
```
## Evidence 

<img width="613" height="270" alt="image" src="https://github.com/user-attachments/assets/9ab17cb9-ae74-4bf3-8a34-01ecedec3f80" />


This confirms NGINX was serving the default website.

---

## Checking Enabled Sites

Command used:

```bash
ls -la /etc/nginx/sites-enabled/
```
## Evidence

<img width="615" height="120" alt="image" src="https://github.com/user-attachments/assets/eaab7e0e-1653-49e3-b46d-d5ebe7245b04" />

## Interpretation

-It showed `default` site is enabled and my `linux_project` site is not enabled
- This is why NGINX serves the default page
---

## Checking Available Sites


Command used:

```bash
ls -la /etc/nginx/sites-available/
```
## Evidence

<img width="617" height="141" alt="image" src="https://github.com/user-attachments/assets/3bf5063c-866c-44a5-ab52-98ae6e9e1b85" />

## Interpretation

- linux_project configuration exists but it's not linked to `sites-enabled`

---

# Fix Applied


## Removing Default Site

Command used:

```bash
sudo rm /etc/nginx/sites-enabled/default
```
## Evidence

<img width="589" height="33" alt="image" src="https://github.com/user-attachments/assets/3b066558-2bfe-463a-9423-2c3eb50423f2" />

## Enabling Project Website

Command used:

```bash
sudo ln -s /etc/nginx/sites-available/linux_project /etc/nginx/sites-enabled/
```
## Evidence

<img width="589" height="47" alt="image" src="https://github.com/user-attachments/assets/71d47eda-ac56-4d67-8c04-87415b6e3587" />


## Testing Configuration


Command used:

```bash
sudo nginx -t
```
## Evidence

<img width="591" height="56" alt="image" src="https://github.com/user-attachments/assets/9b36376d-5f22-4b21-bda6-3a0b1c0edf06" />


## Reloading NGINX


Command used:

```bash
sudo systemctl reload nginx
```
## Evidence

<img width="593" height="31" alt="image" src="https://github.com/user-attachments/assets/9b6df3d7-3d6f-4371-aa27-fdaf3dc8512b" />

---

# Verification


Testing website:

```bash
curl -I http://localhost:80
```


Checking website content:

```bash
curl http://localhost:80 | grep "Linux Administration"
```
## Evidence

<img width="1499" height="890" alt="image" src="https://github.com/user-attachments/assets/fdf827e2-69ed-475d-af1f-d51f60d6cc4a" />


NGINX successfully served the project website from:

```text
/var/www/linux_project/html/
```

## Cause of the Problem


The issue occurred because NGINX was serving the default website instead of the project website.


The project files were located in:

```text
/var/www/linux_project/html/
````

However, the default NGINX configuration was still enabled, causing NGINX to load the default welcome page.

The issue was identified using:

```bash
curl http://localhost:8080
```

Output:

```text
Welcome to nginx!
```

The problem was fixed by removing the default site and enabling the project configuration:

```bash
sudo rm /etc/nginx/sites-enabled/default

sudo ln -s /etc/nginx/sites-available/linux_project /etc/nginx/sites-enabled/
```

Configuration was tested and NGINX reloaded:

```bash
sudo nginx -t

sudo systemctl reload nginx
```

After the fix, NGINX successfully served the website from:

```text
/var/www/linux_project/html/
```

---

# Milestone 4 Summary


| Issue | Status |
|---|---|
| Port conflict resolved | Completed |
| Permission error fixed | Completed |
| Incorrect website path fixed | Completed |
| NGINX deployment verified | Completed |
