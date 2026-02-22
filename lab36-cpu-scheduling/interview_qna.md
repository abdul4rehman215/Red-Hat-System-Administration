# 🎤 Interview Q&A – Lab 36: CPU Scheduling with nice & renice

---

## 1️⃣ What is a nice value in Linux?

**Answer:**  
Nice value determines process priority in CPU scheduling.

- Range: -20 (highest priority) to 19 (lowest priority)
- Default: 0
- Lower nice value → More CPU access

---

## 2️⃣ What is the difference between `nice` and `renice`?

**Answer:**

| Command | Purpose |
|----------|---------|
| nice | Sets priority when launching a process |
| renice | Changes priority of a running process |

---

## 3️⃣ Why do negative nice values require root privileges?

**Answer:**  
Negative nice values increase priority, which can starve other processes.  
Only root is allowed to increase scheduling priority for system safety.

---

## 4️⃣ What happens if two CPU-intensive processes compete?

**Answer:**  
The scheduler allocates more CPU time to the process with the lower nice value (higher priority).

Example:
- NI = -5 → High CPU share
- NI = 19 → Minimal CPU share

---

## 5️⃣ How can you check a process’s nice value?

**Answer:**
```bash
ps -l -p <PID>
```
Look at the **NI** column.

Or use:
```bash
htop
```

---

## 6️⃣ What is PRI vs NI in `ps` output?

**Answer:**

- NI → Nice value (user-defined priority adjustment)
- PRI → Kernel scheduling priority derived from nice value

Lower NI results in higher PRI.

---

## 7️⃣ When would you lower the priority of a process?

**Answer:**
- Backup jobs
- Batch processing
- Log analysis scripts
- Large file compression

Prevents them from impacting critical services.

---

## 8️⃣ When would you increase process priority?

**Answer:**
- Database server under load
- Real-time data processing
- High-priority API services
- Critical background daemons

---

## 9️⃣ Can nice guarantee CPU access?

**Answer:**  
No. It influences scheduling but does not guarantee CPU allocation.  
For guaranteed CPU access, use:

- `cgroups`
- `chrt` (real-time scheduling)

---

## 🔟 What tool would you use to monitor CPU scheduling live?

**Answer:**
- `htop`
- `top`
- `ps`
- `vmstat`

`htop` provides real-time visual comparison of NI values and CPU%.

---

## 1️⃣1️⃣ What is the relationship between nice and CFS (Completely Fair Scheduler)?

**Answer:**  
Linux uses the Completely Fair Scheduler (CFS), which uses nice values to determine weight-based CPU allocation.

Nice value adjusts scheduling weight.

---

## 1️⃣2️⃣ Real Production Scenario Question

**Question:**  
A backup job is consuming too much CPU and slowing production APIs. What would you do?

**Answer:**
1. Identify backup PID:
   ```bash
   pgrep backup_script
   ```
2. Lower priority:
   ```bash
   renice 15 -p <PID>
   ```
3. Monitor impact in htop.

Optional: Schedule backup during off-peak hours.

---

## 1️⃣3️⃣ How do containers handle CPU priority?

**Answer:**  
Containers typically use:

- cgroups CPU quotas
- CPU shares
- Kubernetes CPU requests/limits

nice affects processes inside containers but does not override cgroup limits.

---

## 1️⃣4️⃣ What are risks of misusing negative nice values?

**Answer:**
- Starving system services
- Kernel instability
- High load averages
- Application crashes

Never boost priority blindly in production.

---

## 1️⃣5️⃣ Advanced Scheduling Question

**Question:**  
What if nice is not sufficient for real-time workloads?

**Answer:**  
Use:

```bash
chrt -f 99 <command>
```

This enables real-time FIFO scheduling.

Used for:
- Audio processing
- Financial trading systems
- Real-time analytics

---

# 📌 Quick Command Cheat Sheet

```bash
nice -n 10 command
renice -n 15 -p PID
ps -l -p PID
htop
pkill process
```

---

# 🧠 Professional Insight

CPU scheduling is essential for:

✔ Production stability  
✔ Fair resource distribution  
✔ Protecting critical workloads  
✔ Performance optimization  
✔ Incident mitigation  

Understanding nice & renice is foundational before moving to:

- cgroups
- systemd resource control
- container CPU limits
- Kubernetes scheduling

---
