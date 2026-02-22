# 🛠 Troubleshooting Guide – Lab 30: journalctl Log Analysis

---

# 1️⃣ journalctl Shows No Logs

## 🔎 Problem
Running:
```bash
journalctl
```
returns very few or no logs.

## 🎯 Possible Causes
- Journald not running
- Logs stored in volatile memory
- Permissions issue

## ✅ Resolution

Check journald status:
```bash
sudo systemctl status systemd-journald
```

Enable persistent logging:
```bash
sudo mkdir -p /var/log/journal
sudo systemctl restart systemd-journald
```

---

# 2️⃣ Logs Missing After Reboot

## 🔎 Problem
Previous logs are gone after system restart.

## 🎯 Cause
Persistent logging not enabled.

## ✅ Fix

Edit config:
```bash
sudo nano /etc/systemd/journald.conf
```

Set:
```
Storage=persistent
```

Restart service:
```bash
sudo systemctl restart systemd-journald
```

---

# 3️⃣ journalctl is Slow

## 🔎 Problem
Command takes too long to respond.

## 🎯 Cause
Large log database.

## ✅ Solution

Limit time range:
```bash
journalctl --since "1 day ago"
```

Disable pager:
```bash
journalctl --no-pager
```

Vacuum logs:
```bash
sudo journalctl --vacuum-size=200M
```

---

# 4️⃣ Cannot Find Logs for Specific Service

## 🔎 Problem
```bash
journalctl -u service_name
```
returns nothing.

## 🎯 Cause
Incorrect unit name.

## ✅ Resolution

Verify correct unit:
```bash
systemctl list-units --type=service
```

Then:
```bash
journalctl -u correct_service_name
```

---

# 5️⃣ Permission Denied Errors

## 🔎 Problem
Non-root user cannot access logs.

## 🎯 Cause
Insufficient privileges.

## ✅ Resolution

Use sudo:
```bash
sudo journalctl
```

Or add user to systemd-journal group:
```bash
sudo usermod -aG systemd-journal username
```

---

# 6️⃣ Need More Detailed Logs

## 🔎 Problem
Logs not detailed enough for debugging.

## 🎯 Cause
Service logging level too low.

## ✅ Resolution

Filter debug logs:
```bash
journalctl -p debug
```

Or modify service configuration to enable debug logging.

---

# 7️⃣ Service Fails But No Clear Error

## 🔎 Investigation Steps

1️⃣ Check service status:
```bash
systemctl status service_name
```

2️⃣ Check logs for current boot:
```bash
journalctl -u service_name -b
```

3️⃣ Filter errors:
```bash
journalctl -u service_name -p err
```

---

# 8️⃣ Journal Disk Usage Too High

## 🔎 Problem
Journal consumes excessive disk space.

## ✅ Solutions

Check usage:
```bash
journalctl --disk-usage
```

Limit by size:
```bash
sudo journalctl --vacuum-size=100M
```

Limit by time:
```bash
sudo journalctl --vacuum-time=7d
```

---

# 9️⃣ Need Structured Logs for SIEM

## 🔎 Requirement
Export logs for parsing.

## ✅ Use JSON output:
```bash
journalctl -o json
```

Or:
```bash
journalctl -o json-pretty
```

Pipe to jq:
```bash
journalctl -o json | jq .
```

---

# 🔟 Boot Investigation Scenario

## 🔎 Scenario
System crashed overnight.

## Investigation Workflow

```bash
journalctl --list-boots
journalctl -b -1
journalctl -b -1 -p err
```

Focus on:
- Kernel errors
- Service failures
- OOM killer messages

---

# 📌 Best Practices

✔ Enable persistent journaling  
✔ Limit log retention in production  
✔ Use time filters for performance  
✔ Combine unit + priority filters  
✔ Export JSON for automation  
✔ Regularly monitor disk usage  

---

# 🛡 Security Relevance

journalctl is essential for:

- Incident response
- SSH login auditing
- Privilege escalation detection
- Service compromise investigation
- Kernel-level anomaly detection

---
