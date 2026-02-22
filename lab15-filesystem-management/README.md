# 🧪 Lab 15: Accessing and Managing Linux Filesystems

---

## 📌 Lab Overview

This lab focuses on Linux storage administration fundamentals including:

- Block device inspection
- Partition creation
- Filesystem formatting
- Mounting & unmounting
- Persistent mounts via `/etc/fstab`
- Logical Volume Manager (LVM)
- Extending logical volumes safely

Storage management is a core Linux administration skill used in:

- Cloud VM disk expansion
- Database storage provisioning
- Container persistent volumes
- Enterprise infrastructure scaling

---

## 🎯 Objectives

By the end of this lab, I was able to:

- ✔ Inspect block devices using `lsblk`, `fdisk`, and `blkid`
- ✔ Create partitions
- ✔ Format filesystems
- ✔ Mount and unmount filesystems
- ✔ Configure persistent mounts via `/etc/fstab`
- ✔ Create LVM volumes
- ✔ Extend LVM logical volumes
- ✔ Resize filesystems safely

---

## 📋 Prerequisites

- RHEL 9 system
- sudo privileges
- Additional unused disk (example: `/dev/nvme1n1`)
- Internet not required

---

## 🗂 Repository Structure

```

lab15-filesystem-management/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

# 🧩 Lab Workflow Overview

---

## 🔹 Task 1 – Inspect Storage
- `lsblk`
- `lsblk -f`
- `fdisk -l`
- `blkid`

---

## 🔹 Task 2 – Partition & Mount
- Create partition
- Format with ext4
- Mount temporarily
- Unmount

---

## 🔹 Task 3 – Persistent Mount
- Retrieve UUID
- Edit `/etc/fstab`
- Test with `mount -a`

---

## 🔹 Task 4 – LVM Management
- Create Physical Volume
- Create Volume Group
- Create Logical Volume
- Format and mount
- Extend Logical Volume
- Resize filesystem

---

# 🔐 Why This Lab Matters

Improper storage configuration can:

- Prevent system boot
- Corrupt data
- Cause production outages
- Break container workloads

Correct LVM usage allows:

- Online disk expansion
- Flexible storage allocation
- Enterprise-grade scalability

---

# 🏁 Lab Outcome

After completing this lab, I understand:

- Linux disk layout
- Mount lifecycle
- UUID-based persistent storage
- LVM architecture (PV → VG → LV)
- Safe disk extension procedures
