# 🎤 Interview Q&A – Lab 30: journalctl Log Analysis

---

## 1️⃣ What is journalctl?

`journalctl` is a command-line tool used to query and display logs collected by systemd-journald.

---

## 2️⃣ How is journald different from traditional syslog?

| Syslog | journald |
|--------|----------|
| Stores logs in plain text files | Stores logs in binary format |
| Separate log files per service | Centralized structured log system |
| Limited filtering | Advanced filtering by unit, time, priority |
| No structured metadata | Includes metadata fields |

---

## 3️⃣ How do you view logs from the last hour?

```bash
journalctl --since "1 hour ago"
```

---

## 4️⃣ How do you filter logs for a specific service?

```bash
journalctl -u ssh
```

---

## 5️⃣ How do you show only error-level logs?

```bash
journalctl -p err
```

---

## 6️⃣ What are journal priority levels?

| Level | Number |
|--------|--------|
| emerg | 0 |
| alert | 1 |
| crit | 2 |
| err | 3 |
| warning | 4 |
| notice | 5 |
| info | 6 |
| debug | 7 |

---

## 7️⃣ How do you view logs from the previous boot?

```bash
journalctl -b -1
```

---

## 8️⃣ How do you list available boot sessions?

```bash
journalctl --list-boots
```

---

## 9️⃣ How do you stream logs in real time?

```bash
journalctl -f
```

---

## 🔟 How do you export logs in JSON format?

```bash
journalctl -o json
```

---

## 1️⃣1️⃣ How do you check journal disk usage?

```bash
journalctl --disk-usage
```

---

## 1️⃣2️⃣ How do you limit journal storage size?

```bash
sudo journalctl --vacuum-size=100M
```

---

## 1️⃣3️⃣ Where are journal logs stored?

Default location:

```
/run/log/journal/   (volatile)
/var/log/journal/   (persistent)
```

---

## 1️⃣4️⃣ How do you enable persistent journal logs?

Edit:

```
/etc/systemd/journald.conf
```

Set:
```
Storage=persistent
```

Restart:
```bash
sudo systemctl restart systemd-journald
```

---

## 1️⃣5️⃣ Why is journalctl important in incident response?

Because it allows:

- Time-based forensic analysis
- Service-specific log filtering
- Severity-based filtering
- Boot session diagnostics
- Structured log export for SIEM tools

---

# 🧠 Scenario-Based Question

**Q:** A service failed to start after reboot. How would you investigate?

**Answer:**
1. Identify service:
   ```bash
   systemctl status service_name
   ```
2. Check logs:
   ```bash
   journalctl -u service_name -b
   ```
3. Filter errors:
   ```bash
   journalctl -u service_name -p err
   ```

---

# 📌 Key Interview Takeaway

`journalctl` is a core Linux administration skill required for:

✔ Production troubleshooting  
✔ Security investigations  
✔ DevOps debugging  
✔ Cloud infrastructure support  
✔ Reliability engineering  

---
