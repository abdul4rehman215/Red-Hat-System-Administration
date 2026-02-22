# 🧪 Lab 01 – Introduction to Red Hat Enterprise Linux (RHEL)

## 🎯 Lab Overview

This lab introduces the foundational concepts behind **open-source software**, the **Linux operating system**, and the characteristics of **Red Hat Enterprise Linux (RHEL)**.

The focus of this lab is conceptual understanding combined with real terminal verification using RHEL 9.

---

## 🎯 Objectives

By completing this lab, I achieved the following:

- Understood the core principles of open-source software.
- Explored Linux as an open-source operating system.
- Identified major Linux distributions and their use cases.
- Examined RHEL-specific characteristics.
- Configured and verified a Red Hat subscription.
- Verified SELinux enforcement status.

---

## 📚 Prerequisites

- Internet connectivity
- Access to a RHEL 9 system
- Terminal (CLI) access
- Basic familiarity with Linux commands

---

## 🖥️ Lab Environment

| Component | Details |
|------------|----------|
| OS | Red Hat Enterprise Linux 9.3 (Plow) |
| Kernel Version | 5.14.0-362.24.1.el9_3.x86_64 |
| Architecture | x86_64 |
| Package Manager | dnf |
| Security Module | SELinux (Enforcing Mode) |
| Subscription | Red Hat Developer Subscription |

---

## 📁 Repository Structure

lab01-introduction-to-red-hat-enterprise-linux/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

---

# ✅ Task Overview

---

## 🟢 Task 1 – Understanding Open Source and Linux

### 🔹 Subtask 1.1 – Define Open Source

- Used `curl` to retrieve the Open Source Definition.
- Reviewed OSI principles including:
  - Free Redistribution
  - Source Code Availability
  - Derived Works
  - Integrity of Author's Source Code

### 🔹 Subtask 1.2 – Introduction to Linux

- Verified Linux kernel version using `uname -r`
- Discussed:
  - Kernel responsibilities
  - GNU utilities
  - Shell environment

---

## 🟢 Task 2 – Exploring Linux Distributions

### 🔹 Subtask 2.1 – Identify Linux Distribution

- Used `cat /etc/os-release`
- Confirmed system running:
  - Red Hat Enterprise Linux 9.3

### 🔹 Subtask 2.2 – Compare Distributions

| Feature | RHEL | Ubuntu |
|----------|--------|----------|
| Support | Paid / Subscription | Community / Paid |
| Package Manager | dnf | apt |
| Release Cycle | 5–10 years | 6 months (LTS available) |

---

## 🟢 Task 3 – RHEL Characteristics and Subscription Model

### 🔹 Subtask 3.1 – RHEL Features

- Verified SELinux status using `sestatus`
- Confirmed:
  - SELinux Enabled
  - Mode: Enforcing
  - Policy: Targeted

### 🔹 Subtask 3.2 – RHEL Subscription

- Registered system using `subscription-manager`
- Attached subscription automatically
- Verified active subscription
- Confirmed Developer Subscription active

---

# 📊 Result

- System successfully registered with Red Hat.
- Active subscription attached.
- SELinux confirmed enforcing.
- Kernel version verified.
- Distribution information validated.

All foundational checks completed successfully.

---

# 🧠 What I Learned

- The legal and operational principles behind open-source software.
- How Linux distributions differ in support models and lifecycle.
- RHEL’s enterprise-oriented architecture.
- The importance of subscriptions in accessing enterprise repositories.
- The role of SELinux in system-level security enforcement.

---

# 🛡️ Why This Matters

Understanding RHEL fundamentals is critical for:

- Enterprise system administration
- Red Hat certification preparation (RHCSA)
- Secure server deployment
- Compliance-based environments
- Production infrastructure management

RHEL is widely used in:

- Government systems
- Financial institutions
- Enterprise cloud platforms
- Data centers

---

# 🌍 Real-World Applications

- Registering production RHEL servers
- Attaching valid subscriptions for update access
- Enabling security policies with SELinux
- Verifying enterprise compliance posture
- Managing long-term supported Linux systems

---

# 🔎 Real-World Relevance

This lab mirrors real enterprise onboarding procedures:

- Verifying OS integrity
- Registering systems with vendor support
- Ensuring valid licensing
- Confirming security enforcement modules

These are foundational skills required for:

- Linux System Administrator
- Red Hat Certified System Administrator (RHCSA)
- Cloud Infrastructure Engineer
- DevOps Engineer

---

# 🏁 Conclusion

In this lab, I:

✔ Defined open-source principles  
✔ Explored Linux kernel fundamentals  
✔ Identified Linux distributions  
✔ Compared RHEL with Ubuntu  
✔ Verified SELinux enforcement  
✔ Registered and attached a Red Hat subscription  

This lab established the foundational understanding required before performing advanced RHEL administration tasks.

---

📌 All commands executed are provided in `commands.sh`  
📌 Full outputs are documented in `output.txt`
📌 Interview preparation questions are included in `interview_qna.md`
📌 Troubleshooting steps are provided in `troubleshooting.md`
