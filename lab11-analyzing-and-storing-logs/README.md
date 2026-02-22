# 🧪 Lab 11: Analyzing and Storing Logs

---

## 📌 Lab Overview

This lab focuses on system log analysis and management in Red Hat Enterprise Linux 9. You will explore traditional log files in `/var/log`, use `journalctl` for structured log filtering, configure `logrotate`, and perform advanced log searches using `grep` and `awk`.

Log analysis is a core skill in Linux system administration, troubleshooting, and security monitoring.

---

## 🎯 Objectives

By the end of this lab, I was able to:

- ✔ Locate and interpret system logs
- ✔ Explore `/var/log` directory structure
- ✔ Use `journalctl` with filters (time, service, follow mode)
- ✔ Understand and configure `logrotate`
- ✔ Search logs using `grep`
- ✔ Perform structured parsing using `awk`
- ✔ Inspect container logs using Podman

---

## 📋 Prerequisites

- RHEL/CentOS/Fedora system (RHEL 9 used here)
- Basic CLI proficiency
- sudo privileges
- Podman installed

---

## 🗂 Repository Structure

```
lab11-analyzing-logs/
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

## 🔹 Task 1: Explore `/var/log`

- List system log files
- Inspect `/var/log/messages`
- Inspect `/var/log/secure`

---

## 🔹 Task 2: Use `journalctl`

- View full system journal
- Filter by time
- Filter by service
- Follow logs in real-time

---

## 🔹 Task 3: Understand `logrotate`

- View global configuration
- Inspect `/etc/logrotate.d/`
- Create custom log rotation policy
- Perform dry-run test

---

## 🔹 Task 4: Log Searching & Parsing

- Search logs using `grep`
- Perform case-insensitive searches
- Count occurrences
- Extract structured data using `awk`
- Inspect container logs with Podman

---

# 🔎 Why Log Analysis Matters (Security Relevance)

Logs are critical for:

- Incident response
- Detecting brute-force attempts
- Troubleshooting service failures
- Identifying configuration errors
- Monitoring container behavior
- Compliance auditing

Without log analysis, system visibility is severely limited.

---

# 🏁 Lab Conclusion

In this lab, you successfully:

- Navigated and interpreted system logs
- Used `journalctl` advanced filtering
- Configured and tested `logrotate`
- Applied `grep` and `awk` for analysis
- Inspected container logs

These skills are essential for Linux administrators, DevOps engineers, and security professionals.

---

# 🚀 Next Steps

- Use `journalctl -o json` for structured output
- Build custom awk parsing scripts
- Configure centralized logging (ELK stack)
- Explore rsyslog forwarding
- Monitor log disk usage proactively

---
