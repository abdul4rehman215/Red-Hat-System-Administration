# 🛠 Troubleshooting Guide – Lab 33: Archiving with tar

---

# 1️⃣ "No such file or directory" Error

## 🔎 Problem
```bash
tar: file1.txt: Cannot stat: No such file or directory
```

## ✅ Solution

Check file existence:
```bash
ls -l
```

Verify correct path:
```bash
pwd
```

Use absolute path if needed:
```bash
tar -cvf archive.tar /home/toor/lab_files/file1.txt
```

---

# 2️⃣ Permission Denied Error

## 🔎 Problem
```bash
tar: /var/log/auth.log: Cannot open: Permission denied
```

## ✅ Solution

Use sudo:
```bash
sudo tar -czvf logs.tar.gz /var/log/*.log
```

Or verify file permissions:
```bash
ls -l /var/log/
```

---

# 3️⃣ Archive Corrupted

## 🔎 Problem
```bash
tar: Unexpected EOF in archive
```

## 🎯 Cause
- Interrupted archive creation
- Partial file transfer
- Disk full during compression

## ✅ Solution

Recreate archive:
```bash
tar -cvf archive.tar files...
```

Check disk space:
```bash
df -h
```

---

# 4️⃣ Wrong Compression Flag Used

## 🔎 Problem
Trying to extract .tar.gz with wrong flag:

```bash
tar -xvf archive.tar.gz
```

## ❌ Error:
```
gzip: stdin: not in gzip format
```

## ✅ Solution

Use correct flag:

```bash
tar -xzvf archive.tar.gz
```

For bzip2:

```bash
tar -xjvf archive.tar.bz2
```

---

# 5️⃣ File Overwritten During Extraction

## 🔎 Problem
Extracting overwrites existing files.

## ✅ Prevention

Use:

```bash
tar -xvkf archive.tar
```

`-k` prevents overwriting existing files.

Or extract to new directory:

```bash
mkdir restore_dir
tar -xvf archive.tar -C restore_dir
```

---

# 6️⃣ Archive Too Large

## 🔎 Problem
Archive size unexpectedly large.

## 🎯 Possible Causes
- Including unnecessary files
- Including hidden files
- Archiving entire root directory accidentally

## ✅ Fix

Use exclusion:

```bash
tar --exclude="*.log" --exclude="*.tmp" -cvf archive.tar directory/
```

Check content before creation:
```bash
du -sh directory/
```

---

# 7️⃣ Disk Space Runs Out During Compression

## 🔎 Diagnose

```bash
df -h
```

Check temporary storage location:
```bash
echo $TMPDIR
```

## ✅ Fix

Free disk space or store archive elsewhere:

```bash
tar -czvf /mnt/backup/archive.tar.gz directory/
```

---

# 8️⃣ Verify Archive Integrity

List contents:

```bash
tar -tvf archive.tar.gz
```

Generate checksum:

```bash
sha256sum archive.tar.gz
```

---

# 9️⃣ Performance Issues During Compression

## 🔎 Problem
bzip2 very slow on large directories.

## ✅ Solutions

Use gzip instead:

```bash
tar -czvf archive.tar.gz directory/
```

Or use parallel gzip (if installed):

```bash
tar -I pigz -cvf archive.tar.gz directory/
```

---

# 🔟 Archiving System Files Safely

When backing up system directories:

```bash
sudo tar --numeric-owner --xattrs --acls -czvf full_backup.tar.gz /
```

⚠ Use caution to avoid including virtual filesystems:

```
--exclude=/proc
--exclude=/sys
--exclude=/dev
```

---

# 🛡 Security Best Practices

✔ Verify archive integrity with checksums  
✔ Avoid extracting untrusted archives as root  
✔ Scan archives before extraction  
✔ Extract in isolated directory  
✔ Use encryption (gpg) for sensitive backups  

Example:

```bash
gpg -c archive.tar.gz
```

---

# 📌 Production Checklist

Before deploying archive automation:

✔ Test restore procedure  
✔ Monitor disk space  
✔ Implement rotation policy  
✔ Validate compression type  
✔ Store backups off-host  

---
