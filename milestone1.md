# Milestone 1: Linux System Setup and Administration Basics


##  Overview

This milestone focuses on the complete setup of the Linux environment for the Linux Administration project.

The tasks completed include:

- Creating a structured project workspace
- Managing Linux users and groups
- Assigning users to appropriate groups
- Configuring file permissions
- Organizing files securely for administration and deployment


---

#  Creating Project Workspace

The project directory and required subdirectories were created to organize files based on their purpose using:

```bash
sudo mkdir -p /var/www/linux_project

sudo mkdir -p /var/www/linux_project/{html,config,logs,scripts,backups}

ls -la /var/www/linux_project/
````

## Directory Structure

The created structure:

```text
/var/www/linux_project/

├── html/
│   └── Website files (HTML & CSS) - separates website files from other resources.

├── config/
│   └── NGINX configuration files - stores configuration files for easier management.

├── logs/
│   └── Access and error logs - provides a dedicated location for monitoring and troubleshooting.

├── scripts/
│   └── Automation shell scripts - keeps automation scripts organized.

└── backups/
    └── Backup and recovery files -  supports recovery and data protection.
```

## Evidence

<img width="652" height="243" alt="image" src="https://github.com/user-attachments/assets/f245fdf3-bd0c-4ce7-a31a-8adcaf38a769" />

---

# User and Group Configuration

## 1. Creating Users
Separate user accounts were created to avoid using a single account for all activities.
The following users were created:

* webadmin -  provides administrative management of the project.
* webdev1 and webdev2 - allow developers to work on project resources.
* webtester - provides an account for testing purposes.

This improves accountability, security, and user management.

Commands used:
## i.
```bash
sudo useradd -m -s /bin/bash webadmin

sudo passwd webadmin

id webadmin
```
## Evidence 

<img width="649" height="150" alt="image" src="https://github.com/user-attachments/assets/a2065a49-8da6-488b-b13a-80dadb1f4339" />

## ii.
```bash
sudo useradd -m -s /bin/bash webdev1

sudo passwd webdev1

id webdev1
```
## Evidence

<img width="649" height="150" alt="image" src="https://github.com/user-attachments/assets/f2e4b8e6-15cc-4078-a9a8-4cce4fc1d250" />

## iii.
```bash
sudo useradd -m -s /bin/bash webdev2

sudo passwd webdev2

id webdev2
```
## Evidence 
<img width="649" height="150" alt="image" src="https://github.com/user-attachments/assets/428bfc1f-10e8-4f68-a1c4-b074239edb75" />

## iv.
```bash
sudo useradd -m -s /bin/bash webtester

sudo passwd webtester

id webtester
```
## Evidence 
<img width="649" height="150" alt="image" src="https://github.com/user-attachments/assets/376b363b-724d-4776-95fa-611ace068744" />

---

# 2. Creating Groups

Two groups were created to simplify permission management:

* developers
* admins
Groups allow permissions to be managed for multiple users instead of configuring each user individually.

Commands:

```bash
sudo groupadd developers

sudo groupadd admins
```
## Evidence

<img width="659" height="42" alt="image" src="https://github.com/user-attachments/assets/a575c838-0ab3-426d-bc3a-b180c0035f69" />

Verification
```bash
cat /etc/group
```
## Evidence

<img width="653" height="132" alt="image" src="https://github.com/user-attachments/assets/283ce28b-634e-46c2-8375-b2b3cfe83dc3" />

---


# Assigning of Groups to users created previously 

Two groups were created to manage user permissions and responsibilities:

| Group | Purpose |
|---|---|
| admins | Users with administrative privileges |
| developers | Users responsible for website development and project files |

## i.Adding webadmin to admins group

The webadmin account was assigned administrative privileges:

```bash
sudo usermod -aG admins webadmin

id webadmin
```

## Evidence

<img width="649" height="73" alt="image" src="https://github.com/user-attachments/assets/46c9aed1-03e9-4e00-8fdd-2b013907f980" />

---

## Adding Developers to developers group

The following users were added to the developers group:

- webdev1
- webdev2
- webtester


Commands used:

```bash
sudo usermod -aG developers webdev1

sudo usermod -aG developers webdev2

sudo usermod -aG developers webtester
```
## Evidence
<img width="649" height="73" alt="image" src="https://github.com/user-attachments/assets/1b5857d1-36e6-4a4f-b439-1716eaf4e752" />


Verification:

```bash
cat /etc/group
```


## Evidence

<img width="652" height="130" alt="image" src="https://github.com/user-attachments/assets/6e617673-93ae-4aef-8641-446c28e2e09f" />



# Final User and Group Structure


```text
admins

└── webadmin



developers

├── webdev1

├── webdev2

└── webtester
```


This structure provides organized access control where administrators manage the system while developers access project resources.


# Directory Permissions

Permissions were configured to ensure secure access and proper file management.


## Permission Access


### a) Administrators

**Access:** Full control over project files

**Why:**  
Administrators need full access to manage configurations, users, permissions, and system resources.


###  b) Developers

**Access:** Access to required project files

**Why:**  
Developers need permission to edit website files, scripts, and other development resources without having full system control.


### c) NGINX

**Access:** Read access to website files

**Why:**  
NGINX requires permission to read HTML, CSS, and other files to successfully display the website.


---

#  Ownership and Permissions Configuration


Appropriate ownership and permissions were applied to project directories and files to ensure secure access, collaboration, and proper NGINX operation.

# Checking Permissions


Command used:

```bash
ls -la /var/www/linux_project
```

## Evidence

<img width="646" height="185" alt="image" src="https://github.com/user-attachments/assets/f2a6a706-480d-4a0f-8b8c-af3c37c132ec" />

---


## Applying Ownership


Command used:

```bash

sudo chown -R webadmin:developers /var/www/linux_project

```

ls -la /var/www/linux_project

### Reason

- `webadmin` is the main administrator responsible for managing project files.
- The `developers` group allows multiple developers to collaborate.
- This prevents unauthorized users from modifying project resources.

## Evidence
<img width="646" height="227" alt="image" src="https://github.com/user-attachments/assets/b7c317e4-8e81-4468-be99-f7f722b00b02" />

---

## Applying Directory Permissions


Command used:

```bash
sudo chmod -R 755 /var/www/linux_project

```


### Reason

- The owner has full access to manage files.
- Developers can access required project resources.
- NGINX can read website files and serve the website.
- Other users have limited access to improve security.



---

## Applying Website File Permissions


Command used:

```bash
sudo chmod 644 /var/www/linux_project/html/*
```


### Reason

- Website files only require read access for NGINX.
- Prevents unauthorized modification of website content.
- Allows secure hosting of HTML and CSS files.



---

## Verifying Permissions


Command used:

```bash
ls -la /var/www/linux_project
```


### Importance
Permission verification was performed to confirm:

- Correct ownership
- Correct group assignment
- Correct access permissions

This ensures the Linux environment is properly configured before deploying the website.

## Evidence

<img width="659" height="206" alt="image" src="https://github.com/user-attachments/assets/20513e6a-9017-4808-a5d6-f5bc9d8416c2" />

# Milestone 1 Summary

| Task                     | Status      |
| ------------------------ | ----------- |
| Linux workspace created  | Completed |
| Users created            | Completed |
| Groups created           | Completed |
| Users assigned to groups | Completed |
| Permissions configured   | Completed |

