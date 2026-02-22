# 🎤 Interview Q&A – Lab 07: Controlling File Permissions and Ownership in RHEL

---

## 1️⃣ How do you interpret the output of `ls -l`?

Example:

```bash
-rwxr-xr-x. 1 student wheel 0 Feb 22 13:10 file1.txt
````

Breakdown:

* `-` → Regular file (d = directory)
* `rwx` → Owner permissions
* `r-x` → Group permissions
* `r-x` → Others permissions
* `student` → Owner
* `wheel` → Group
* `.` → SELinux context indicator

---

## 2️⃣ What do the permission values 755 and 644 mean?

| Value | Meaning                             |
| ----- | ----------------------------------- |
| 755   | Owner: rwx, Group: r-x, Others: r-x |
| 644   | Owner: rw-, Group: r--, Others: r-- |
| 600   | Owner: rw-, Group/Others: none      |
| 700   | Owner: rwx, Group/Others: none      |

Calculation:

* r = 4
* w = 2
* x = 1

Example:

```bash
chmod 755 file.txt
```

---

## 3️⃣ What is the difference between symbolic and numeric chmod?

**Symbolic:**

```bash
chmod u+x file.txt
```

Uses letters (u, g, o, a).

**Numeric:**

```bash
chmod 755 file.txt
```

Uses octal numbers.

---

## 4️⃣ What is the difference between `chown` and `chgrp`?

* `chown` → Changes file owner (and optionally group)
* `chgrp` → Changes group ownership only

Example:

```bash
sudo chown user:group file.txt
sudo chgrp wheel file.txt
```

---

## 5️⃣ What is SUID and why is it used?

SUID (Set User ID):

* Allows a file to execute with the file owner's privileges.
* Common example: `/usr/bin/passwd`

Indicator:

```bash
-rwsr-xr-x
```

Security risk: Improper SUID configuration can lead to privilege escalation.

---

## 6️⃣ What is SGID?

SGID (Set Group ID):

* When applied to directories, new files inherit the directory's group.
* Useful for shared group collaboration.

Indicator:

```bash
drwxr-sr-x
```

---

## 7️⃣ What is the sticky bit?

Sticky bit:

* Prevents users from deleting files they do not own.
* Commonly used on `/tmp`.

Indicator:

```bash
drwxrwxrwt
```

---

## 8️⃣ What is the difference between DAC and MAC?

* **DAC (Discretionary Access Control)** → Traditional Linux permissions (rwx).
* **MAC (Mandatory Access Control)** → SELinux enforcement.

DAC controls file permissions.
SELinux adds additional policy-based restrictions.

---

## 9️⃣ How do you view SELinux context?

```bash
ls -Z filename
```

Example:

```bash
-rw-------. student wheel unconfined_u:object_r:user_home_t:s0 file1.txt
```

Format:

```
user:role:type:level
```

---

## 🔟 How do you change SELinux context?

Temporary change:

```bash
sudo chcon -t httpd_sys_content_t file.txt
```

Restore default:

```bash
sudo restorecon -v file.txt
```

---

## 1️⃣1️⃣ What causes "Permission Denied" even when permissions look correct?

Possible reasons:

* SELinux blocking access
* Incorrect ownership
* File system mounted read-only
* Missing execute permission on directory

Check:

```bash
ls -l
ls -Z
```

---

## 1️⃣2️⃣ What are the risks of using chmod 777?

`777` gives full access to everyone.

Risks:

* Data tampering
* Unauthorized modification
* Security vulnerabilities
* Privilege abuse

Never use 777 in production environments.

---

## 1️⃣3️⃣ Why is proper permission management critical in containers?

Containers rely heavily on:

* File ownership
* UID/GID mapping
* SELinux labels
* Volume mount permissions

Incorrect permissions can:

* Break container startup
* Cause application crashes
* Expose sensitive data

---

## 1️⃣4️⃣ How do you recursively change permissions?

```bash
chmod -R 755 directory/
```

Or ownership:

```bash
sudo chown -R user:group directory/
```

---

## 1️⃣5️⃣ How can you find all SUID files on a system?

```bash
find / -perm -4000 -type f 2>/dev/null
```

Security auditing practice.

---

# ✅ Interview Readiness Summary

This lab demonstrates:

✔ Understanding Linux permission model
✔ Ownership control mechanisms
✔ Special permission bits configuration
✔ SELinux security labeling
✔ Secure file management practices

These skills are essential for:

* RHCSA certification
* Linux server hardening
* DevOps roles
* Container security
* Enterprise system administration

