# 🧪 Lab 29: Systemd Timers for Task Scheduling

# 🎯 Objective

This lab focuses on replacing traditional cron-based scheduling with modern **systemd timers**.

By completing this lab, I:

- Created custom systemd service units
- Configured timer units using `OnCalendar`
- Tested calendar expressions using `systemd-analyze`
- Implemented randomized delays
- Monitored execution using `journalctl`
- Modified and reloaded timer configurations

---

# 📚 What This Lab Covers

| Concept | Description |
|----------|-------------|
| systemd service units | Define what action runs |
| systemd timer units | Define when action runs |
| OnCalendar | Calendar-based scheduling |
| Persistent=true | Ensures missed runs execute after reboot |
| RandomizedDelaySec | Adds execution jitter |
| journalctl | Logs and monitoring |

---

# 🧩 Tasks Overview

## Task 1 – Create Maintenance Timer
- Created `maintenance.service`
- Created `maintenance.timer`
- Enabled and started timer
- Verified execution schedule

## Task 2 – Complex Calendar Scheduling
- Created `backup.timer`
- Used specific weekday scheduling
- Validated calendar syntax

## Task 3 – Modify Timer Behavior
- Changed schedule to hourly
- Added randomized delay
- Reloaded systemd daemon
- Verified new trigger time

---

# 📂 Repository Structure

```
lab29-systemd-timers/
│
├── README.md
├── commands.sh
├── scripts/
│   ├── maintenance.service
│   ├── maintenance.timer
│   └── backup.timer
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🖥 Environment
- OS: Ubuntu 24.04.1 LTS (Cloud Lab Environment)
- User: toor (sudo privileges)
- Init System: systemd 255
- Shell: Bash 5.2

---

# 🔎 Key Concepts Learned

- Difference between cron and systemd timers
- How systemd integrates with service lifecycle
- Calendar-based precision scheduling
- Persistent execution handling
- Built-in logging with journald

---

# 💼 Real-World Relevance

Systemd timers are widely used in:

- Enterprise Linux servers
- Automated patch management
- Backup orchestration
- Container lifecycle management
- Cloud infrastructure scheduling

Modern Linux distributions prefer timers over cron due to:
- Better logging
- Native service dependency management
- Reboot persistence
- More expressive scheduling syntax

---

# ✅ Result

Successfully created and managed:
- Daily timer
- Weekly scheduled timer
- Hourly timer with randomized delay
- Logged execution events
- Monitored system behavior

---

# 📌 Why This Matters

Understanding systemd timers is critical for:

- Linux System Administration
- DevOps Automation
- Cloud Infrastructure Management
- Production-grade scheduling

---

# 🧹 Cleanup (Performed)

- Stopped maintenance timer
- Removed service and timer units
- Reloaded systemd daemon

---

# 🚀 Lab Status: Completed Successfully
