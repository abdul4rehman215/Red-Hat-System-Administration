# 🧪 Lab 28: Using `at` Command for Scheduling

## 🎯 Objective

This lab demonstrates how to schedule **one-time tasks** in Linux using the `at` command.

By completing this lab, I learned to:

- Enable and manage the `atd` service
- Schedule one-time future jobs
- Use flexible time expressions
- Manage scheduled jobs using `atq` and `atrm`
- Inspect job spool files
- Implement practical backup automation

Unlike `cron`, which handles recurring tasks, `at` is used for single execution scheduling.

---

## 📌 Prerequisites

- CentOS / RHEL Linux system
- `at` package installed
- `atd` service enabled
- Bash shell access
- sudo privileges

---

**Environment:** CentOS Linux 7 (Core) – Cloud Lab Environment  
**User:** centos  
**Shell:** Bash 4.2  

---

## 🗂 Repository Structure

```
lab28-using-at-command/
│
├── README.md
├── commands.sh
├── scripts/
│   └── backup_script.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

# 🧩 Lab Tasks Overview

---

## 🔹 Task 1: Setup and Service Verification

### ✔ Enable and Start atd Service

```bash
sudo systemctl enable --now atd
systemctl status atd
```

Confirmed service is active and running.

---

### ✔ Verify `at` Installation

```bash
at -V
```

Confirmed version installed and ready.

---

## 🔹 Task 2: Schedule a One-Time Backup Task

### ✔ Created Backup Script

```bash
echo "Backup started at $(date)" >> ~/backups/backup_log.txt
tar -czf ~/backups/home_backup_$(date +%Y%m%d).tar.gz ~/Documents
echo "Backup completed at $(date)" >> ~/backups/backup_log.txt
```

---

### ✔ Scheduled Script Execution

```bash
at now + 5 minutes -f ~/backup_script.sh
```

Verified with:

```bash
atq
```

---

## 🔹 Task 3: Advanced Time Formats

Examples used:

```bash
at 11:30 PM tomorrow
at 9:00 AM next week
at now + 1 hour
```

Demonstrated flexible scheduling capability.

---

## 🔹 Task 4: Managing Jobs

### ✔ List Scheduled Jobs

```bash
atq
```

### ✔ Remove Job

```bash
atrm JOB_ID
```

### ✔ Inspect Job File

```bash
sudo ls /var/spool/at
sudo cat /var/spool/at/<jobfile>
```

Observed how `at` stores execution commands internally.

---

# 🧠 Key Concepts Learned

| Command | Purpose |
|----------|----------|
| at | Schedule one-time task |
| atq | List scheduled jobs |
| atrm | Remove scheduled job |
| atd | at daemon service |
| now + 5 minutes | Relative time scheduling |
| tomorrow | Natural language scheduling |

---

# 💡 Real-World Relevance

The `at` command is used for:

- Delayed maintenance tasks
- Temporary scheduling
- One-time system operations
- Post-deployment scripts
- Incident response delayed actions
- Scheduled testing tasks

It is particularly useful when recurring scheduling (cron) is not required.

---

# 📊 Result

✔ Enabled and verified atd service  
✔ Scheduled one-time backup task  
✔ Used flexible time expressions  
✔ Managed jobs using atq and atrm  
✔ Inspected spool files  

---

# 🏁 Conclusion

This lab strengthened my understanding of deferred task execution using `at`. Mastering both `cron` and `at` provides complete Linux scheduling control for automation and operations.

---
