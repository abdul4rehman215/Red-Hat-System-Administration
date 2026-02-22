# 🎤 Interview Q&A – Lab 31: Log Rotation with logrotate

---

## 1️⃣ What is logrotate?

`logrotate` is a Linux utility used to automatically rotate, compress, and manage log files to prevent disk space exhaustion.

---

## 2️⃣ Why is log rotation important?

Without log rotation:

- Logs grow indefinitely
- Disk space gets exhausted
- Services may crash
- System performance degrades

---

## 3️⃣ Where is the main logrotate configuration file located?

```
/etc/logrotate.conf
```

It may include additional configs from:

```
/etc/logrotate.d/
```

---

## 4️⃣ What does the `rotate` directive do?

It specifies how many old log files to retain.

Example:
```
rotate 7
```
Keeps 7 rotated logs.

---

## 5️⃣ What does the `compress` option do?

It compresses rotated log files using gzip to save disk space.

---

## 6️⃣ What is the purpose of `delaycompress`?

It delays compression until the next rotation cycle, allowing applications time to finish writing to the previous log.

---

## 7️⃣ What does `missingok` do?

It prevents errors if the specified log file does not exist.

---

## 8️⃣ What does `notifempty` do?

It prevents rotation of empty log files.

---

## 9️⃣ How do you manually force log rotation?

```bash
sudo logrotate --force /etc/logrotate.d/config_file
```

---

## 🔟 What is the difference between `--debug` and `--force`?

| Option | Purpose |
|--------|---------|
| --debug | Test configuration without rotating |
| --force | Force rotation regardless of schedule |

---

## 1️⃣1️⃣ What is the purpose of `postrotate`?

It executes commands after rotation.

Example:
```bash
postrotate
    systemctl restart rsyslog
endscript
```

Used to reload services.

---

## 1️⃣2️⃣ Where does logrotate track rotation history?

```
/var/lib/logrotate/logrotate.status
```

---

## 1️⃣3️⃣ How is logrotate normally executed automatically?

Via cron:

```
/etc/cron.daily/logrotate
```

---

## 1️⃣4️⃣ How do you verify rotated logs?

```bash
ls -lh /var/log/messages*
```

Look for:
```
messages.1.gz
messages.2.gz
```

---

## 1️⃣5️⃣ In a production system, how would you troubleshoot logs not rotating?

1. Check cron:
   ```bash
   ls /etc/cron.daily/logrotate
   ```
2. Check status file:
   ```bash
   cat /var/lib/logrotate/logrotate.status
   ```
3. Test config:
   ```bash
   sudo logrotate --debug config_file
   ```
4. Check permissions:
   ```bash
   ls -ld /var/log/messages
   ```

---

# 🧠 Scenario-Based Question

**Q:** A server ran out of disk space due to logs. What steps would you take?

**Answer:**
1. Identify large logs:
   ```bash
   sudo du -sh /var/log/*
   ```
2. Compress or rotate manually
3. Configure custom logrotate policy
4. Enable retention limits
5. Monitor disk usage regularly

---

# 📌 Key Interview Takeaway

Logrotate is critical for:

✔ Production stability  
✔ Log lifecycle management  
✔ Disk space control  
✔ Compliance requirements  
✔ Application reliability  

---
