# 🛠 Troubleshooting Guide - Lab 16: Working with Network File Systems (NFS & CIFS)

---

# 🔎 Common Issues & Solutions

---

## 1️⃣ NFS Mount Fails: Connection Refused

### ❌ Error
```bash
mount.nfs: Connection refused
````

### 🔍 Cause

* NFS server not running
* Firewall blocking port 2049
* Incorrect server IP

### ✅ Solution

Check connectivity:

```bash
ping 10.0.2.20
```

Verify exports:

```bash
showmount -e 10.0.2.20
```

Check firewall (server side):

```bash
sudo firewall-cmd --list-all
```

Allow NFS:

```bash
sudo firewall-cmd --add-service=nfs --permanent
sudo firewall-cmd --reload
```

---

## 2️⃣ NFS Mount Hangs

### 🔍 Cause

* Network issue
* Server unreachable
* DNS resolution problem

### ✅ Solution

Try mounting with version option:

```bash
sudo mount -t nfs -o vers=4 10.0.2.20:/share /mnt/nfs_share
```

---

## 3️⃣ CIFS Mount Fails: Permission Denied

### ❌ Error

```bash
mount error(13): Permission denied
```

### 🔍 Cause

* Wrong credentials
* Credentials file permissions incorrect
* SMB version mismatch

### ✅ Solution

Check credentials file:

```bash
sudo cat /etc/cifs_credentials
```

Verify permissions:

```bash
ls -l /etc/cifs_credentials
```

Must be:

```
-rw------- 1 root root
```

Try specifying SMB version:

```bash
sudo mount -t cifs -o credentials=/etc/cifs_credentials,vers=3.0 \
//10.0.2.30/shared /mnt/cifs_share
```

---

## 4️⃣ System Fails to Boot After fstab Edit

### 🔍 Cause

* Incorrect syntax
* Missing `_netdev`
* Server unreachable

### 🔧 Recovery Steps

1. Boot into rescue mode
2. Edit `/etc/fstab`
3. Comment problematic entry
4. Reboot

Always test:

```bash
sudo mount -a
```

---

## 5️⃣ CIFS Credentials Exposed

### 🔍 Risk

Credentials visible to all users.

### ✅ Fix

```bash
sudo chmod 600 /etc/cifs_credentials
sudo chown root:root /etc/cifs_credentials
```

---

## 6️⃣ Network Share Not Mounting After Reboot

### 🔍 Cause

Network not ready before mount attempt.

### ✅ Solution

Ensure `_netdev` is included in `/etc/fstab`:

Example:

```bash
10.0.2.20:/share /mnt/nfs_share nfs defaults,_netdev 0 0
```

---

## 7️⃣ Permission Issues on Mounted Share

### 🔍 Cause

UID/GID mismatch.

### ✅ Solution (CIFS example)

```bash
sudo mount -t cifs \
-o credentials=/etc/cifs_credentials,uid=1000,gid=1000 \
//10.0.2.30/shared /mnt/cifs_share
```

---

# 🔐 Enterprise Best Practices

* Use `_netdev` for network mounts
* Secure credentials with 600 permissions
* Avoid storing passwords in fstab
* Use version locking (vers=3.0, vers=4)
* Monitor mount status with systemd
* Implement centralized authentication (Kerberos/AD) in enterprise

---

# 🧹 Safe Cleanup

Unmount shares:

```bash
sudo umount /mnt/nfs_share
sudo umount /mnt/cifs_share
```

Remove fstab entries:

```bash
sudo nano /etc/fstab
```

Delete credentials:

```bash
sudo rm -f /etc/cifs_credentials
```

---

# ✅ Verification Checklist

✔ Packages installed
✔ NFS share discovered
✔ NFS mounted successfully
✔ CIFS credentials secured
✔ CIFS share mounted
✔ fstab configured
✔ mount -a tested
✔ No boot errors

---
