# 🧪 Lab 38: Using setenforce and semanage for SELinux

## 📌 Overview

This lab demonstrates practical SELinux administration including:

- Switching between Enforcing and Permissive modes
- Managing SELinux port policies
- Analyzing and troubleshooting AVC denials
- Generating and applying custom policy modules

SELinux is a critical security layer in Enterprise Linux environments.

---

## 🖥 Environment

- OS: CentOS Linux 7
- SELinux Policy: targeted
- User: centos (sudo privileges)

---

## 🎯 Learning Objectives

✔ Check SELinux status  
✔ Switch modes using setenforce  
✔ Modify SELinux configuration permanently  
✔ Manage port contexts using semanage  
✔ Analyze AVC denials  
✔ Generate and apply custom policy modules  

---

## 🔐 Why SELinux Matters

SELinux provides:

- Mandatory Access Control (MAC)
- Fine-grained policy enforcement
- Defense against privilege escalation
- Protection even if services are compromised

Used heavily in:

- RHEL
- OpenShift
- Government systems
- Financial infrastructure

---

## 📂 Repository Structure

```
lab38-selinux-management/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🔬 Skills Practiced

- Using `sestatus` and `getenforce`
- Switching SELinux modes
- Editing `/etc/selinux/config`
- Adding custom ports with `semanage`
- Investigating denials with `ausearch`
- Generating policy modules with `audit2allow`

---

## 🏁 Final Outcome

By completing this lab, I can:

✔ Administer SELinux modes safely  
✔ Extend SELinux policy without disabling it  
✔ Troubleshoot production denials  
✔ Create custom policy modules  

---

