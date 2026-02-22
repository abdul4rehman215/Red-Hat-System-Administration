# 🎤 Interview Questions – Lab 20: Configuring NFS for File Sharing

---

## 1️⃣ What is NFS?

NFS (Network File System) allows remote file systems to be mounted over a network.

---

## 2️⃣ Which package provides NFS services?

```
nfs-utils
```

---

## 3️⃣ Where are exported directories defined?

```
/etc/exports
```

---

## 4️⃣ How do you apply export changes?

```bash
exportfs -arv
```

---

## 5️⃣ What does sync option do?

Ensures data is written to disk before acknowledging write — safer but slower.

---

## 6️⃣ What is no_root_squash?

Allows remote root users to act as root on the server (not recommended in production).

---

## 7️⃣ How do you make NFS mount persistent?

Add entry in:

```
/etc/fstab
```

---

## 8️⃣ How do you verify mounted NFS shares?

```bash
df -hT
mount | grep nfs
```

---

## 9️⃣ How can NFS be secured further?

- Use Kerberos (sec=krb5)
- Restrict IP ranges
- Use firewall rules
- Avoid no_root_squash

---

## 🔟 Difference Between NFSv3 and NFSv4?

| Feature | NFSv3 | NFSv4 |
|----------|-------|-------|
| Security | Basic | Stronger |
| Stateful | No | Yes |
| Firewall Friendly | No | Yes |
