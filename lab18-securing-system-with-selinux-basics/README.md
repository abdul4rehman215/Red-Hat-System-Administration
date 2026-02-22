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
