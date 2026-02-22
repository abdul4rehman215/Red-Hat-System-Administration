# 🛠 Troubleshooting Guide – Lab 39: Managing Logical Volumes with LVM

---

## 1️⃣ Device Not Found

Check:

```bash
lsblk
```

Ensure disk exists and is not mounted.

---

## 2️⃣ Filesystem Not Resizing

Ensure correct filesystem:

- ext4 → use resize2fs
- xfs → use xfs_growfs

---

## 3️⃣ Snapshot Merge Fails

Ensure:

- LV is unmounted
- Snapshot exists

Check status:

```bash
lvs
```

---

## 4️⃣ Volume Group Has No Free Space

Check:

```bash
vgs
```

Add new disk:

```bash
vgextend my_vg /dev/sdd
```

---

## 5️⃣ Cannot Remove PV

Ensure VG removed first:

```bash
vgremove my_vg
pvremove /dev/sdb
```

---

## 🔐 Production Best Practices

✔ Always back up before resizing  
✔ Monitor snapshot usage  
✔ Use thin provisioning carefully  
✔ Avoid filling snapshot space  
✔ Document storage layout  

---

## 🧠 Enterprise Insight

LVM is heavily used in:

- VMware guest systems
- RHEL enterprise deployments
- Cloud auto-scaling systems
- Container nodes

Proper LVM management = scalable storage architecture.
