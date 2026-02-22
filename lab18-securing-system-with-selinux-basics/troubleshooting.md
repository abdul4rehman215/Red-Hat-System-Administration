# 🛠 Troubleshooting Guide – Lab 18: Securing the System with SELinux Basics

---

# 🔎 1️⃣ SELinux Appears to Block Application Access

## 🔹 Symptom
- Web server returns **403 Forbidden**
- File permissions (chmod/chown) are correct
- Service is running

## 🔹 Diagnosis Steps

### Step 1: Check SELinux Mode
```bash
getenforce
````

If Enforcing → continue investigation.

---

### Step 2: Check File Context

```bash
ls -Z /path/to/file
```

Incorrect example:

```
unconfined_u:object_r:user_home_t:s0
```

Correct for httpd:

```
unconfined_u:object_r:httpd_sys_content_t:s0
```

---

### Step 3: Check AVC Denials

```bash
ausearch -m avc -ts recent
```

Look for:

* scontext (source)
* tcontext (target)
* denied permission

---

### Step 4: Use Human-Readable Output

```bash
sealert -a /var/log/audit/audit.log
```

---

## 🔹 Fix (Temporary)

```bash
chcon -t httpd_sys_content_t filename
```

⚠ Temporary fix (lost on relabel).

---

## 🔹 Fix (Persistent – Recommended)

```bash
semanage fcontext -a -t httpd_sys_content_t "/web(/.*)?"
restorecon -Rv /web
```

✔ Correct long-term solution.

---

# 🔎 2️⃣ Context Resets After Reboot

## 🔹 Cause

Used `chcon` instead of `semanage`.

## 🔹 Solution

Use:

```bash
semanage fcontext -a -t TYPE "/path(/.*)?"
restorecon -Rv /path
```

---

# 🔎 3️⃣ How to Verify SELinux Is the Problem

Temporarily switch to permissive:

```bash
sudo setenforce 0
```

If problem disappears → SELinux policy issue confirmed.

Re-enable:

```bash
sudo setenforce 1
```

⚠ Never leave permissive in production.

---

# 🔎 4️⃣ Service Fails to Start Due to SELinux

## 🔹 Check Journal Logs

```bash
journalctl -xe
```

## 🔹 Check SELinux Errors Only

```bash
journalctl -t setroubleshoot
```

## 🔹 Check AVC Logs

```bash
ausearch -m avc -ts recent
```

---

# 🔎 5️⃣ Incorrect Port Blocking Service

If httpd running on non-standard port:

Check allowed ports:

```bash
semanage port -l | grep http
```

Allow new port:

```bash
semanage port -a -t http_port_t -p tcp 8080
```

---

# 🔎 6️⃣ Full System Relabel Required

If multiple labeling issues:

```bash
touch /.autorelabel
reboot
```

✔ Forces complete SELinux relabel on reboot.

---

# 🔎 7️⃣ Switching Modes Safely

Check current:

```bash
sestatus
```

Temporary:

```bash
setenforce 0
setenforce 1
```

Permanent:
Edit:

```
/etc/selinux/config
```

Set:

```
SELINUX=enforcing
```

Reboot required.

---

# 🔎 8️⃣ Useful Diagnostic Commands Summary

| Purpose         | Command             |
| --------------- | ------------------- |
| Check mode      | `getenforce`        |
| Check status    | `sestatus`          |
| View context    | `ls -Z`             |
| Restore default | `restorecon -v`     |
| Persistent rule | `semanage fcontext` |
| Search AVC logs | `ausearch -m avc`   |
| Human analysis  | `sealert -a`        |

---

# 🧠 Enterprise Troubleshooting Flow

1️⃣ Confirm service running
2️⃣ Check Linux permissions
3️⃣ Verify SELinux mode
4️⃣ Inspect file context
5️⃣ Review AVC logs
6️⃣ Apply persistent fix
7️⃣ Re-test

---

# 🎯 Final Validation Checklist

✔ Service running
✔ Correct file context
✔ No recent AVC denials
✔ SELinux in enforcing mode
✔ Application accessible

---

# 🚀 Why Proper Troubleshooting Matters

* Prevents disabling SELinux unnecessarily
* Maintains production security posture
* Avoids policy misconfigurations
* Ensures controlled and auditable fixes

---
