# 🎤 Interview Q&A – Lab 28: Using `at` Command

---

## 1️⃣ What is the `at` command used for?

The `at` command schedules one-time tasks to run at a specified future time.

It is used for deferred execution.

---

## 2️⃣ What is the difference between `cron` and `at`?

| at | cron |
|----|------|
| One-time execution | Recurring execution |
| Flexible time expressions | Fixed schedule patterns |
| Requires atd service | Requires cron service |

---

## 3️⃣ What service is required for `at` to function?

The `atd` daemon must be running.

Check with:
```bash
systemctl status atd
```

---

## 4️⃣ How do you schedule a job using `at`?

```bash
at now + 5 minutes -f script.sh
```

Or interactively:
```bash
at 10:00 PM
```

---

## 5️⃣ How do you list scheduled `at` jobs?

```bash
atq
```

---

## 6️⃣ How do you remove a scheduled job?

```bash
atrm JOB_ID
```

---

## 7️⃣ What does `at now + 1 hour` mean?

It schedules a job to run one hour from the current time.

---

## 8️⃣ Where are `at` jobs stored?

In:
```
/var/spool/at/
```

Each job is stored as a file.

---

## 9️⃣ How can you inspect a scheduled job?

```bash
sudo cat /var/spool/at/<jobfile>
```

---

## 🔟 Why might an `at` job fail?

Common reasons:

- atd service not running
- Script not executable
- Wrong file path
- Time misconfiguration
- Missing permissions

---

## 1️⃣1️⃣ How do you enable `atd` at boot?

```bash
sudo systemctl enable atd
```

---

## 1️⃣2️⃣ What happens if the system is powered off when the job is scheduled?

The job will not execute.

Unlike `anacron`, `at` does not automatically retry missed jobs.

---

## 1️⃣3️⃣ What are practical use cases of `at`?

- Delayed system shutdown
- Temporary maintenance tasks
- Post-deployment scripts
- One-time backups
- Scheduled testing
- Incident response actions

---

## 1️⃣4️⃣ How do you schedule a job for tomorrow at 11:30 PM?

```bash
at 11:30 PM tomorrow
```

---

## 1️⃣5️⃣ What security considerations apply to `at`?

- Limit which users can use `at`
- Use `/etc/at.allow` and `/etc/at.deny`
- Avoid storing secrets in scripts
- Monitor scheduled jobs for misuse

---

# ✅ Interview Summary

The `at` command provides flexible one-time scheduling in Linux systems.

Mastering both `cron` and `at` ensures full control over:

- Recurring automation
- Deferred execution
- Maintenance operations
- DevOps task scheduling

This knowledge is essential for Linux system administration and enterprise environments.

---
