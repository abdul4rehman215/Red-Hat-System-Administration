# 🛠 Troubleshooting Guide – Lab 20: Configuring NFS for File Sharing

---

## 1️⃣ Mount Fails – Permission Denied

Check:

```bash
sudo exportfs -v
```

Verify client IP matches /etc/exports.

---

## 2️⃣ Firewall Blocking Connection

Ensure:

```bash
firewall-cmd --list-all
```

Services added:
- nfs
- rpc-bind
- mountd

---

## 3️⃣ RPC Not Responding

Check:

```bash
systemctl status rpcbind
systemctl status nfs-server
```

---

## 4️⃣ Mount Hangs

Verify connectivity:

```bash
ping 192.168.1.100
showmount -e 192.168.1.100
```

---

## 5️⃣ fstab Boot Failure

Test before reboot:

```bash
mount -a
```

If error → fix entry.

---

## 🔐 Production Best Practices

✔ Use specific IP ranges  
✔ Avoid no_root_squash  
✔ Use read-only exports where possible  
✔ Monitor NFS usage with nfsstat  
✔ Consider Kerberos authentication  

---

## 🧠 Enterprise Insight

NFS is commonly used for:

- Kubernetes Persistent Volumes
- Shared configuration storage
- Backup repositories
- VM disk storage

Proper configuration ensures:

- Stability
- Security
- Performance
