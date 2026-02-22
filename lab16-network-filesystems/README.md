# 🧪 Lab 16: Working with Network File Systems (NFS and CIFS)

---

## 📌 Lab Overview

This lab covers Linux network filesystem configuration using:

- NFS (Network File System)
- CIFS/SMB (Common Internet File System)

I learned how to:

- Install required utilities
- Discover remote shares
- Mount network filesystems
- Configure persistent mounts
- Secure credentials
- Troubleshoot network storage issues

Network storage is widely used in:

- Enterprise environments
- Hybrid cloud deployments
- Container persistent volumes
- Backup infrastructures
- Cross-platform file sharing

---

## 🎯 Objectives

By the end of this lab, I was able to:

- ✔ Install NFS and CIFS utilities
- ✔ Discover available NFS exports
- ✔ Mount NFS shares
- ✔ Mount CIFS/SMB shares securely
- ✔ Configure persistent mounts in `/etc/fstab`
- ✔ Secure credentials for SMB authentication
- ✔ Verify and troubleshoot mounts

---

## 📋 Prerequisites

- RHEL 9 system
- sudo privileges
- Network connectivity
- Accessible NFS server (example: 10.0.2.20)
- Accessible CIFS/SMB server (example: 10.0.2.30)

---

## 🗂 Repository Structure

```

lab16-network-filesystems/
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

## 🔹 Task 1 – Install Utilities
- Install `nfs-utils`
- Install `cifs-utils`

---

## 🔹 Task 2 – Mount NFS Share
- Discover exports
- Create mount point
- Mount share
- Verify

---

## 🔹 Task 3 – Mount CIFS Share
- Create credentials file
- Secure credentials
- Mount share
- Verify

---

## 🔹 Task 4 – Configure Persistent Mounts
- Backup `/etc/fstab`
- Add NFS entry
- Add CIFS entry
- Test with `mount -a`

---

# 🔐 Why This Lab Matters

Network filesystems are critical for:

- Shared enterprise storage
- Centralized backups
- Kubernetes persistent storage
- Hybrid Linux/Windows integration
- High availability infrastructure

Improper configuration can cause:

- Boot failures
- Security exposure
- Credential leaks
- Data access issues

---

# 🏁 Lab Outcome

After completing this lab, I understand:

- Linux NFS client operations
- CIFS authentication handling
- Secure credential storage
- Persistent network mount configuration
- Network storage troubleshooting

---
