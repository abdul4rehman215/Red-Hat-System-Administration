# 🧪 Lab 07: Controlling File Permissions and Ownership

---

## 🎯 Objectives

By the end of this lab, I was able to:

- View and interpret Linux file permissions using `ls -l`
- Modify permissions using `chmod`
- Change ownership using `chown` and `chgrp`
- Configure special permission bits (SUID, SGID, Sticky Bit)
- Inspect and modify SELinux security contexts
- Apply secure file permission practices in Linux environments

---

## 🖥️ Lab Environment

- OS: Red Hat Enterprise Linux 9.x
- Shell: Bash
- User: `student`
- Privileges: sudo/root access required
- Security: SELinux enabled (enforcing mode)

---

## 📂 Repository Structure

```

lab07-file-permissions-ownership/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

# ✅ Task Overview

---

## 🔎 Task 1: Viewing File Permissions

- Created `file1.txt`
- Created `dir1`
- Interpreted `ls -l` output
- Viewed hidden files using `ls -la`

📌 Learned file type indicators and permission structure:
```

-rwxr-xr-x
│ │ │
│ │ └── Others
│ └──── Group
└────── Owner

```

---

## 🔐 Task 2: Modifying Permissions

### 🔹 Symbolic Mode (`chmod u+x`)
- Added execute permission
- Removed group read permission
- Set explicit permission combinations

### 🔹 Numeric Mode (`chmod 755`)
- Applied common permission sets:
  - `755`
  - `644`
  - `600`
  - `700`

📌 Understood octal permission calculation:
- r = 4
- w = 2
- x = 1

---

## 👤 Task 3: Managing Ownership

- Changed file owner to `root`
- Changed owner and group simultaneously
- Modified group ownership using `chgrp`
- Verified changes using `ls -l`

📌 Learned ownership fields in `ls -l`:
```

owner   group
student wheel

```

---

## ⚙ Task 4: Special Permission Bits

### 🔹 SUID
- Observed `/usr/bin/passwd` with SUID
- Understood execution with owner's privileges

### 🔹 SGID
- Enabled SGID on directory
- New files inherit group ownership

### 🔹 Sticky Bit
- Verified sticky bit on `/tmp`
- Prevented unauthorized file deletion

📌 Identified indicators:
- `s` → SUID / SGID
- `t` → Sticky bit

---

## 🛡 Task 5: SELinux Contexts

- Viewed security contexts using `ls -Z`
- Modified context using `chcon`
- Restored default context using `restorecon`

📌 Understood SELinux label format:
```

user:role:type:level

```

Example:
```

unconfined_u:object_r:user_home_t:s0

````

---

# 🔐 Security Relevance

Proper permission management prevents:

- Privilege escalation
- Unauthorized file access
- Accidental data exposure
- Multi-user conflicts
- Service misconfiguration

SELinux adds an additional Mandatory Access Control (MAC) layer beyond traditional UNIX permissions.

---

# 💼 Real-World Applications

These skills are critical for:

- Linux server hardening
- Container runtime security
- Web server file access configuration
- Secure shared directories
- Enterprise compliance environments
- OpenShift / Podman deployments

---

# 🏁 Conclusion

In this lab, I successfully:

✔ Interpreted Linux permission structure  
✔ Modified permissions using symbolic and numeric modes  
✔ Managed ownership and groups  
✔ Configured SUID, SGID, and sticky bit  
✔ Inspected and restored SELinux contexts  

You now understand both Discretionary Access Control (DAC) and SELinux-based access control.

---

# 🧹 Cleanup Performed

```bash
cd ~
rm -rf ~/permissions_lab
```
