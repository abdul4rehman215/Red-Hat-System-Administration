# 🧪 Lab 39: Managing Logical Volumes with LVM

## 📌 Overview

This lab demonstrates enterprise-level storage management using LVM (Logical Volume Manager).

You will learn how to:

- Create Physical Volumes (PV)
- Create Volume Groups (VG)
- Allocate and resize Logical Volumes (LV)
- Format and mount LVs
- Create and merge LVM snapshots

LVM provides dynamic, flexible storage management used in production Linux systems.

---

## 🖥 Environment

- OS: CentOS Linux 7
- Disks: /dev/sdb (20G), /dev/sdc (20G)
- User: centos (sudo privileges)

---

## 🎯 Learning Objectives

✔ Create Physical Volumes  
✔ Create Volume Groups  
✔ Create and extend Logical Volumes  
✔ Resize filesystems safely  
✔ Create and restore snapshots  
✔ Clean up LVM configuration  

---

## 🏗 LVM Architecture

```
Physical Volume (PV)
        ↓
Volume Group (VG)
        ↓
Logical Volume (LV)
        ↓
Filesystem (ext4/xfs)
        ↓
Mount Point
```

---

## 📂 Repository Structure

```
lab39-lvm-management/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🔬 Skills Practiced

- Disk discovery using `lsblk`
- Creating PVs using `pvcreate`
- Creating VGs using `vgcreate`
- Creating LVs using `lvcreate`
- Resizing LVs with `lvextend`
- Resizing filesystem using `resize2fs`
- Creating snapshots
- Merging snapshots for recovery

---

## 🔐 Why LVM Matters

LVM is used in:

- Enterprise Linux servers
- Cloud VMs
- Database systems
- Kubernetes worker nodes
- High-availability storage

It allows:

- Dynamic resizing without repartitioning
- Storage pooling
- Snapshots for backup and rollback

---

## 🏁 Final Outcome

By completing this lab, I can:

✔ Design flexible storage architecture  
✔ Expand volumes without downtime  
✔ Perform safe snapshot-based recovery  
✔ Manage enterprise-grade storage  

---
