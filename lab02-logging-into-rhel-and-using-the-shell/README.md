# 🧪 Lab 02 – Logging into RHEL and Using the Shell

# 🎯 Lab Overview

This lab focuses on fundamental system access and shell interaction in Red Hat Enterprise Linux (RHEL).

It covers:

- Local console login
- Remote login using SSH
- Basic shell navigation commands
- Using manual pages
- Exiting sessions properly
- Customizing the Bash shell prompt using the PS1 variable

These skills form the foundation of all Linux system administration tasks.

---

# 🎯 Objectives

By completing this lab, I was able to:

- Log into a RHEL system locally via console.
- Connect remotely to a RHEL system using SSH.
- Execute core shell commands such as:
  - `pwd`
  - `ls`
  - `man`
  - `exit`
- Customize and persist the Bash prompt using the `PS1` variable.

---

# 📚 Prerequisites

- RHEL 8 or RHEL 9 system (VM or physical)
- Network connectivity
- User account with standard privileges
- SSH server installed and running for remote login

---

# 🖥️ Lab Environment

| Component | Details |
|------------|----------|
| OS | Red Hat Enterprise Linux 9.3 (Plow) |
| Kernel | 5.14.0-362.24.1.el9_3.x86_64 |
| User Account | student |
| Remote Client | Linux-based system |
| SSH Service | OpenSSH (sshd) |
| Network Interface | eth0 |
| IP Address | 10.0.2.15 |

---

## 📁 Repository Structure

```
lab02-logging-into-rhel-and-using-the-shell/
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

## 🟢 Task 1 – Local Console Login

- Powered on the RHEL system.
- Logged in via TTY console.
- Verified successful authentication.
- Confirmed shell prompt availability.

Key Learning:
Understanding Linux login mechanisms and terminal-based access.

---

## 🟢 Task 2 – Remote SSH Login

- Verified `sshd` service status.
- Identified system IP address using `ip a`.
- Connected remotely via SSH.
- Accepted host fingerprint.
- Authenticated successfully.
- Verified remote session prompt.

This mirrors real-world remote administration practices.

---

## 🟢 Task 3 – Basic Shell Commands

Practiced essential Linux commands:

| Command | Purpose |
|----------|----------|
| `pwd` | Print working directory |
| `ls` | List directory contents |
| `ls -lh` | Long listing (human readable) |
| `ls -a` | Show hidden files |
| `man` | Access manual documentation |
| `exit` | Close session |

These commands are foundational for Linux navigation and system interaction.

---

## 🟢 Task 4 – Customize Shell Prompt (PS1)

- Viewed default `PS1` variable.
- Modified prompt to include:
  - Username
  - Hostname
  - Working directory
  - Current time
- Made changes persistent via `~/.bashrc`.
- Reloaded configuration using `source ~/.bashrc`.

Common PS1 Variables Used:

| Symbol | Meaning |
|--------|----------|
| `\u` | Username |
| `\h` | Hostname |
| `\W` | Current directory |
| `\t` | Current time |

---

# 📊 Result

✔ Successfully logged in locally via console  
✔ Successfully connected remotely using SSH  
✔ Verified active SSH service  
✔ Practiced essential navigation commands  
✔ Customized shell prompt temporarily and permanently  
✔ Confirmed prompt persistence  

---

# 🧠 What I Learned

- The difference between local and remote login sessions.
- How SSH authentication and host verification work.
- The importance of checking system services before remote access.
- Practical shell navigation fundamentals.
- How Bash prompt customization improves usability.
- How `.bashrc` controls persistent shell behavior.

---

# 🛡️ Why This Matters

Every Linux system administrator must:

- Access systems remotely
- Troubleshoot SSH connectivity
- Navigate efficiently in the shell
- Understand service status
- Customize working environments for productivity

SSH is the backbone of remote Linux management.

---

# 🌍 Real-World Applications

- Managing cloud servers remotely
- Administering production Linux servers
- Connecting to enterprise environments
- Performing secure remote troubleshooting
- Automating tasks via shell environments
- Customizing admin environments for efficiency

---

# 🔎 Real-World Relevance

This lab simulates daily responsibilities of:

- Linux System Administrator
- Cloud Engineer
- DevOps Engineer
- Infrastructure Engineer
- RHCSA Candidate

Remote login, command navigation, and shell customization are used daily in enterprise environments.

---

# 🏁 Conclusion

In this lab, I:

✔ Logged into RHEL locally  
✔ Connected remotely using SSH  
✔ Verified SSH service functionality  
✔ Practiced core shell commands  
✔ Customized and persisted the Bash prompt  

These foundational skills are essential for all advanced Linux and Red Hat administration tasks.

---

📌 All commands executed are provided in `commands.sh`  
📌 Full terminal outputs are documented in `output.txt`  
📌 Interview preparation questions are included in `interview_qna.md`  
📌 Troubleshooting scenarios are detailed in `troubleshooting.md`
