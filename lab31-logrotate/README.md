# 🧪 Lab 31: Log Rotation with logrotate

# 🎯 Objective

This lab focuses on configuring and validating **log rotation policies** using `logrotate` to prevent disk space exhaustion caused by growing log files.

By completing this lab, I:

- Verified logrotate installation
- Examined default logrotate configuration
- Created a custom log rotation policy
- Forced manual log rotation
- Simulated log growth
- Verified compression and rotation behavior

---

# 📚 Concepts Covered

| Feature | Purpose |
|----------|---------|
| logrotate.conf | Global rotation settings |
| /etc/logrotate.d/ | Custom per-service configs |
| rotate | Number of old logs to keep |
| compress | Compress rotated logs |
| delaycompress | Delay compression by one cycle |
| missingok | Ignore missing logs |
| notifempty | Skip empty logs |
| postrotate | Execute commands after rotation |
| --force | Manually trigger rotation |
| --debug | Test configuration safely |

---

# 🧩 Tasks Overview

## Task 1 – Configure Custom Log Rotation
- Examined `/etc/logrotate.conf`
- Reviewed existing rotation configs
- Created `/etc/logrotate.d/mycustomlogs`
- Validated configuration syntax

## Task 2 – Manual Log Rotation
- Performed dry run with `--debug`
- Forced actual rotation
- Verified compressed rotated logs

## Task 3 – Simulated Log Growth
- Generated large test logs
- Verified size increase
- Forced rotation again
- Confirmed multiple compressed archives

---

## 🖥 Environment
- OS: CentOS Linux 7 (Core)
- User: centos (sudo privileges)
- Shell: Bash 4.2
- Log Utility: logrotate 3.8.6

---

# 📂 Repository Structure (Lab 11)

```
lab-31-logrotate/
│
├── README.md
├── commands.sh
├── configs/
│   └── mycustomlogs.conf
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

# 🔎 Key Learning Outcomes

- How logrotate prevents disk exhaustion
- Understanding rotation lifecycle
- Implementing compression policies
- Using postrotate scripts
- Testing configurations safely
- Validating rotation behavior manually

---

# 💼 Real-World Relevance

Log rotation is critical for:

- Production servers
- Application logging
- SIEM ingestion pipelines
- Compliance requirements
- Cloud infrastructure maintenance

Without rotation, log files can:
- Fill disks
- Crash services
- Cause system outages

---

# 📌 Why This Matters

Log management is essential in:

- Linux System Administration
- DevOps Engineering
- Cloud Operations
- Security Monitoring
- Incident Response

---

# ✅ Result

Successfully:

- Created custom rotation policy
- Forced log rotation manually
- Verified compressed archives
- Simulated production log growth
- Validated rotation cleanup behavior

---

# 🚀 Lab Status: Completed Successfully
