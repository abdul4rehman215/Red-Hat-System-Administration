# 🧪 Lab 30: Analyzing System Logs with journalctl

# 🎯 Objective

This lab focuses on centralized log management using `journalctl`.

By completing this lab, I:

- Queried system logs using time filters
- Filtered logs by systemd unit
- Analyzed logs by priority level
- Inspected logs by boot session
- Followed logs in real time
- Exported logs in JSON format
- Managed journal disk usage

---

# 📚 Concepts Covered

| Feature | Purpose |
|----------|---------|
| journalctl | View system logs |
| --since / --until | Time-based filtering |
| -u | Filter by systemd unit |
| -p | Filter by priority |
| -b | Filter by boot session |
| -f | Follow logs in real time |
| -o json | Structured output |
| --disk-usage | Log size analysis |
| --vacuum-size | Log retention management |

---

# 🧩 Tasks Overview

## Task 1 – Time & Unit Filtering
- Displayed all logs
- Queried logs from last hour
- Filtered logs between specific timestamps
- Filtered logs for ssh service

## Task 2 – Priority & Boot Analysis
- Displayed error-only logs
- Filtered warning and higher severity logs
- Listed boot sessions
- Queried logs from previous boot

## Task 3 – Advanced Log Handling
- Streamed logs in real-time
- Exported logs in JSON format
- Checked journal disk usage
- Vacuumed logs to limit storage

---


## 🖥 Environment
- OS: Ubuntu 24.04.1 LTS (Cloud Lab Environment)
- User: toor (sudo privileges)
- Init System: systemd 255
- Shell: Bash 5.2

--

# 📂 Repository Structure (Lab 10)

```
lab30-journalctl-analysis/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

# 🔎 Key Learning Outcomes

- Systemd-based centralized logging
- Time-bound forensic log analysis
- Incident investigation techniques
- Severity-based filtering
- Boot session diagnostics
- Log storage management

---

# 💼 Real-World Relevance

`journalctl` is critical for:

- Production server debugging
- Security investigations
- Service failure diagnostics
- Cloud infrastructure monitoring
- Incident response workflows

It replaces traditional `/var/log/*` file parsing with structured, queryable logs.

---

# 📌 Why This Matters

Efficient log analysis skills are required in:

- Linux System Administration
- DevOps Engineering
- Cloud Security
- SOC & Incident Response
- Reliability Engineering

---

# ✅ Result

Successfully:
- Queried logs by time and unit
- Filtered by priority
- Analyzed logs by boot
- Monitored logs live
- Managed journal storage

---

# 🚀 Lab Status: Completed Successfully
