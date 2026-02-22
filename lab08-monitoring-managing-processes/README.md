# 🧪 Lab 08: Monitoring and Managing Processes

---

## 🎯 Objectives

By the end of this lab, I was able to:

- View and inspect running processes
- Monitor system performance using `ps`, `top`, and `htop`
- Send signals using `kill`, `pkill`, and `killall`
- Manage job control using `bg`, `fg`, and `jobs`
- Adjust process priority using `nice` and `renice`

---

## 🖥️ Lab Environment

- OS: Red Hat Enterprise Linux 9.x
- Shell: Bash
- User: `student`
- Privileges: sudo access required
- Monitoring Tools: `ps`, `top`, `htop`
- Process Control Tools: `kill`, `pkill`, `nice`, `renice`

---

## 📂 Repository Structure

```

lab08-monitoring-managing-processes/
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

## 🔎 Task 1: Viewing Processes

### 🔹 Using `ps`
- Listed all processes using `ps aux`
- Filtered specific processes with `grep`
- Identified columns: USER, PID, CPU, MEMORY, COMMAND

### 🔹 Using `top`
- Monitored system load in real time
- Sorted by memory usage (Shift + M)
- Observed CPU, memory, and task statistics

### 🔹 Using `htop`
- Interactive process viewer
- Sorted processes dynamically
- Used function keys (F6 sort, F10 exit)

📌 Learned difference between snapshot (`ps`) and live monitoring (`top`/`htop`).

---

## 🔔 Task 2: Sending Signals to Processes

### 🔹 Using `kill`
- Sent SIGTERM (default)
- Used `kill -9` (SIGKILL) for force termination

### 🔹 Using `pkill`
- Terminated processes by name

📌 Understood difference between graceful termination and force kill.

---

## 🔄 Task 3: Job Control

- Started background jobs using `&`
- Listed jobs using `jobs`
- Brought job to foreground using `fg`
- Suspended using `Ctrl + Z`
- Resumed in background using `bg`

📌 Learned shell-level job management.

---

## ⚡ Task 4: Adjusting Process Priority

### 🔹 Using `nice`
- Started process with custom nice value

### 🔹 Using `renice`
- Modified priority of running process
- Verified using `ps -o pid,ni,cmd`

📌 Understood Linux scheduling priority system (-20 to 19).

---

# 🧠 Core Commands Practiced

| Command | Purpose |
|----------|----------|
| ps aux | List all processes |
| top | Live process monitor |
| htop | Interactive monitor |
| kill | Send signal to PID |
| pkill | Kill by process name |
| jobs | List background jobs |
| fg | Bring job to foreground |
| bg | Resume job in background |
| nice | Start process with priority |
| renice | Modify running process priority |

---

# 🔐 Security & Administration Relevance

Process management is critical for:

- Detecting malicious processes
- Identifying resource exhaustion
- Troubleshooting performance issues
- Managing runaway scripts
- Monitoring container workloads
- Incident response in Linux systems

---

# 💼 Real-World Applications

These skills are essential for:

- Linux System Administrators
- DevOps Engineers
- Cloud Infrastructure Engineers
- Security Analysts
- Site Reliability Engineers (SRE)

Understanding process control is foundational for container orchestration and resource management.

---

# 🏁 Conclusion

In this lab, I successfully:

✔ Monitored system processes  
✔ Terminated processes safely and forcefully  
✔ Managed shell job control  
✔ Adjusted process priorities  

I now understand Linux process lifecycle management and scheduling behavior.

---
