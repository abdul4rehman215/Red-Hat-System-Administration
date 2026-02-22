# 🛠 Troubleshooting Guide – Lab 31: Log Rotation with logrotate

---

# 1️⃣ Logs Are Not Rotating Automatically

## 🔎 Problem
Logs are growing but not rotating daily.

## 🎯 Possible Causes
- Cron not running
- logrotate cron job missing
- Incorrect configuration file

## ✅ Resolution

Check cron job:
```bash
ls /etc/cron.daily/logrotate
```

Verify cron service:
```bash
sudo systemctl status crond
```

Test manually:
```bash
sudo logrotate --debug /etc/logrotate.d/mycustomlogs
```

---

# 2️⃣ Syntax Error in Configuration

## 🔎 Problem
logrotate fails silently or throws errors.

## 🎯 Cause
Invalid configuration block.

## ✅ Resolution

Run debug mode:
```bash
sudo logrotate --debug /etc/logrotate.d/mycustomlogs
```

Check:
- Missing `}`
- Incorrect indentation
- Misspelled directives

---

# 3️⃣ Permission Denied Errors

## 🔎 Problem
Rotation fails with permission errors.

## 🎯 Cause
Incorrect ownership or permissions on log file.

## ✅ Resolution

Check file:
```bash
ls -ld /var/log/messages
```

Fix ownership:
```bash
sudo chown root:root /var/log/messages
```

Fix permissions:
```bash
sudo chmod 640 /var/log/messages
```

---

# 4️⃣ Unknown Group 'adm' Error

## 🔎 Problem
Configuration uses group `adm`, but group does not exist.

## 🎯 Cause
Distribution difference (CentOS vs Ubuntu).

## ✅ Resolution

Replace:
```
create 0640 root adm
```

With:
```
create 0640 root root
```

---

# 5️⃣ postrotate Script Fails

## 🔎 Problem
Service does not restart after rotation.

## 🎯 Cause
Incorrect path or command in postrotate block.

## ✅ Resolution

Verify systemctl path:
```bash
which systemctl
```

Use absolute path:
```
/usr/bin/systemctl restart rsyslog
```

Test manually:
```bash
sudo systemctl restart rsyslog
```

---

# 6️⃣ Log File Keeps Growing After Rotation

## 🔎 Problem
Application continues writing to old log.

## 🎯 Cause
Service not reloaded after rotation.

## ✅ Resolution

Ensure postrotate block includes service reload:
```bash
postrotate
    /usr/bin/systemctl restart rsyslog >/dev/null 2>&1 || true
endscript
```

---

# 7️⃣ Rotation Count Not Increasing

## 🔎 Problem
Old logs not rotating to .2.gz, .3.gz etc.

## 🎯 Cause
Status file not updating.

## ✅ Resolution

Check status file:
```bash
sudo cat /var/lib/logrotate/logrotate.status
```

Force update:
```bash
sudo logrotate --force config_file
```

---

# 8️⃣ Disk Still Filling Up

## 🔎 Investigation Steps

1️⃣ Check largest logs:
```bash
sudo du -sh /var/log/*
```

2️⃣ Verify rotation settings:
```bash
sudo cat /etc/logrotate.d/mycustomlogs
```

3️⃣ Increase compression:
```
compress
```

4️⃣ Reduce retention:
```
rotate 3
```

---

# 9️⃣ Cron Runs but No Rotation Occurs

## 🔎 Cause
Rotation frequency not met.

Example:
```
weekly
```
Means it rotates once per week.

## ✅ Resolution

Temporarily test:
```bash
sudo logrotate --force config_file
```

---

# 🔟 Validate Configuration Before Production

Always run:
```bash
sudo logrotate --debug /etc/logrotate.d/mycustomlogs
```

Before deploying to production.

---

# 📌 Best Practices

✔ Always test config with `--debug`  
✔ Use absolute paths in postrotate  
✔ Monitor disk usage regularly  
✔ Set appropriate rotation count  
✔ Enable compression  
✔ Validate cron execution  

---

# 🛡 Security Relevance

Proper log rotation helps:

- Prevent denial-of-service due to disk exhaustion
- Preserve historical logs for forensic analysis
- Maintain compliance with retention policies
- Protect against log tampering through rotation control

---
