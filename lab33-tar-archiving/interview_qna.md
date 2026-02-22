# 🎤 Interview Q&A – Lab 33: Archiving with tar

---

## 1️⃣ What is tar?

`tar` (Tape Archive) is a Linux utility used to combine multiple files and directories into a single archive file. It does not compress by default.

---

## 2️⃣ What is the difference between tar and gzip?

| Tool | Function |
|------|----------|
| tar | Archives multiple files into one |
| gzip | Compresses a single file |

Common combination:
```
tar + gzip = .tar.gz
```

---

## 3️⃣ What does `tar -cvf` mean?

- `c` → create archive  
- `v` → verbose (show files being processed)  
- `f` → specify filename  

Example:
```bash
tar -cvf archive.tar files...
```

---

## 4️⃣ How do you list contents of a tar archive?

```bash
tar -tvf archive.tar
```

---

## 5️⃣ How do you extract a tar archive?

```bash
tar -xvf archive.tar
```

---

## 6️⃣ How do you create a compressed archive in one command?

### Using gzip:
```bash
tar -czvf archive.tar.gz directory/
```

### Using bzip2:
```bash
tar -cjvf archive.tar.bz2 directory/
```

---

## 7️⃣ What is the difference between `-z` and `-j`?

| Option | Compression Tool |
|--------|------------------|
| -z | gzip |
| -j | bzip2 |

gzip → faster  
bzip2 → better compression (usually smaller size)

---

## 8️⃣ How would you extract a .tar.gz file?

```bash
tar -xzvf archive.tar.gz
```

---

## 9️⃣ How would you extract a .tar.bz2 file?

```bash
tar -xjvf archive.tar.bz2
```

---

## 🔟 How can you extract to a specific directory?

```bash
tar -xvf archive.tar -C /target/directory
```

---

## 1️⃣1️⃣ How do you archive an entire directory?

```bash
tar -cvf project.tar project/
```

---

## 1️⃣2️⃣ How do you exclude files while archiving?

```bash
tar --exclude="*.log" -cvf archive.tar directory/
```

---

## 1️⃣3️⃣ What happens if you compress an already compressed file?

It may:
- Not reduce size significantly
- Sometimes increase file size
- Waste CPU resources

---

## 1️⃣4️⃣ How is tar used in DevOps or CI/CD pipelines?

- Packaging build artifacts
- Exporting container logs
- Bundling releases
- Creating backups before deployment
- Migrating application data

---

## 1️⃣5️⃣ How is tar relevant to security engineering?

Used for:

- Evidence collection in incident response
- Secure log packaging before transfer
- Archiving forensic artifacts
- Backup verification before cleanup
- Transferring sensitive data (with encryption tools like gpg)

---

# 🧠 Scenario Question

**Q:** You need to back up `/var/www` daily, compress it, and store it with the date in filename. What command would you use?

✅ Answer:

```bash
tar -czvf www_backup_$(date +%Y%m%d).tar.gz /var/www
```

---

# 🧠 Advanced Scenario

**Q:** You suspect tampering. How would you verify archive integrity?

1️⃣ Generate checksum:
```bash
sha256sum archive.tar.gz
```

2️⃣ Compare with known-good checksum

---

# 📌 Key Interview Takeaway

tar is fundamental for:

✔ Backup automation  
✔ Release packaging  
✔ Log retention  
✔ Forensic archiving  
✔ DevOps artifact management  

---
