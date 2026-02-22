# 🛠 Troubleshooting Guide – Lab 29: Systemd Timers

---

# 1️⃣ Timer Not Triggering

## 🔎 Problem
Timer is enabled but service never runs.

## 🎯 Possible Causes
- systemd daemon not reloaded
- Incorrect `OnCalendar` syntax
- Timer not enabled properly

## ✅ Resolution

Reload daemon:
```bash
sudo systemctl daemon-reload
```

Verify timer:
```bash
systemctl list-timers
```

Validate calendar:
```bash
systemd-analyze calendar "hourly"
```

---

# 2️⃣ Service Fails When Triggered

## 🔎 Problem
Timer runs but service fails.

## 🎯 Cause
- Incorrect `ExecStart` path
- Permission issues
- Syntax errors in service file

## ✅ Resolution

Check service status:
```bash
systemctl status maintenance.service
```

View logs:
```bash
journalctl -u maintenance.service
```

Ensure absolute paths are used in `ExecStart`.

---

# 3️⃣ Timer Not Enabled at Boot

## 🔎 Problem
Timer stops working after reboot.

## 🎯 Cause
Timer was started but not enabled.

## ✅ Resolution

Enable properly:
```bash
sudo systemctl enable maintenance.timer
```

Verify:
```bash
systemctl is-enabled maintenance.timer
```

---

# 4️⃣ Calendar Expression Not Working

## 🔎 Problem
Unexpected execution time.

## 🎯 Cause
Incorrect calendar syntax.

## ✅ Resolution

Test expression:
```bash
systemd-analyze calendar "Mon *-*-* 02:00:00"
```

Use:
```bash
systemd-analyze calendar --iterations=5 "hourly"
```

---

# 5️⃣ RandomizedDelaySec Not Applying

## 🔎 Problem
Timer executes exactly on the hour.

## 🎯 Cause
Daemon not reloaded after modification.

## ✅ Resolution

```bash
sudo systemctl daemon-reload
sudo systemctl restart maintenance.timer
```

---

# 6️⃣ Service Runs Manually but Not via Timer

## 🔎 Problem
Manual execution works:
```bash
sudo systemctl start maintenance.service
```
But timer execution fails.

## 🎯 Cause
Environment differences.

## ✅ Resolution

Use absolute paths in service file:
```ini
ExecStart=/usr/bin/bash -c '/usr/bin/echo ...'
```

Avoid relying on user-specific environment variables.

---

# 7️⃣ Permission Denied Writing to Log File

## 🔎 Problem
Service cannot write to `/var/log/maintenance.log`.

## 🎯 Cause
Insufficient permissions.

## ✅ Resolution

Check file ownership:
```bash
ls -l /var/log/maintenance.log
```

Adjust permissions:
```bash
sudo chmod 644 /var/log/maintenance.log
```

Or define `User=` inside service unit if needed.

---

# 8️⃣ Service Stuck in Failed State

## 🔎 Problem
`systemctl status` shows:

```
Active: failed
```

## ✅ Resolution

Reset failure state:
```bash
sudo systemctl reset-failed
```

Then restart timer.

---

# 9️⃣ Timer Not Listed

## 🔎 Problem
Timer does not appear in list.

## 🎯 Cause
File naming incorrect.

Timer must end with:
```
.timer
```

Service must end with:
```
.service
```

Reload daemon after correction.

---

# 🔟 Debug Checklist

When troubleshooting timers, always verify:

✔ `systemctl daemon-reload`  
✔ `systemctl status <timer>`  
✔ `systemctl status <service>`  
✔ `journalctl -u <service>`  
✔ Calendar syntax validation  
✔ File permissions  
✔ Absolute command paths  

---

# 📌 Best Practices

- Always use absolute paths in service files
- Validate calendar expressions before enabling
- Use `Persistent=true` for critical tasks
- Monitor logs after enabling new timers
- Add `RandomizedDelaySec` in distributed environments

---
