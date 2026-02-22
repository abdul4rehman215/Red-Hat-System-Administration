# 🛠 Troubleshooting Guide – Lab 27: Setting Up Cron Jobs

---

## Issue 1️⃣: Cron Job Not Running

### 🔎 Problem
Scheduled job does not execute at expected time.

### 🎯 Cause
- Cron service not running
- Syntax error in crontab
- Script not executable

### ✅ Resolution

Check cron service:
```bash
systemctl status cron
```

Start if needed:
```bash
sudo systemctl start cron
```

Verify cron entries:
```bash
crontab -l
```

---

## Issue 2️⃣: Script Works Manually but Not in Cron

### 🔎 Problem
Running script directly works, but cron fails.

### 🎯 Cause
Cron uses limited environment (minimal PATH).

### ✅ Resolution
Use absolute paths inside script:

Incorrect:
```bash
tar -czf backup.tar.gz ~/
```

Correct:
```bash
/usr/bin/tar -czf /home/toor/backups/backup.tar.gz /home/toor/
```

---

## Issue 3️⃣: Permission Denied

### 🔎 Problem
Cron fails with permission error.

### 🎯 Cause
Script not executable.

### ✅ Resolution
```bash
chmod +x ~/backups/backup_home.sh
```

---

## Issue 4️⃣: Cron Not Logging Output

### 🔎 Problem
No visible output from cron job.

### 🎯 Cause
Cron does not display output to terminal.

### ✅ Resolution
Redirect output:

```bash
* * * * * ~/script.sh >> ~/cron.log 2>&1
```

---

## Issue 5️⃣: Wrong Cron Expression

### 🔎 Problem
Job runs at wrong time.

### 🎯 Cause
Incorrect cron field placement.

### ✅ Resolution
Verify format:

```
Minute Hour Day Month Weekday
```

Example:
```
0 2 * * *
```
Means 2 AM daily.

---

## Issue 6️⃣: Environment Variables Not Available

### 🔎 Problem
Script relies on variables defined in `.bashrc`.

### 🎯 Cause
Cron does not automatically load `.bashrc`.

### ✅ Resolution
Add at top of script:

```bash
source ~/.bashrc
```

Or define variables explicitly inside script.

---

## Issue 7️⃣: Cron Job Still Running After Removal

### 🔎 Problem
Unexpected behavior after `crontab -r`.

### 🎯 Cause
System-wide cron entries may exist.

### ✅ Resolution
Check:

```bash
cat /etc/crontab
ls /etc/cron.*
```

---

## Issue 8️⃣: Backup File Not Created

### 🔎 Problem
Expected backup archive missing.

### 🎯 Cause
Path issue or disk space problem.

### ✅ Resolution
Check disk usage:
```bash
df -h
```

Verify path:
```bash
ls ~/backups
```

---

# 📌 Best Practices for Cron Jobs

✔ Use absolute paths  
✔ Redirect output to logs  
✔ Keep scripts simple  
✔ Test script manually first  
✔ Monitor cron logs (`/var/log/syslog`)  
✔ Avoid storing sensitive data in scripts  

---
