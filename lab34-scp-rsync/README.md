# 🧪 Lab 34: File Transfer with scp and rsync

---

## 📌 Overview

This lab demonstrates secure file transfer and synchronization using:

- **scp** (Secure Copy Protocol)
- **rsync** (Remote Sync Utility)

Both tools use **SSH encryption** to securely transfer data between systems.

---

## 🌐 Environment

| Role | System | User |
|------|--------|------|
| Local | Ubuntu 24.04 | toor |
| Remote | Ubuntu 24.04 | student |
| SSH | Enabled | Password-less configured |

---

## 🎯 Learning Objectives

By completing this lab, you will:

- Transfer files securely using `scp`
- Transfer directories recursively
- Synchronize files using `rsync`
- Perform incremental backups
- Use advanced rsync options
- Compare scp vs rsync behavior

---

## 📁 Repository Structure

```
lab34-scp-rsync/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🔐 Why This Matters (Security + DevOps)

Secure file transfer is critical for:

✔ Remote server administration  
✔ CI/CD artifact deployment  
✔ Backup automation  
✔ Log synchronization  
✔ Secure infrastructure management  

---

## 🔎 scp vs rsync Comparison

| Feature | scp | rsync |
|----------|------|--------|
| Encryption | SSH | SSH |
| Incremental transfer | ❌ | ✅ |
| Resume transfer | ❌ | ✅ |
| Bandwidth limit | ❌ | ✅ |
| Ideal use case | Quick copy | Backups & sync |

---

## 🚀 Production Use Cases

- Code deployment
- Remote log backup
- Disaster recovery replication
- Container volume synchronization
- Cloud migration

---
