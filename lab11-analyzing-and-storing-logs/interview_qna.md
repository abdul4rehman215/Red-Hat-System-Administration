# 🎤 Interview Q&A - Lab 11: Linux Log Analysis & Management

---

## 1️⃣ What is the difference between traditional logs in /var/log and journalctl logs?

**Answer:**

- `/var/log` contains plain text log files managed by rsyslog.
- `journalctl` reads logs from systemd’s binary journal format.
- Journal logs are indexed and searchable with advanced filtering.
- Traditional logs are easier to read manually but less structured.

---

## 2️⃣ How do you check logs for a specific service?

**Answer:**

Using journalctl:

```bash
sudo journalctl -u sshd
````

This filters logs for only the sshd service.

---

## 3️⃣ How can you view logs from the last 30 minutes?

```bash
sudo journalctl --since "30 minutes ago"
```

You can also use exact timestamps:

```bash
sudo journalctl --since "2026-02-22 14:00:00"
```

---

## 4️⃣ How do you follow logs in real-time?

```bash
sudo journalctl -f
```

Equivalent to:

```bash
tail -f /var/log/messages
```

---

## 5️⃣ What is logrotate and why is it important?

**Answer:**

`logrotate` manages log file growth.

It:

* Rotates old logs
* Compresses logs
* Deletes old logs after retention period
* Prevents disk space exhaustion

Without log rotation, logs could fill the entire disk.

---

## 6️⃣ How do you check how much disk space journals use?

```bash
sudo journalctl --disk-usage
```

---

## 7️⃣ How do you search logs for failed SSH attempts?

```bash
sudo grep "Failed password" /var/log/secure
```

Or:

```bash
sudo journalctl -u sshd | grep "Failed"
```

---

## 8️⃣ How can you extract IP addresses from failed login attempts?

```bash
sudo awk '/Failed password/ {print $11}' /var/log/secure
```

This extracts the source IP field.

---

## 9️⃣ How are container logs inspected in Podman?

```bash
podman logs <container_id>
```

Example:

```bash
podman logs a1b2c3d4e5f6
```

---

## 🔟 What is the difference between grep and awk in log analysis?

| grep                       | awk                                  |
| -------------------------- | ------------------------------------ |
| Pattern matching           | Pattern + structured processing      |
| Simple searches            | Field-based extraction               |
| Faster for basic filtering | More powerful for structured parsing |

---

# 🧠 Advanced Questions

---

## 1️⃣1️⃣ How do you configure persistent journal storage?

Edit:

```bash
sudo nano /etc/systemd/journald.conf
```

Set:

```
Storage=persistent
```

Then restart:

```bash
sudo systemctl restart systemd-journald
```

---

## 1️⃣2️⃣ How would you detect brute-force attacks?

Indicators:

* Multiple "Failed password" entries
* Repeated attempts from same IP
* Rapid login attempts within short time

Example:

```bash
sudo grep "Failed password" /var/log/secure | awk '{print $11}' | sort | uniq -c | sort -nr
```

---

# ✅ Interview Takeaway

This lab demonstrates:

* Log investigation skills
* Security incident detection ability
* System troubleshooting capability
* Knowledge of systemd logging
* Understanding of log rotation best practices

These are critical DevOps, SysAdmin, and Security Engineer skills.

