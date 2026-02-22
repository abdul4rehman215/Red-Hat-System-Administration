# 🧪 Lab 25: Job Control

## 🎯 Objective

This lab focuses on mastering Linux job control mechanisms within a Bash shell environment.

Key goals achieved:

- Understanding foreground vs background processes
- Managing jobs using `&`, `jobs`, `fg`, `bg`
- Sending signals using `kill` and `kill -9`
- Suspending and resuming processes
- Applying job control concepts to container management (Podman)

This lab builds foundational Linux process management skills required for system administration and DevOps roles.

---

## 📌 Prerequisites

- Bash shell environment
- Basic Linux command familiarity
- Understanding of processes and PIDs
- Podman installed
- Standard user permissions

---

**Environment:** CentOS Linux 7 (Core) – Cloud Lab Environment  
**User:** centos  
**Shell:** Bash 4.2  

---

## 🗂 Repository Structure

```
lab25-job-control/
│
├── README.md
├── commands.sh
├── scripts/
│   └── signals_reference.txt
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

# 🧩 Lab Tasks Overview

---

## 🔹 Task 1: Starting Background Processes

### ✔ Launch Background Job
```bash
sleep 300 &
```

Observed:
- Job number
- Process ID (PID)

### ✔ Verify Active Jobs
```bash
jobs
```

Understood relationship between job ID and PID.

---

## 🔹 Task 2: Managing Job States

### ✔ Bring Job to Foreground
```bash
fg %1
```

### ✔ Suspend with:
```
Ctrl + Z
```

### ✔ Resume in Background
```bash
bg %1
```

Learned job suspension and continuation mechanics.

---

## 🔹 Task 3: Process Termination

### ✔ Graceful Termination (SIGTERM)
```bash
kill PID
```

### ✔ Force Termination (SIGKILL)
```bash
kill -9 PID
```

### ✔ View Jobs with PIDs
```bash
jobs -l
```

Understood signal-based process control.

---

## 🚀 Advanced Task: Job Control with Containers

### ✔ Run Container in Detached Mode
```bash
podman run -d --name lab_nginx nginx
```

### ✔ Stop Container
```bash
podman stop lab_nginx
```

Applied job control concepts to container lifecycle management.

---

# 🧠 Key Concepts Learned

| Concept | Description |
|----------|-------------|
| Foreground Process | Runs attached to terminal |
| Background Process | Runs independently of terminal input |
| `&` | Starts process in background |
| `jobs` | Lists background jobs |
| `fg` | Brings job to foreground |
| `bg` | Resumes suspended job |
| `kill` | Sends signal to process |
| `SIGTERM (15)` | Graceful termination |
| `SIGKILL (9)` | Force termination |
| `Ctrl + Z` | Suspend foreground job |

---

# 💡 Real-World Relevance

Job control is essential for:

- Linux system administration
- Troubleshooting hung processes
- Managing long-running tasks
- DevOps automation
- Container lifecycle operations
- Incident response scenarios

Every Linux administrator must understand job control deeply.

---

# 📊 Result

✔ Successfully managed background processes  
✔ Suspended and resumed jobs  
✔ Terminated processes properly  
✔ Understood signal handling  
✔ Applied process control to containers  

---

# 🧹 Cleanup

```bash
cd ..
rm -rf job_control_lab
podman rm -f lab_nginx 2>/dev/null
```

---

# 🏁 Conclusion

This lab strengthened my understanding of Linux process and job control mechanisms.  
These skills are fundamental for advanced Linux administration, troubleshooting, DevOps, and RHCSA-level certifications.

---
