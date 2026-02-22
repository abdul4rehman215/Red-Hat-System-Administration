# 🧪 Lab 09: Managing Services with systemd

## 📌 Lab Overview

This lab focuses on managing system services using **systemd**, the default init system in Red Hat Enterprise Linux (RHEL 9). You will learn how to monitor, control, enable, disable, inspect, and troubleshoot services using `systemctl` and `journalctl`.

Service management is a core responsibility of Linux system administrators in enterprise environments.

---

## 🎯 Objectives

By the end of this lab, I was able to:

- ✔ Control and monitor services using `systemctl`
- ✔ Check service status
- ✔ Start, stop, and restart services
- ✔ Enable and disable services at boot
- ✔ Inspect unit files and dependencies
- ✔ View and filter logs using `journalctl`

---

## 📋 Prerequisites

- Linux system with systemd (RHEL 9 used in this lab)
- Root or sudo privileges
- Basic CLI familiarity

---

## 🗂 Repository Structure

```

lab09-managing-services/
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

## 🔹 Task 1: Check Service Status

- List running services
- Inspect specific service status (`sshd`)
- Understand LOAD, ACTIVE, and SUB states

---

## 🔹 Task 2: Start, Stop, and Restart Services

- Stop a running service
- Start it again
- Restart it
- Verify changes

---

## 🔹 Task 3: Enable and Disable Services at Boot

- Enable service to start at boot
- Disable service from starting at boot
- Understand symbolic links created in systemd targets

---

## 🔹 Task 4: Inspect Unit Files

- View unit configuration using `systemctl cat`
- Inspect dependency tree using `systemctl list-dependencies`

---

## 🔹 Task 5: View Logs with journalctl

- View service logs
- Filter logs by time
- Follow logs in real-time

---

# 🧠 Why This Matters (Real-World Relevance)

- Essential for managing production servers
- Critical for troubleshooting failed services
- Required for DevOps, SRE, and Linux admin roles
- Fundamental in container orchestration environments
- Important for security monitoring and auditing

---

# 🏁 Lab Conclusion

In this lab, I successfully:

- Managed services using `systemctl`
- Controlled service lifecycle
- Configured boot-time behavior
- Inspected unit configurations
- Used `journalctl` for log analysis

These skills are mandatory for enterprise Linux system administration.

---
