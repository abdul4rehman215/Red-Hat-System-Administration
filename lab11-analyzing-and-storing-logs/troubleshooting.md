# 🛠 Troubleshooting Guide - Lab 11: Analyzing and Storing Logs

---

# 🔎 Common Issues and Fixes

---

## 1️⃣ journalctl Shows No Logs

### Problem
Running:

```bash
sudo journalctl
````

Returns very few logs or only current boot logs.

### Cause

Persistent journal storage may not be enabled.

### Solution

Edit journald configuration:

```bash
sudo nano /etc/systemd/journald.conf
```

Set:

```
Storage=persistent
```

Create journal directory if missing:

```bash
sudo mkdir -p /var/log/journal
sudo systemctl restart systemd-journald
```

---

## 2️⃣ Permission Denied When Reading Logs

### Problem

```bash
cat /var/log/secure
Permission denied
```

### Solution

Use sudo:

```bash
sudo cat /var/log/secure
```

Or add user to adm/systemd-journal group (if appropriate).

---

## 3️⃣ logrotate Not Rotating Logs

### Problem

Log file is not rotating as expected.

### Possible Causes

* Log file does not exist
* File is empty
* Incorrect configuration syntax

### Debug Command

```bash
sudo logrotate -d /etc/logrotate.d/mylogs
```

### Force Rotation

```bash
sudo logrotate -f /etc/logrotate.d/mylogs
```

---

## 4️⃣ journalctl Disk Usage Too Large

### Check Usage

```bash
sudo journalctl --disk-usage
```

### Reduce Journal Size

Edit:

```bash
sudo nano /etc/systemd/journald.conf
```

Set limits:

```
SystemMaxUse=200M
SystemKeepFree=100M
```

Restart service:

```bash
sudo systemctl restart systemd-journald
```

---

## 5️⃣ grep Not Finding Expected Results

### Possible Causes

* Case sensitivity
* Wrong file
* Logs rotated to older file

### Fix

Use case-insensitive search:

```bash
sudo grep -i "failed" /var/log/secure
```

Search rotated logs:

```bash
sudo zgrep "Failed" /var/log/secure-*.gz
```

---

## 6️⃣ awk Not Extracting Correct Fields

Log format may vary.

Verify fields first:

```bash
sudo head -1 /var/log/secure
```

Then adjust field number in awk.

Example:

```bash
sudo awk '{print $11}' /var/log/secure
```

---

## 7️⃣ Podman Logs Not Showing Output

### Possible Causes

* Container stopped
* Wrong container ID

Check running containers:

```bash
podman ps
```

Check all containers:

```bash
podman ps -a
```

Inspect container logs:

```bash
podman logs <container_id>
```

---

# 🔐 Security Considerations

* Never expose logs publicly
* Secure /var/log permissions
* Rotate logs to prevent disk exhaustion
* Monitor failed login attempts
* Implement centralized logging for production systems

---

# 🧹 Cleanup Steps

Remove test logrotate configuration:

```bash
sudo rm -f /etc/logrotate.d/mylogs
```

---

# ✅ Final Verification Checklist

✔ Can read system logs
✔ Can filter logs by service
✔ Can filter logs by time
✔ Can configure logrotate
✔ Can parse logs using grep/awk
✔ Can inspect container logs

---

🎯 Lab 11 Troubleshooting Complete
