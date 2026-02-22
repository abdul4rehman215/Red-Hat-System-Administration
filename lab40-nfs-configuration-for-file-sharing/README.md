# 🧪 Lab 40: Configuring NFS for File Sharing

## 📌 Overview

This lab demonstrates how to configure Network File System (NFS) for centralized file sharing between Linux systems.

You will:

- Install and configure NFS server and client
- Export shared directories
- Mount NFS shares remotely
- Configure persistent mounting
- Apply security and performance optimizations

NFS is widely used in enterprise Linux infrastructure.

---

## 🖥 Environment

| Role   | OS             | IP Address      | Hostname     |
|--------|---------------|----------------|--------------|
| Server | CentOS 7     | 192.168.1.100  | nfs-server   |
| Client | CentOS 7     | 192.168.1.101  | nfs-client   |

Both systems have sudo access and network connectivity verified.

---

## 🎯 Learning Objectives

✔ Install NFS server & client  
✔ Export shared directory  
✔ Mount NFS share remotely  
✔ Configure persistent mount via fstab  
✔ Apply security restrictions  
✔ Validate file sharing  

---

## 📂 Repository Structure

```
lab40-nfs-configuration/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🔬 Skills Practiced

- Managing systemd services
- Configuring firewall rules
- Editing /etc/exports
- Using exportfs
- Mounting remote filesystems
- Configuring persistent NFS mounts
- Applying basic NFS security controls

---

## 🔐 Why NFS Matters

NFS is used in:

- Enterprise file servers
- Kubernetes persistent storage
- Backup systems
- Shared application data
- Virtual machine storage pools

---

## 🏁 Final Outcome

By completing this lab, you can:

✔ Deploy NFS in production  
✔ Secure NFS exports  
✔ Configure automatic mounts  
✔ Troubleshoot connectivity issues  

---
