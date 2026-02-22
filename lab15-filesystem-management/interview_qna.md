# 🎤 Interview Q&A - Lab 15: Accessing and Managing Linux Filesystems

---

# 🔹 Basic Level Questions

---

## 1️⃣ What is a block device?

A block device is a storage device that reads/writes data in fixed-size blocks.

Examples:
- /dev/sda
- /dev/nvme0n1
- /dev/xvda

Block devices are typically disks or partitions.

---

## 2️⃣ What does `lsblk` show?

`lsblk` displays:

- Disk devices
- Partitions
- Mount points
- Logical volumes
- Device hierarchy

It provides a tree view of storage layout.

---

## 3️⃣ What is the difference between `df -h` and `lsblk`?

| Command | Purpose |
|----------|----------|
| lsblk | Shows disk structure |
| df -h | Shows mounted filesystem usage |

---

## 4️⃣ Why use UUID in /etc/fstab instead of device name?

Device names (like /dev/sdb1) may change after reboot.

UUID ensures:
- Stable mounting
- Reliable boot
- No mount failures

---

# 🔹 Intermediate Level Questions

---

## 5️⃣ What is LVM?

LVM (Logical Volume Manager) provides flexible disk management.

Architecture:

Physical Volume (PV)  
→ Volume Group (VG)  
→ Logical Volume (LV)

It allows:
- Disk resizing
- Pooling multiple disks
- Online expansion

---

## 6️⃣ How do you extend a logical volume?

```bash
lvextend -L +2G /dev/myvg/mylv
resize2fs /dev/myvg/mylv
````

First extend LV, then resize filesystem.

---

## 7️⃣ What happens if /etc/fstab is misconfigured?

System may:

* Fail to boot
* Drop into emergency mode

Always test with:

```bash
mount -a
```

---

## 8️⃣ What is the difference between ext4 and xfs?

| Feature            | ext4  | xfs          |
| ------------------ | ----- | ------------ |
| Resize             | Yes   | Yes          |
| Shrink             | Yes   | No           |
| Enterprise default | Older | RHEL default |

RHEL 9 commonly uses XFS.

---

# 🔹 Advanced Level Questions

---

## 9️⃣ How do you check LVM status?

```bash
pvdisplay
vgdisplay
lvdisplay
```

Or summary view:

```bash
pvs
vgs
lvs
```

---

## 🔟 Can you extend an LVM volume while mounted?

Yes.

Modern filesystems allow:

* Online logical volume extension
* Online filesystem resize

No reboot required.

---

## 1️⃣1️⃣ What is the difference between mount and umount?

| Command | Function                       |
| ------- | ------------------------------ |
| mount   | Attach filesystem to directory |
| umount  | Detach filesystem              |

Unmount before disk removal.

---

## 1️⃣2️⃣ What is the purpose of `blkid`?

`blkid` shows:

* Filesystem type
* UUID
* LABEL
* Block device metadata

Used when configuring fstab.

---

# 🔹 Scenario-Based Questions

---

## Scenario 1:

Disk added but not visible in filesystem.

Steps:

1. lsblk
2. fdisk -l
3. Create partition
4. Format filesystem
5. Mount
6. Add to fstab

---

## Scenario 2:

Need to increase database disk size without downtime.

Solution:

* Use LVM
* Extend logical volume
* Resize filesystem online

---

## Scenario 3:

System stuck in emergency mode after reboot.

Likely cause:
Broken fstab entry.

Fix:

* Boot into rescue mode
* Comment problematic line
* Reboot

---

# 🔐 Real-World Importance

Filesystem management is critical for:

* Cloud VM disk expansion
* Database storage
* Kubernetes persistent volumes
* Containerized applications
* Enterprise storage compliance

---

# ✅ Knowledge Check

✔ Understand block devices
✔ Know partition lifecycle
✔ Know mount workflow
✔ Understand UUID usage
✔ Understand LVM architecture
✔ Know safe extension procedures

---
