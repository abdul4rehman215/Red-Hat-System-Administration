# 🧪 Lab 33: Archiving Files with tar

---

## 📌 Overview

This lab demonstrates how to use the **tar utility** to:

- Archive multiple files into a single file
- Compress archives using **gzip** and **bzip2**
- Extract and inspect archive contents
- Automate archiving tasks using scripts

Archiving is a fundamental skill for:

- Backup management
- Log packaging
- Software distribution
- DevOps workflows
- Incident response evidence collection

---

## 🎯 Learning Objectives

By completing this lab, you will:

- Create `.tar` archives
- Compress using `.gz` and `.bz2`
- Extract and verify archive contents
- Understand compression trade-offs
- Automate archive generation

---

## 🏗 Lab Structure

```
lab33-tar-archiving/
│
├── README.md
├── commands.sh
├── output.txt
├── archive_logs.sh
├── interview_qna.md
└── troubleshooting.md
```

---

## 🛠 Core Commands Summary

| Command | Purpose |
|----------|----------|
| tar -cvf | Create archive |
| tar -tvf | List archive contents |
| tar -xvf | Extract archive |
| -z | gzip compression |
| -j | bzip2 compression |
| gzip | Compress existing tar |
| bzip2 | Higher compression ratio |

---

## 📦 Archive Types

| Extension | Tool | Speed | Compression |
|------------|------|--------|--------------|
| .tar | tar | Fast | None |
| .tar.gz | tar + gzip | Fast | Moderate |
| .tar.bz2 | tar + bzip2 | Slower | Better |

---

## 🔐 Security & Operations Relevance

Archiving is used in:

- Log retention before deletion
- Secure data transfer
- Forensic evidence preservation
- Container image packaging
- CI/CD artifact creation

---

## 🚀 Production Use Cases

- Nightly backup automation
- Log bundling before SIEM upload
- Source code release packaging
- Cloud migration export

---

# ✅ Lab 13 Setup Complete
