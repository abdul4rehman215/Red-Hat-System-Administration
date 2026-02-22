# 🎤 Interview Q&A - Lab 16: Working with Network File Systems (NFS & CIFS)

---

# 🔹 Basic Level Questions

---

## 1️⃣ What is NFS?

NFS (Network File System) is a protocol that allows file sharing between Linux/Unix systems over a network.

It allows remote directories to be mounted locally.

---

## 2️⃣ What is CIFS/SMB?

CIFS (Common Internet File System) is the Linux implementation of the SMB protocol.

It is commonly used for:
- Windows file sharing
- Cross-platform environments
- Active Directory integrated storage

---

## 3️⃣ What package is required to mount NFS?

```

nfs-utils

```

---

## 4️⃣ What package is required to mount CIFS?

```

cifs-utils

````

---

# 🔹 Intermediate Level Questions

---

## 5️⃣ How do you discover available NFS exports?

```bash
showmount -e <server_ip>
````

---

## 6️⃣ How do you mount an NFS share manually?

```bash
mount -t nfs server:/share /mountpoint
```

---

## 7️⃣ Why should CIFS credentials not be stored directly in fstab?

Because:

* Plain text passwords become visible
* Security risk
* Violates best practices

Instead use:

```
credentials=/etc/cifs_credentials
```

And restrict permissions to 600.

---

## 8️⃣ What does `_netdev` option do in fstab?

`_netdev` ensures:

* Mount waits until network is available
* Prevents boot failure
* Avoids emergency mode

Used for network filesystems.

---

# 🔹 Advanced Level Questions

---

## 9️⃣ What are common mount options for CIFS?

Examples:

```
credentials=
uid=
gid=
vers=
rw
_netdev
```

---

## 🔟 What are common NFS mount options?

```
defaults
rw
hard
soft
timeo=
retrans=
_netdev
```

---

## 1️⃣1️⃣ How do you verify active network mounts?

```bash
mount | grep -E 'nfs|cifs'
```

or

```bash
df -hT
```

---

## 1️⃣2️⃣ What happens if NFS server is unreachable at boot?

If `_netdev` is NOT used:

* System may fail to boot
* Drop into emergency mode

With `_netdev`:

* Mount waits for network

---

# 🔹 Scenario-Based Questions

---

## Scenario 1:

CIFS mount fails with permission denied.

Check:

* Credentials file
* File permissions (600)
* Correct username/password
* SMB version compatibility

---

## Scenario 2:

NFS mount hangs.

Possible causes:

* Firewall blocking port 2049
* Server offline
* Wrong export path
* NFS version mismatch

Check:

```bash
ping server
showmount -e server
```

---

## Scenario 3:

After reboot, network share not mounted.

Check:

* fstab syntax
* `_netdev` option
* Network service status
* Credentials file exists

Test:

```bash
mount -a
```

---

# 🔐 Real-World Relevance

Network filesystems are critical for:

* Enterprise shared storage
* Centralized backups
* Kubernetes persistent volumes
* Hybrid Linux/Windows environments
* High-availability clusters

---

# ✅ Knowledge Check

✔ Understand NFS protocol
✔ Understand CIFS/SMB protocol
✔ Know how to mount network shares
✔ Know how to secure credentials
✔ Understand persistent mount configuration
✔ Know troubleshooting techniques

---
