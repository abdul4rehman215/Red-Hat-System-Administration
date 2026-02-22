# 🎓 Interview Q&A – Lab 01: Introduction to Red Hat Enterprise Linux

---

## 1️⃣ What is open-source software?

Open-source software is software whose source code is publicly available for use, modification, and redistribution under defined licensing terms. It promotes collaboration, transparency, and community-driven development.

---

## 2️⃣ What are the key principles of the Open Source Definition (OSI)?

The Open Source Definition includes principles such as:

- Free redistribution  
- Access to source code  
- Permission to create derived works  
- Integrity of the author’s source code  
- No discrimination against persons or fields of endeavor  

These ensure openness and fairness in software distribution.

---

## 3️⃣ What is the Linux kernel?

The Linux kernel is the core component of the Linux operating system. It manages:

- CPU scheduling  
- Memory allocation  
- Device drivers  
- Process management  
- Hardware communication  

It acts as the interface between hardware and user applications.

---

## 4️⃣ What command is used to check the Linux kernel version?

The kernel version can be checked using:

```bash
uname -r
````

This displays the currently running kernel version.

---

## 5️⃣ What is a Linux distribution?

A Linux distribution (distro) is a complete operating system built around the Linux kernel. It includes:

* Package manager
* System utilities
* Desktop environment (optional)
* Software repositories

Examples include RHEL, Ubuntu, Debian, and Fedora.

---

## 6️⃣ What is the difference between RHEL and Ubuntu?

| Feature         | RHEL               | Ubuntu                    |
| --------------- | ------------------ | ------------------------- |
| Support Model   | Subscription-based | Community / Paid          |
| Package Manager | dnf                | apt                       |
| Release Cycle   | 5–10 years         | 6 months (LTS available)  |
| Target Audience | Enterprise         | General / Cloud / Desktop |

RHEL focuses on stability and enterprise support, while Ubuntu emphasizes accessibility and rapid updates.

---

## 7️⃣ What is SELinux?

SELinux (Security-Enhanced Linux) is a mandatory access control (MAC) system integrated into the Linux kernel. It enforces security policies to restrict unauthorized access to system resources.

---

## 8️⃣ How do you check the status of SELinux?

Use the command:

```bash
sestatus
```

It shows whether SELinux is enabled, disabled, or enforcing.

---

## 9️⃣ What is the difference between enforcing and permissive mode in SELinux?

* **Enforcing**: Policies are actively enforced and violations are blocked.
* **Permissive**: Violations are logged but not blocked.
* **Disabled**: SELinux is completely turned off.

Enforcing mode provides maximum security.

---

## 🔟 What is the purpose of the subscription-manager tool in RHEL?

The `subscription-manager` tool is used to:

* Register a RHEL system
* Attach subscriptions
* Manage entitlements
* Verify consumed subscriptions
* Access official Red Hat repositories

It ensures the system receives updates and enterprise support.

---

## 1️⃣1️⃣ Why does RHEL require a subscription?

RHEL requires a subscription to:

* Access official software repositories
* Receive security updates
* Obtain enterprise-grade support
* Maintain compliance in production environments

The Red Hat Developer Subscription allows free access for learning purposes.

---

## 1️⃣2️⃣ What file provides OS distribution information?

The file:

```bash
/etc/os-release
```

contains detailed distribution information such as name, version, and ID.

---

## 1️⃣3️⃣ What is the package manager used in RHEL 9?

RHEL 9 uses:

```bash
dnf
```

DNF (Dandified YUM) is used to install, update, remove, and manage software packages.

---

## 1️⃣4️⃣ What happens if you use `< >` literally in shell commands?

In Linux shells, `<` and `>` are redirection operators. Using them literally without replacing placeholders can cause syntax errors, such as:

```
bash: syntax error near unexpected token `newline'
```

Placeholders must be replaced with actual values.

---

## 1️⃣5️⃣ Why is RHEL widely used in enterprises?

RHEL is widely adopted because of:

* Long-term support lifecycle
* Stability and predictable updates
* Enterprise security features (SELinux)
* Vendor support
* Compliance certifications
* Integration with enterprise cloud platforms

It is commonly used in production data centers and mission-critical environments.

---

📌 This Q&A reinforces foundational RHEL concepts required for RHCSA and enterprise Linux administration roles.
