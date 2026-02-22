# 🎤 Interview Q&A – Lab 38: Using setenforce and semanage for SELinux

---

## 1️⃣ What is SELinux?

SELinux is a Mandatory Access Control (MAC) system that enforces security policies independent of traditional Unix permissions.

---

## 2️⃣ Difference between Enforcing and Permissive?

| Mode | Behavior |
|------|----------|
| Enforcing | Blocks violations |
| Permissive | Logs violations but allows them |

---

## 3️⃣ How do you check SELinux status?

```bash
sestatus
getenforce
```

---

## 4️⃣ How do you change SELinux mode temporarily?

```bash
sudo setenforce 0
```

---

## 5️⃣ How do you change it permanently?

Edit:
```
/etc/selinux/config
```

---

## 6️⃣ What does semanage do?

It manages SELinux policy components like:

- Ports
- File contexts
- Booleans

---

## 7️⃣ How do you troubleshoot AVC denials?

```bash
ausearch -m avc
audit2allow
```

---

## 8️⃣ Why is disabling SELinux bad practice?

Because it removes an entire security layer.  
Proper solution = modify policy, not disable enforcement.

---

## 9️⃣ What is audit2allow?

Tool that generates policy modules from denial logs.

---

## 🔟 Where are SELinux denials logged?

```
/var/log/audit/audit.log
```
