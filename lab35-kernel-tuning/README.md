## 🧪 Lab 35 - Tuning Kernel Parameters with `sysctl`

### 📍 Environment

* **OS:** Ubuntu 24.04.1 LTS
* **Kernel:** Linux 6.x
* **User:** toor (sudo privileges)
* **Tool Used:** `sysctl`

---

## 🎯 Overview

This lab demonstrates practical **Linux kernel tuning using sysctl**, focusing on:

* Runtime modification of kernel parameters
* Network stack optimization
* Memory management tuning
* File descriptor scaling
* Persistent configuration management

The lab simulates real-world production scenarios such as:

* High-traffic web servers
* Containerized workloads (Kubernetes/OpenShift)
* Database servers
* Performance-sensitive infrastructure

---

## 🧠 Key Skills Demonstrated

| Category               | Skills Applied                      |
| ---------------------- | ----------------------------------- |
| Kernel Administration  | Viewing runtime parameters          |
| Performance Tuning     | Memory + network optimization       |
| DevOps Operations      | Persistent configuration management |
| Infrastructure Scaling | File descriptor and backlog tuning  |
| System Stability       | Safe testing + rollback methods     |

---

## 🛠 Core Concepts Covered

### 1️⃣ Viewing Kernel Parameters

* `sysctl -a`
* Inspecting specific parameters like:

  * `vm.swappiness`
  * `net.core.somaxconn`
  * `net.ipv4.tcp_fastopen`
  * `fs.file-max`

---

### 2️⃣ Runtime Kernel Tuning

Using:

```bash
sudo sysctl -w parameter=value
```

Example:

```bash
sudo sysctl -w vm.swappiness=10
```

These changes:

* Apply immediately
* Do NOT persist after reboot

---

### 3️⃣ Network Optimization

* Increased connection backlog:

  ```
  net.core.somaxconn
  ```
* Enabled TCP Fast Open:

  ```
  net.ipv4.tcp_fastopen=3
  ```

Used in:

* High concurrency systems
* Load-balanced environments
* Microservices architectures

---

### 4️⃣ Memory Management Tuning

* Reduced swapping behavior:

  ```
  vm.swappiness=10
  ```
* Increased file descriptor limits:

  ```
  fs.file-max=2097152
  ```

Critical for:

* Web servers
* API gateways
* High-connection databases

---

### 5️⃣ Persistent Configuration Methods

#### Method 1: `/etc/sysctl.conf`

System-wide persistent configuration.

#### Method 2 (Recommended): `/etc/sysctl.d/`

Modular configuration:

```
/etc/sysctl.d/99-custom.conf
```

Applied using:

```bash
sudo sysctl --system
```

---

## 🔍 Monitoring & Validation Tools Used

* `vmstat`
* `netstat -s`
* `dstat`
* `sysctl --system`
* `sysctl -p`

---

## 📊 Production Relevance

Kernel tuning is essential for:

* Scaling Linux servers under high load
* Optimizing container platforms
* Reducing latency in distributed systems
* Increasing system reliability
* Preventing resource exhaustion

In real infrastructure environments, improper kernel tuning can cause:

* Memory thrashing
* Connection drops
* File descriptor exhaustion
* Service instability

This lab demonstrates safe, controlled, and reversible tuning.

---

## 🔐 Safety & Best Practices Applied

✔ Tested runtime before persistence
✔ Verified parameter support
✔ Used modular configuration files
✔ Applied changes without reboot
✔ Included rollback method

---

## 🚀 Outcome

After completing this lab, you can:

* Safely tune Linux kernel parameters
* Optimize system performance
* Configure persistent kernel settings
* Troubleshoot sysctl-related issues
* Apply kernel tuning in production-grade systems

---

## 📌 Repository Structure

```
lab35-kernel-tuning/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🏁 Status

✅ Lab Completed
📦 Production-Ready Documentation
🔧 Real-World Applicable Skills Demonstrated
