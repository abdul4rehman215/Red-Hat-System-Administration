# 🛠 Troubleshooting Guide – Lab 07: Controlling File Permissions and Ownership

---

# 🔎 1️⃣ Permission Denied Error

## Problem

```bash
Permission denied
````

Even though permissions appear correct.

## Checklist

1. Verify file permissions:

```bash
ls -l filename
```

2. Verify directory permissions:

```bash
ls -ld directory
```

⚠️ You must have execute (`x`) permission on directories to access files inside.

3. Check SELinux context:

```bash
ls -Z filename
```

4. Check ownership:

```bash
id
```

---

# 🔎 2️⃣ chmod Not Working as Expected

## Problem

Permissions remain unchanged.

## Possible Causes

* Not owner of file
* Missing sudo privileges
* File system mounted read-only

## Solution

```bash
sudo chmod 755 filename
```

Check mount status:

```bash
mount | grep ' / '
```

---

# 🔎 3️⃣ chown Fails with “Operation not permitted”

## Problem

```bash
chown: changing ownership of 'file': Operation not permitted
```

## Cause

Only root can change file ownership.

## Solution

```bash
sudo chown user:group file
```

---

# 🔎 4️⃣ Special Bits Not Showing

## Problem

SUID/SGID/sticky bit not visible.

## Solution

Use:

```bash
ls -l
```

Look for:

* `s` → SUID or SGID
* `t` → Sticky bit

Example:

```bash
-rwsr-xr-x
drwxr-sr-x
drwxrwxrwt
```

---

# 🔎 5️⃣ Sticky Bit Not Preventing Deletion

## Cause

Sticky bit works only on directories.

Verify:

```bash
ls -ld /tmp
```

Ensure output shows:

```text
drwxrwxrwt
```

---

# 🔎 6️⃣ SELinux Blocking Access

## Symptoms

* Application cannot read/write file
* Permission denied despite correct chmod

## Diagnosis

```bash
getenforce
```

If enforcing:

```bash
ls -Z filename
```

Check context type.

## Temporary Test (not for production):

```bash
sudo setenforce 0
```

If issue resolves → SELinux context problem.

Restore enforcement:

```bash
sudo setenforce 1
```

---

# 🔎 7️⃣ chcon Changes Reverted

## Cause

`restorecon` resets context to default.

Permanent context changes require `semanage`.

Example:

```bash
sudo semanage fcontext -a -t httpd_sys_content_t '/var/www/html(/.*)?'
sudo restorecon -Rv /var/www/html
```

---

# 🔎 8️⃣ Numeric Permissions Miscalculated

## Problem

Wrong permission after numeric chmod.

## Reminder

| Permission | Value |
| ---------- | ----- |
| r          | 4     |
| w          | 2     |
| x          | 1     |

Example:

7 = 4+2+1 = rwx
5 = 4+0+1 = r-x
6 = 4+2+0 = rw-

---

# 🔎 9️⃣ Cannot Access File After Ownership Change

## Cause

Group mismatch or user not part of group.

Verify group membership:

```bash
groups
```

Add user to group:

```bash
sudo usermod -aG groupname username
```

---

# 🔎 🔟 Finding Risky Permission Configurations

## Detect world-writable files:

```bash
find / -type f -perm -002 2>/dev/null
```

## Detect SUID files:

```bash
find / -type f -perm -4000 2>/dev/null
```

Security auditing best practice.

---

# 📌 Best Practices Learned

✔ Avoid using `777` permissions
✔ Use least privilege principle
✔ Audit SUID/SGID regularly
✔ Validate directory permissions
✔ Check SELinux contexts when troubleshooting
✔ Use recursive flags carefully (`-R`)

---

# 🔐 Security Perspective

Improper permissions can lead to:

* Privilege escalation
* Data leaks
* Container breakout risks
* Compliance violations
* Multi-user system compromise

Linux permission management is foundational to secure infrastructure.

---

# 💼 Enterprise Insight

In enterprise environments:

* File permissions are tightly controlled
* Shared directories use SGID
* Temporary directories use sticky bit
* SELinux policies are enforced
* Automated audits monitor world-writable files

Understanding both DAC and SELinux ensures layered security.

---
