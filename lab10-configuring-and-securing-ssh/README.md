# 🧪 Lab 10: Configuring and Securing SSH

---

## 📌 Lab Overview

This lab focuses on installing, configuring, and hardening the OpenSSH server on Red Hat Enterprise Linux 9. You will secure remote access by modifying SSH configurations, implementing key-based authentication, and configuring firewall rules.

Secure SSH configuration is a critical skill for Linux system administrators and security engineers.

---

## 🎯 Objectives

By the end of this lab, I was able to:

- ✔ Install and verify OpenSSH server
- ✔ Modify `/etc/ssh/sshd_config` securely
- ✔ Change default SSH port
- ✔ Disable root login
- ✔ Disable password authentication
- ✔ Implement key-based authentication
- ✔ Configure firewall rules for restricted SSH access

---

## 📋 Prerequisites

- Linux system (RHEL 9 used in this lab)
- sudo privileges
- Basic CLI familiarity
- firewalld running

---

## 🗂 Repository Structure

```

lab10-securing-ssh/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

# ✅ Task Overview

---

## 🔹 Task 1: Install and Verify OpenSSH

- Check SSH client version
- Install OpenSSH server
- Verify sshd service status

---

## 🔹 Task 2: Harden SSH Configuration

- Backup original sshd_config
- Change default port
- Disable root login
- Disable password authentication
- Allow specific user
- Restart SSH service
- Verify listening port

---

## 🔹 Task 3: Configure Key-Based Authentication

- Generate SSH key pair (client)
- Copy public key to server
- Test passwordless login
- Fix permission issues if necessary

---

## 🔹 Task 4: Configure Firewall

- Allow custom SSH port
- Reload firewall
- Verify active rules

---

# 🔐 Why This Matters (Security Relevance)

SSH is the primary remote administration method in Linux environments.

Hardening SSH:
- Prevents brute-force attacks
- Reduces attack surface
- Blocks unauthorized root access
- Enforces cryptographic authentication
- Protects enterprise systems from credential theft

In production, misconfigured SSH is one of the most exploited services.

---

# 🏁 Lab Conclusion

In this lab, I successfully:

- Secured SSH server configuration
- Implemented key-based authentication
- Disabled insecure login methods
- Restricted access via firewall
- Validated secure remote connectivity

These steps significantly improve system security posture.

---
