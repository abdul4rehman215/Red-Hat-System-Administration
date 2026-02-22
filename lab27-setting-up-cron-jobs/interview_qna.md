# 🎤 Interview Q&A – Lab 27: Setting Up Cron Jobs

---

## 1️⃣ What is cron in Linux?

Cron is a time-based job scheduler in Unix/Linux systems used to automate repetitive tasks.

---

## 2️⃣ What is a crontab?

Crontab (cron table) is a file that stores scheduled tasks for a user.

Each user can have their own crontab.

---

## 3️⃣ How do you edit a user’s crontab?

```bash
crontab -e
```

---

## 4️⃣ How do you list scheduled cron jobs?

```bash
crontab -l
```

---

## 5️⃣ How do you remove all cron jobs?

```bash
crontab -r
```

---

## 6️⃣ Explain the cron expression format.

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

## 7️⃣ What does `*/10 * * * *` mean?

Run the command every 10 minutes.

---

## 8️⃣ What does `0 17 * * 1` mean?

Run the command at 5 PM every Monday.

---

## 9️⃣ Why should scripts use absolute paths in cron?

Cron runs with a minimal environment and may not have the same PATH variable as your shell.

Always use full paths like:

```bash
/usr/bin/tar
```

---

## 🔟 How do you check if the cron service is running?

```bash
systemctl status cron
```

---

## 1️⃣1️⃣ Where are system-wide cron jobs stored?

Common locations:

- `/etc/crontab`
- `/etc/cron.daily`
- `/etc/cron.hourly`
- `/etc/cron.weekly`
- `/etc/cron.monthly`

---

## 1️⃣2️⃣ What is the difference between cron and anacron?

| Cron | Anacron |
|------|---------|
| Runs at exact scheduled time | Runs jobs that were missed |
| Best for always-on systems | Best for laptops or intermittent systems |

---

## 1️⃣3️⃣ How can you log cron output?

Redirect output:

```bash
* * * * * script.sh >> logfile.txt 2>&1
```

---

## 1️⃣4️⃣ What are common cron job use cases?

- Backups
- Log rotation
- Security scanning
- Database maintenance
- Monitoring scripts
- Automated updates

---

## 1️⃣5️⃣ What security considerations apply to cron jobs?

- Avoid storing secrets in scripts
- Restrict script permissions
- Use absolute paths
- Monitor logs for suspicious scheduled tasks

---

# ✅ Interview Summary

Cron is a critical automation component in Linux systems.

Understanding cron is essential for:

- System administration
- DevOps automation
- Cloud operations
- Infrastructure management
- Security monitoring

Automation through cron improves reliability, consistency, and operational efficiency.

---
