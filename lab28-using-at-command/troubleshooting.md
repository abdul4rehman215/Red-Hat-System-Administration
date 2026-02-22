# 🛠 Troubleshooting Guide – Lab 28: Using `at` Command

---

## Issue 1️⃣: `at: command not found`

### 🔎 Problem
Running:
```bash
at now + 5 minutes
```
returns:
```
command not found
```

### 🎯 Cause
The `at` package is not installed.

### ✅ Resolution
Install the package:

```bash
sudo yum install at -y
```

Verify installation:
```bash
at -V
```

---

## Issue 2️⃣: `atd` Service Not Running

### 🔎 Problem
Jobs are scheduled but never executed.

### 🎯 Cause
`atd` daemon is not active.

### ✅ Resolution

Check status:
```bash
systemctl status atd
```

Start service:
```bash
sudo systemctl start atd
```

Enable at boot:
```bash
sudo systemctl enable atd
```

---

## Issue 3️⃣: Script Works Manually but Fails in `at`

### 🔎 Problem
Script executes correctly in terminal but not when scheduled.

### 🎯 Cause
`at` runs in a limited environment.

### ✅ Resolution

Use absolute paths inside script:

Incorrect:
```bash
tar -czf backup.tar.gz ~/Documents
```

Correct:
```bash
/usr/bin/tar -czf /home/centos/backups/backup.tar.gz /home/centos/Documents
```

---

## Issue 4️⃣: Permission Denied

### 🔎 Problem
Scheduled job fails due to permissions.

### 🎯 Cause
Script not executable.

### ✅ Resolution
```bash
chmod +x ~/backup_script.sh
```

---

## Issue 5️⃣: Incorrect Time Execution

### 🔎 Problem
Job runs at unexpected time.

### 🎯 Cause
System time misconfigured.

### ✅ Resolution

Check system time:
```bash
timedatectl
```

Adjust timezone if needed:
```bash
sudo timedatectl set-timezone UTC
```

---

## Issue 6️⃣: Job Not Listed in `atq`

### 🔎 Problem
Scheduled job does not appear.

### 🎯 Cause
User lacks permission or job already executed.

### ✅ Resolution
Verify user:
```bash
whoami
```

Check if job already ran:
```bash
ls ~/backups
```

---

## Issue 7️⃣: User Not Allowed to Use `at`

### 🔎 Problem
Permission error when running `at`.

### 🎯 Cause
User restricted via `/etc/at.allow` or `/etc/at.deny`.

### ✅ Resolution

Check:
```bash
cat /etc/at.allow
cat /etc/at.deny
```

Add user if necessary.

---

## Issue 8️⃣: Job File Not Visible

### 🔎 Problem
Cannot see job files in `/var/spool/at`.

### 🎯 Cause
Requires elevated privileges.

### ✅ Resolution
```bash
sudo ls /var/spool/at
```

---

# 📌 Best Practices for Using `at`

✔ Always verify `atd` service  
✔ Use absolute paths  
✔ Log output to files  
✔ Check time synchronization  
✔ Remove unused jobs  
✔ Restrict user access where required  

---
