# 🧪 Lab 12: Configuring Network Interfaces

---

## 📌 Lab Overview

This lab focuses on configuring and managing network interfaces in Red Hat Enterprise Linux 9 using CLI tools, primarily `nmcli` and `systemctl`.

You will configure static IP addresses, modify connection profiles, manage DNS settings, restart NetworkManager, and verify connectivity.

Network configuration is a critical skill for system administrators, DevOps engineers, and container platform operators.

---

## 🎯 Objectives

By the end of this lab, I was able to:

- ✔ View network interfaces using CLI tools
- ✔ Manage connections using `nmcli`
- ✔ Configure static IP addresses
- ✔ Modify connection profiles (MTU, IPv6, DNS)
- ✔ Restart NetworkManager
- ✔ Configure hostname and DNS
- ✔ Verify network connectivity

---

## 📋 Prerequisites

- RHEL 9 system
- sudo privileges
- NetworkManager running
- Basic CLI familiarity

---

## 🗂 Repository Structure

```

lab12-network-configuration/
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

## 🔹 Task 1: List Network Devices
- Use `nmcli device status`
- Inspect detailed interface configuration

---

## 🔹 Task 2: Configure Static IP
- Identify connection profile
- Modify IPv4 settings
- Apply configuration

---

## 🔹 Task 3: Modify Connection Profile
- View IPv4 settings
- Change MTU
- Disable IPv6

---

## 🔹 Task 4: Restart NetworkManager
- Restart service
- Verify service state

---

## 🔹 Task 5: Hostname & DNS Configuration
- Set static hostname
- Configure DNS servers
- Ignore automatic DNS
- Verify resolution

---

# 🔎 Why This Lab Matters

Network configuration is foundational for:

- Server deployment
- Container networking
- Kubernetes/OpenShift nodes
- Cloud infrastructure management
- Troubleshooting connectivity issues

Misconfigured networking can break entire environments.

---

# 🏁 Lab Conclusion

In this lab, I configured and verified network settings using modern RHEL networking tools.

I now understand:

- How NetworkManager manages interfaces
- How to configure static IP addresses
- How to modify DNS and connection profiles
- How to verify network functionality

These are essential production-level Linux skills.

---
