# 🧪 Lab 37: Configuring I/O Scheduler

## 📌 Overview

This lab demonstrates how to:

- Identify the active Linux I/O scheduler
- Change disk scheduling algorithms
- Benchmark different schedulers
- Apply persistent configuration using udev
- Compare workload performance using fio and iostat

This is critical for optimizing storage performance in:

- Database servers
- Virtualized environments
- Container platforms
- High-throughput storage systems

---

## 🖥 Environment

- OS: CentOS Linux 7
- Kernel: 3.x (mq-enabled block layer)
- Disk: /dev/sda
- User: centos (sudo privileges)

---

## 🎯 Learning Objectives

✔ Understand Linux I/O scheduling  
✔ Identify available schedulers  
✔ Change scheduler dynamically  
✔ Make scheduler persistent  
✔ Benchmark sequential and random workloads  

---

## 📦 Available I/O Schedulers

| Scheduler     | Use Case |
|---------------|----------|
| mq-deadline   | Balanced server workloads |
| bfq           | Desktop interactivity |
| kyber         | Optimized for SSD/NVMe |
| none          | Minimal scheduling |

---

## 📂 Repository Structure

```
lab37-io-scheduler/
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🔬 What I Practiced

- Viewing scheduler:
  ```bash
  cat /sys/block/sda/queue/scheduler
  ```

- Switching scheduler:
  ```bash
  echo bfq | sudo tee /sys/block/sda/queue/scheduler
  ```

- Persistent configuration via udev
- Benchmarking with:
  - iostat
  - dd
  - fio

---

## 📊 Why It Matters

I/O scheduling directly impacts:

- Database latency
- Virtual machine performance
- Container storage throughput
- Disk contention behavior

Improper scheduler selection can:

- Increase latency
- Reduce IOPS
- Cause queue congestion

---

## 🏁 Final Outcome

By completing this lab, I can:

✔ Tune disk scheduling  
✔ Benchmark scheduler impact  
✔ Apply persistent disk configuration  
✔ Make informed scheduler decisions  

---
