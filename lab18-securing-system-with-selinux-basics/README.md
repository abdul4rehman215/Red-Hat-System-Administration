# 🧪 Lab 18: Securing the System with SELinux Basics

---

## 🎯 Objectives

By the end of this lab, I was able to:

• Understand SELinux security contexts  
• Interpret context components (user, role, type, level)  
• Modify file contexts temporarily using `chcon`  
• Restore default contexts using `restorecon`  
• Analyze AVC denials using `ausearch`  
• Interpret denial messages with `sealert`  
• Apply persistent context fixes using `semanage`  
• Toggle enforcing and permissive modes safely  

---

## 🖥 Environment

- RHEL 9
- SELinux enabled (targeted policy)
- Enforcing mode active
- sudo privileges
- httpd installed for testing

---

## 🛠 Tools Used

| Category | Tool |
|----------|------|
| Status Check | sestatus |
| Context View | ls -Z |
| Context Modify | chcon |
| Restore Defaults | restorecon |
| Audit Logs | ausearch |
| Human-readable Analysis | sealert |
| Persistent Labeling | semanage |
| Mode Toggle | setenforce |

---

## 📂 Repository Structure

```

lab18-selinux-basics/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

# 📌 Task Overview

This lab walks through the practical fundamentals of SELinux on RHEL systems.

You performed the following:

* Verified SELinux status and enforcement mode
* Installed SELinux troubleshooting tools
* Viewed and interpreted SELinux security contexts
* Modified file contexts temporarily using `chcon`
* Restored default contexts using `restorecon`
* Generated a real AVC denial using httpd
* Analyzed the denial using `ausearch`
* Interpreted recommendations using `sealert`
* Applied a persistent fix using `semanage`
* Switched between enforcing and permissive modes for testing

This lab demonstrates how SELinux enforces Mandatory Access Control and how to properly troubleshoot context-related access issues.

---

## 📌 Key Concepts

SELinux uses:

```
user:role:type:level
```

Example:

```
unconfined_u:object_r:user_tmp_t:s0
```

Most critical field:

✔ **Type** → Determines access control rules

---

## 🚀 Why This Lab Matters

SELinux provides:

• Mandatory Access Control (MAC)  
• Service isolation  
• Protection against privilege escalation  
• Fine-grained security enforcement  

Essential for:

• Production RHEL systems  
• Web servers  
• OpenShift clusters  
• Container workloads  

---

✔ Lab 18 introduces real-world SELinux troubleshooting and enforcement workflows.

# 🎉 Conclusion

In this lab, you:

✔ Verified SELinux status and enforcement mode
✔ Viewed and interpreted SELinux contexts
✔ Modified file contexts using `chcon`
✔ Restored default labeling using `restorecon`
✔ Generated and analyzed an AVC denial
✔ Used `ausearch` and `sealert` for log analysis
✔ Applied persistent labeling with `semanage`
✔ Safely toggled between enforcing and permissive modes

You now understand how SELinux:

• Enforces Mandatory Access Control
• Protects services like httpd from unauthorized file access
• Prevents privilege escalation
• Isolated services based on type enforcement

These skills are critical for:

• Securing production RHEL systems
• Hardening web servers
• Troubleshooting OpenShift environments
• Maintaining compliance in enterprise Linux systems

✔ SELinux is enabled, enforcing, and properly configured.
