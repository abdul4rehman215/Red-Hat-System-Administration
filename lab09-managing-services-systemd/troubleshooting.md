# 🛠 Lab 09 – Troubleshooting Guide: Managing Services with systemd

---

# 🔍 Issue 1: Service Fails to Start

### ❌ Error
```
Job for sshd.service failed because the control process exited with error code.
````

### ✅ Diagnosis

Check detailed logs:

```bash
sudo journalctl -xe
```

Check service-specific logs:

```bash
sudo journalctl -u sshd
```

### ✅ Possible Causes

* Configuration error in `/etc/ssh/sshd_config`
* Port already in use
* Missing dependencies

---

# 🔍 Issue 2: Service Shows “Failed” State

### ❌ Check

```bash
systemctl status sshd
```

Look for:

```
Active: failed
```

### ✅ Reset Failed State

```bash 
sudo systemctl reset-failed sshd
```

Then restart:

```bash 
sudo systemctl start sshd
```

---

# 🔍 Issue 3: Port Already in Use

### ❌ Error

```
Bind to port 22 failed: Address already in use.
```

### ✅ Check Which Process Uses Port

```bash 
sudo ss -tulpn | grep :22
```

### ✅ Kill Conflicting Process (if appropriate)

```bash 
sudo kill <PID>
```

---

# 🔍 Issue 4: Service Won’t Enable at Boot

### ❌ Check

```bash
systemctl is-enabled sshd
```

If output:

```
disabled
```

### ✅ Enable Properly

```bash 
sudo systemctl enable sshd
```

---

# 🔍 Issue 5: Service Masked Accidentally

### ❌ Error

```
Failed to start sshd.service: Unit sshd.service is masked.
```

### ✅ Unmask Service

```bash 
sudo systemctl unmask sshd
sudo systemctl start sshd
```

---

# 🔍 Issue 6: Changes to Unit File Not Applied

After modifying a unit file:

### ❌ Service not reflecting changes

### ✅ Reload systemd daemon

```bash
sudo systemctl daemon-reload
```

Then restart service:

```bash 
sudo systemctl restart sshd
```

---

# 🔍 Issue 7: Service Starts but Immediately Stops

### Diagnose

```bash 
systemctl status servicename
```

Check logs:

```bash
journalctl -u servicename -xe
```

### Possible Causes

* Incorrect ExecStart path
* Missing executable
* Permission issue

---

# 🔍 Issue 8: Boot Takes Too Long

### Analyze Boot Time

```bash 
systemd-analyze blame
```

### Improve Performance

* Disable unnecessary services:

```bash 
sudo systemctl disable servicename
```

---

# 🔍 Issue 9: Logs Not Appearing in journalctl

### Check Journal Service

```bash
systemctl status systemd-journald
```

### Restart If Needed

```bash
sudo systemctl restart systemd-journald
```

---

# 🔍 Issue 10: Permission Denied Using systemctl

### ❌ Error

```
Access denied
```

### ✅ Solution

Use sudo:

```
sudo systemctl restart sshd
```

---

# 🔍 Issue 11: Dependency Failure

### ❌ Error

```
Dependency failed for OpenSSH server daemon.
```

### ✅ Check Dependencies

```bash
systemctl list-dependencies sshd
```

Ensure required services (e.g., network.target) are active.

---

# 🔍 Issue 12: Service Not Found

### ❌ Error

```
Unit myservice.service not found.
```

### ✅ Verify Service Exists

```bash 
systemctl list-unit-files | grep myservice
```

---

# 🧠 Best Practices

* Always check logs first using `journalctl`
* Reload daemon after modifying unit files
* Avoid masking critical services
* Use `reset-failed` after troubleshooting
* Verify dependencies before restart
* Test services before enabling at boot

---

# ✅ Lab 09 Completed Successfully

✔ Checked service status
✔ Started and stopped services
✔ Restarted services
✔ Enabled and disabled services at boot
✔ Inspected unit files and dependencies
✔ Analyzed logs using journalctl
✔ Practiced masking and boot analysis

---
