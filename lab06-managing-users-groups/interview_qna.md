# 🎤 Interview Q&A – Lab 06: Managing Users and Groups in RHEL

---

## 1️⃣ What command is used to create a new user in Linux?

**Answer:**

```bash
sudo useradd username
````

To create with home directory and specific shell:

```bash
sudo useradd -m -s /bin/bash username
```

---

## 2️⃣ What files store user account information?

**Answer:**

| File         | Purpose              |
| ------------ | -------------------- |
| /etc/passwd  | User account details |
| /etc/shadow  | Encrypted passwords  |
| /etc/group   | Group information    |
| /etc/gshadow | Group password info  |

---

## 3️⃣ What is the difference between primary and supplementary groups?

**Answer:**

* **Primary group** → Assigned at user creation (stored in `/etc/passwd`)
* **Supplementary groups** → Additional groups (stored in `/etc/group`)

Use:

```bash
groups username
```

to verify.

---

## 4️⃣ How do you add a user to an existing group?

**Answer:**

```bash
sudo usermod -aG groupname username
```

`-a` is critical — it appends without removing existing groups.

---

## 5️⃣ What happens if you forget `-a` when using `usermod -G`?

**Answer:**

The user’s existing supplementary groups will be overwritten.

Example:

```bash
sudo usermod -G groupname username
```

This replaces all supplementary groups.

---

## 6️⃣ How do you change a user’s login shell?

**Answer:**

```bash
sudo usermod -s /bin/zsh username
```

---

## 7️⃣ What command is used to configure password expiration policies?

**Answer:**

```bash
sudo chage username
```

Or specific values:

```bash
sudo chage -M 90 -m 7 -W 14 username
```

---

## 8️⃣ What do the chage flags mean?

| Flag | Meaning                        |
| ---- | ------------------------------ |
| -M   | Maximum password age           |
| -m   | Minimum days between changes   |
| -W   | Warning days before expiration |

---

## 9️⃣ How do you delete a user and remove their home directory?

**Answer:**

```bash
sudo userdel -r username
```

---

## 🔟 How do you safely verify if a user exists?

**Answer:**

```bash
id username
```

If user does not exist:

```text
id: ‘username’: no such user
```

---

## 1️⃣1️⃣ How do you verify group membership?

**Answer:**

```bash
groups username
```

Or:

```bash
getent group groupname
```

---

## 1️⃣2️⃣ What is the purpose of gpasswd?

**Answer:**

`gpasswd` manages group membership and administrators.

Example:

```bash
sudo gpasswd -A username groupname
```

Sets group administrator.

---

## 1️⃣3️⃣ Why is user management important in enterprise systems?

**Answer:**

Improper user management can cause:

* Privilege escalation
* Unauthorized access
* Insider threats
* Compliance violations
* Data breaches

User lifecycle control is critical in secure environments.

---

## 1️⃣4️⃣ What command lists all system users?

**Answer:**

```bash
cut -d: -f1 /etc/passwd
```

---

## 1️⃣5️⃣ What is the security significance of password aging?

**Answer:**

Password aging:

* Reduces risk of credential compromise
* Forces periodic password rotation
* Supports compliance standards (CIS, ISO 27001)
* Enforces proactive security hygiene

---

# ✅ Interview Readiness Summary

This lab demonstrates:

✔ Account lifecycle management
✔ Group access control
✔ Password policy enforcement
✔ Enterprise Linux administration skills
✔ Security-focused system configuration

These skills are fundamental for:

* RHCSA / RHCE
* Linux System Administrator roles
* DevOps Engineering
* Cloud Infrastructure Security
* Enterprise IT Operations
