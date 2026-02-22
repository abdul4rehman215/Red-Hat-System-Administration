# 🛠 Troubleshooting Guide – Lab 06: Managing Users and Groups in RHEL

---

# 🔎 1️⃣ "user already exists" Error

## Problem

```bash
useradd: user 'labuser1' already exists
````

## Cause

The user account already exists in `/etc/passwd`.

## Solution

Verify user:

```bash
id labuser1
```

If user must be recreated:

```bash
sudo userdel -r labuser1
```

Then re-run:

```bash
sudo useradd -m -s /bin/bash labuser1
```

---

# 🔎 2️⃣ Permission Denied Errors

## Problem

```bash
useradd: Permission denied
```

## Cause

Insufficient privileges.

## Solution

Prepend command with `sudo`:

```bash
sudo useradd username
```

Verify sudo access:

```bash
sudo -v
```

---

# 🔎 3️⃣ User Not Added to Group

## Problem

After running:

```bash
sudo usermod -G labgroup labuser1
```

User loses previous group memberships.

## Cause

Missing `-a` flag.

## Correct Command

```bash
sudo usermod -aG labgroup labuser1
```

Always use `-a` when modifying supplementary groups.

---

# 🔎 4️⃣ Group Not Found

## Problem

```bash
usermod: group 'labgroup' does not exist
```

## Solution

Verify group:

```bash
getent group labgroup
```

If missing, create it:

```bash
sudo groupadd labgroup
```

---

# 🔎 5️⃣ chage Command Not Found

## Problem

```bash
chage: command not found
```

## Solution

Install required package:

```bash
sudo dnf install shadow-utils -y
```

---

# 🔎 6️⃣ Password Aging Not Applied

## Problem

Policy set but not reflected.

## Check Policy

```bash
sudo chage -l username
```

Ensure correct syntax used:

```bash
sudo chage -M 90 -m 7 -W 14 username
```

---

# 🔎 7️⃣ Cannot Delete User

## Problem

```bash
userdel: user username is currently logged in
```

## Solution

Check active sessions:

```bash
who
```

Terminate session:

```bash
sudo pkill -u username
```

Then delete:

```bash
sudo userdel -r username
```

---

# 🔎 8️⃣ Group Cannot Be Deleted

## Problem

```bash
groupdel: cannot remove the primary group of user
```

## Cause

Group is primary group for a user.

## Solution

Change user's primary group first:

```bash
sudo usermod -g newgroup username
```

Then delete group:

```bash
sudo groupdel labgroup
```

---

# 🔎 9️⃣ Home Directory Not Removed

## Problem

User deleted but home directory remains.

## Solution

Ensure `-r` flag used:

```bash
sudo userdel -r username
```

If directory still exists:

```bash
sudo rm -rf /home/username
```

---

# 🔎 🔟 Verifying System Integrity After Cleanup

After deletion, verify:

```bash
cut -d: -f1 /etc/passwd | grep labuser
```

Verify groups:

```bash
getent group labgroup
```

No output confirms successful cleanup.

---

# 📌 Best Practices Learned

✔ Always verify user existence before creation
✔ Use `-aG` when modifying supplementary groups
✔ Configure password aging policies in enterprise systems
✔ Remove users immediately when no longer needed
✔ Audit `/etc/passwd` and `/etc/group` regularly
✔ Avoid leaving orphaned home directories

---

# 🔐 Security Perspective

User mismanagement is a major risk in enterprise environments:

* Privilege escalation
* Orphaned accounts
* Unauthorized access
* Compliance violations
* Insider threats

Proper user lifecycle control is essential for system hardening.

---

# 💼 Enterprise Insight

In production systems:

* Accounts are often managed centrally (LDAP/AD)
* Password policies enforced via PAM
* User provisioning automated
* Deprovisioning must be immediate upon termination

Understanding manual user management builds the foundation for enterprise identity systems.

---
