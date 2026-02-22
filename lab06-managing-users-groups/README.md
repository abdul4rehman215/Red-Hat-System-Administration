# 🧪 Lab 06: Managing Users and Groups

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Create and manage local users and groups
- Modify user account attributes (shell, comment, group membership)
- Configure password aging policies
- Assign group administrators
- Remove users and groups safely

---

## 🖥️ Lab Environment

- OS: Red Hat Enterprise Linux 9.x
- Shell: Bash
- Privileges: sudo/root access required
- Tools Used:
  - useradd
  - usermod
  - userdel
  - groupadd
  - groupdel
  - gpasswd
  - chage
  - id
  - getent

---

## 📂 Repository Structure

```

lab06-managing-users-groups/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

````

---

# ✅ Task Overview

---

## 👤 Task 1: User Management

### 🔹 Creating Users

- Created user `labuser1`
- Assigned Bash shell
- Created home directory
- Set password
- Verified using `id`

### 🔹 Modifying Users

- Changed login shell to `/bin/zsh`
- Added descriptive comment
- Verified via `/etc/passwd`

📌 Learned how Linux stores user account information.

---

## 👥 Task 2: Group Management

### 🔹 Creating Groups

- Created group `labgroup`
- Added users to supplementary group
- Verified membership using `groups`

### 🔹 Group Administrators

- Assigned group administrator using `gpasswd`
- Added additional user to group
- Verified group entries using `getent`

📌 Understood primary vs supplementary groups.

---

## 🔐 Task 3: Password Policies

Configured password aging using:

- `chage -M` → Maximum password age
- `chage -m` → Minimum password age
- `chage -W` → Warning period

Verified policy with:

```bash
sudo chage -l username
````

📌 Learned enterprise password policy enforcement.

---

## 🧹 Task 4: Cleanup

* Removed users (with and without home directory)
* Removed group
* Verified cleanup via `/etc/passwd`
* Confirmed group deletion

📌 Practiced safe account lifecycle management.

---

# 🔎 Core Commands Practiced

| Command  | Purpose                  |
| -------- | ------------------------ |
| useradd  | Create user              |
| usermod  | Modify user attributes   |
| userdel  | Delete user              |
| groupadd | Create group             |
| groupdel | Delete group             |
| gpasswd  | Manage group admins      |
| chage    | Configure password aging |
| id       | Verify user info         |
| getent   | Query system database    |

---

# 💼 Real-World Relevance

User and group management is critical for:

* Enterprise Linux administration
* Server hardening
* Security compliance (CIS benchmarks)
* Identity management
* Access control enforcement
* Cloud VM administration
* Container host security

Improper user management is a major security risk in production systems.

---

# 🔐 Security Insight

Misconfigured user permissions can lead to:

* Privilege escalation
* Unauthorized access
* Lateral movement in networks
* Compliance violations

Understanding `/etc/passwd`, `/etc/shadow`, and `/etc/group` is essential for secure administration.

---

# 🏁 Conclusion

In this lab, I successfully:

✔ Created and modified users
✔ Managed group memberships
✔ Assigned group administrators
✔ Configured password aging policies
✔ Removed users and groups cleanly

I now understand the Linux account lifecycle from creation to removal.

---
