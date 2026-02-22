# 🎤 Interview Q&A – Lab 29: Systemd Timers

---

## 1️⃣ What is a systemd timer?

A systemd timer is a unit that schedules execution of a systemd service at specific times or intervals. It acts as a modern alternative to cron.

---

## 2️⃣ How are systemd timers different from cron jobs?

| Cron | Systemd Timer |
|------|--------------|
| Text-based crontab | Unit-based configuration |
| Limited logging | Integrated with journald |
| No dependency management | Supports service dependencies |
| Less reboot persistence | Persistent execution support |

---

## 3️⃣ What are the two main unit files required for a timer setup?

1. `.service` file → Defines what runs  
2. `.timer` file → Defines when it runs  

---

## 4️⃣ What does `Type=oneshot` mean?

It means the service runs once and exits after execution.

---

## 5️⃣ What is `OnCalendar=` used for?

It defines calendar-based scheduling similar to cron but with extended syntax support.

Example:
```
OnCalendar=Mon *-*-* 02:00:00
```

---

## 6️⃣ What does `Persistent=true` do?

If the system was powered off when a timer was supposed to run, it triggers the missed execution after reboot.

---

## 7️⃣ How do you reload systemd after modifying unit files?

```bash
sudo systemctl daemon-reload
```

---

## 8️⃣ How can you list all timers?

```bash
systemctl list-timers --all
```

---

## 9️⃣ How do you check logs of a service triggered by a timer?

```bash
journalctl -u service_name
```

---

## 🔟 What is `RandomizedDelaySec`?

It adds a random delay before execution to prevent simultaneous execution across multiple systems.

---

## 1️⃣1️⃣ How do you test calendar expressions?

```bash
systemd-analyze calendar "hourly"
```

---

## 1️⃣2️⃣ How do you enable and start a timer?

```bash
sudo systemctl enable --now timer_name.timer
```

---

## 1️⃣3️⃣ Where are custom timer unit files stored?

```
/etc/systemd/system/
```

---

## 1️⃣4️⃣ What happens if you modify a timer but don’t reload daemon?

Changes will not take effect until:
```bash
sudo systemctl daemon-reload
```

---

## 1️⃣5️⃣ When should you prefer systemd timers over cron?

- When managing services
- When needing dependency handling
- When requiring persistent execution after reboot
- When centralized logging is important

---

# 🧠 Practical Scenario Question

**Q:** How would you schedule a task 10 minutes after boot?  
**Answer:** Use:
```
OnBootSec=10min
```

---

# 📌 Final Takeaway

Systemd timers are the modern scheduling mechanism in Linux systems, providing:

✔ Better logging  
✔ Service integration  
✔ Reboot persistence  
✔ Flexible scheduling  
✔ Enterprise-grade reliability  

---
