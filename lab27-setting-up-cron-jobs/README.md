# 🧪 Lab 27: Setting Up Cron Jobs

## 🎯 Objective

This lab demonstrates how to automate repetitive system tasks using **cron jobs** in Linux.

By completing this lab, I learned to:

- Create executable automation scripts
- Schedule tasks using cron expressions
- Manage user crontab entries
- Verify and troubleshoot scheduled jobs
- Automate logging and backup tasks

Cron is a core Linux service used in production systems for task automation.

---

## 📌 Prerequisites

- Ubuntu Linux system
- Bash shell access
- Permission to edit user crontab
- Basic command-line knowledge

---

**Environment:** Ubuntu 24.04.1 LTS – Cloud Lab Environment  
**User:** toor  
**Shell:** Bash 5.2

---

## 🗂 Repository Structure

```
lab27-setting-up-cron-jobs/
│
├── README.md
├── commands.sh
├── scripts/
│   └── backup_home.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

# 🧩 Lab Tasks Overview

---

## 🔹 Task 1: Create a Cron Job for Automatic Backups

### ✔ Created Backup Directory

```bash
mkdir ~/backups
```

---

### ✔ Created Backup Script

Script:

```bash
tar -czf ~/backups/home_backup_$(date +%Y%m%d).tar.gz ~/
echo "Backup completed on $(date)" >> ~/backups/backup_log.txt
```

This dynamically:
- Compresses home directory
- Adds date-based filename
- Logs execution time

---

### ✔ Scheduled Cron Job

```bash
crontab -e
```

Added:

```
0 2 * * * ~/backups/backup_home.sh
```

Runs daily at 2 AM.

---

## 🔹 Task 2: Using Cron Expressions

### ✔ Multiple Scheduling Examples

```
* * * * * echo "Test cron job" >> ~/cron_test.log
0 17 * * 1 echo "Weekly reminder" >> ~/weekly_log.txt
*/10 * * * * date >> ~/time_log.txt
```

Learned cron syntax:

```
* * * * * command
│ │ │ │ │
│ │ │ │ └── Day of week (0–6)
│ │ │ └──── Month (1–12)
│ │ └────── Day of month (1–31)
│ └──────── Hour (0–23)
└────────── Minute (0–59)
```

---

## 🔹 Task 3: Managing Cron Jobs

### ✔ List Jobs

```bash
crontab -l
```

### ✔ Remove All Jobs

```bash
crontab -r
```

---

# 🧠 Key Concepts Learned

| Concept | Description |
|----------|-------------|
| cron | Time-based job scheduler |
| crontab -e | Edit scheduled tasks |
| crontab -l | List current jobs |
| crontab -r | Remove all jobs |
| */10 | Run every 10 minutes |
| 0 17 * * 1 | Every Monday at 5 PM |

---

# 💡 Real-World Relevance

Cron is widely used for:

- Automated backups
- Log rotation
- Monitoring tasks
- Scheduled updates
- Data synchronization
- Security scanning
- Maintenance scripts

Automation increases system reliability and reduces manual workload.

---

# 📊 Result

✔ Built automated backup system  
✔ Scheduled multiple cron jobs  
✔ Verified automated logging  
✔ Managed and removed cron entries  
✔ Understood cron expression syntax  

---

# 🏁 Conclusion

This lab strengthened my understanding of Linux task automation using cron. These skills are essential for DevOps, system administration, and cloud infrastructure management.

---
