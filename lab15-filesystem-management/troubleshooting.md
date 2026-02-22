# 🛠 Troubleshooting Guide - Lab 15: Accessing and Managing Linux Filesystems

---

# 🔎 Common Issues & Solutions

---

## 1️⃣ Disk Not Visible After Attachment

### ❌ Problem:
New disk not showing in `lsblk`.

### 🔍 Cause:
Kernel has not rescanned devices.

### ✅ Solution:
```bash
sudo partprobe
sudo lsblk
````

Or rescan manually:

```bash
echo "- - -" | sudo tee /sys/class/scsi_host/host*/scan
```

---

## 2️⃣ Partition Table Error

### ❌ Problem:

```bash
Device does not contain a recognized partition table.
```

### 🔍 Cause:

Disk not initialized.

### ✅ Solution:

Use `fdisk` to create a partition:

```bash
sudo fdisk /dev/nvme1n1
```

---

## 3️⃣ Mount Failed: Wrong Filesystem Type

### ❌ Error:

```bash
mount: wrong fs type, bad option, bad superblock
```

### 🔍 Cause:

Filesystem not created.

### ✅ Solution:

```bash
sudo mkfs.ext4 /dev/nvme1n1p1
```

Then mount again.

---

## 4️⃣ Device Busy During Unmount

### ❌ Error:

```bash
umount: target is busy
```

### 🔍 Cause:

Files open inside mount directory.

### ✅ Solution:

Check active processes:

```bash
sudo lsof | grep /mnt/mydisk
```

Force unmount (if safe):

```bash
sudo umount -l /mnt/mydisk
```

---

## 5️⃣ System Fails to Boot After Editing fstab

### ❌ Cause:

Incorrect UUID or syntax error.

### 🔧 Recovery Steps:

1. Boot into rescue mode
2. Mount root filesystem
3. Edit `/etc/fstab`
4. Comment faulty entry
5. Reboot

Always test fstab:

```bash
sudo mount -a
```

---

## 6️⃣ LVM Creation Fails

### ❌ Error:

```bash
Device is already in use.
```

### 🔍 Cause:

Disk contains old partition or filesystem.

### ✅ Solution:

Wipe signatures:

```bash
sudo wipefs -a /dev/nvme1n1
```

Then retry:

```bash
sudo pvcreate /dev/nvme1n1
```

---

## 7️⃣ LVM Extension Not Reflecting in df

### ❌ Cause:

Filesystem not resized.

### ✅ Solution:

For ext4:

```bash
sudo resize2fs /dev/myvg/mylv
```

For xfs:

```bash
sudo xfs_growfs /mnt/lvm
```

---

## 8️⃣ Filesystem Corruption

### ❌ Symptoms:

Mount fails or system errors.

### ✅ Check Filesystem:

```bash
sudo fsck /dev/nvme1n1p1
```

⚠ Run fsck only on unmounted filesystems.

---

# 🔐 Enterprise Best Practices

* Always use UUID in fstab
* Backup fstab before editing
* Use LVM for production systems
* Monitor disk usage regularly
* Automate disk monitoring (Prometheus, etc.)
* Avoid manual partition resizing without backups
* Test mount configs before reboot

---

# 🧹 Safe Cleanup

Remove LVM (if needed):

```bash
sudo umount /mnt/lvm
sudo lvremove /dev/myvg/mylv
sudo vgremove myvg
sudo pvremove /dev/nvme1n1
```

Remove partition:

```bash
sudo fdisk /dev/nvme1n1
```

---

# ✅ Verification Checklist

✔ Disk visible via lsblk
✔ Partition created successfully
✔ Filesystem formatted
✔ Temporary mount works
✔ fstab entry verified
✔ LVM created
✔ LV extended successfully
✔ Filesystem resized properly
✔ No boot errors

---
