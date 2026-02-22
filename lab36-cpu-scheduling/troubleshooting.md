# 🛠 Troubleshooting Guide – Lab 36: CPU Scheduling (nice & renice)

> Improper CPU priority adjustments can cause system instability, performance degradation, or service starvation.  
> This guide covers common issues and safe recovery strategies.

---

# 1️⃣ Permission Denied When Setting Negative Nice

## ❌ Error:
```
renice: failed to set priority for PID: Permission denied
```

## 🔎 Cause:
Only root can assign negative nice values.

## ✅ Fix:
Use sudo:
```bash
sudo renice -n -5 -p <PID>
```

---

# 2️⃣ Priority Change Not Reflecting

## ❌ Problem:
`renice` executed but CPU usage unchanged.

## 🔎 Possible Causes:
- System not CPU-bound
- Single-core test environment
- Process sleeping or I/O-bound
- Cgroup limits overriding priority

## ✅ Verify:
```bash
ps -l -p <PID>
htop
```

Ensure processes are actively competing for CPU.

---

# 3️⃣ Process Still Consuming Too Much CPU

## 🔎 Diagnose:
```bash
top
htop
```

Check:
- NI value
- CPU%
- Load average

## ✅ Possible Solutions:
- Increase nice value:
  ```bash
  renice 19 -p <PID>
  ```
- Use CPU quotas (cgroups)
- Limit execution time

---

# 4️⃣ System Becomes Sluggish After Increasing Priority

## 🔎 Cause:
High-priority (-5 or lower) process monopolizing CPU.

## 🚨 Immediate Fix:
Lower its priority:
```bash
sudo renice 10 -p <PID>
```

If system is heavily impacted:
```bash
kill <PID>
```

---

# 5️⃣ Load Average Too High

## 🔎 Diagnose:
```bash
uptime
vmstat 2
```

High load may indicate:
- CPU saturation
- Too many runnable processes

## ✅ Fix:
- Reduce priority of non-critical jobs
- Stop unnecessary background tasks
- Scale resources if needed

---

# 6️⃣ Nice Value Change Reverts

Nice values are not persistent across restarts of processes.

## Example:
If service restarts, priority resets.

## ✅ Persistent Solutions:
- Modify systemd service file:
```
Nice=10
```

Inside:
```
/etc/systemd/system/service-name.service
```

Then:
```bash
sudo systemctl daemon-reload
sudo systemctl restart service-name
```

---

# 7️⃣ htop Not Showing Updated Priority

## 🔎 Fix:
In htop:
- Press F2 → Columns
- Ensure NI column enabled
- Sort by NI or CPU%

---

# 8️⃣ Containerized Environment Issues

Nice may not behave as expected in:

- Docker
- Podman
- Kubernetes

Because CPU limits are controlled by cgroups.

## Check CPU shares:
```bash
cat /sys/fs/cgroup/cpu/cpu.shares
```

Nice affects scheduling within container limits only.

---

# 9️⃣ Accidental Starvation of Critical Services

If you accidentally:

```bash
sudo renice -n -20 -p <PID>
```

This can starve system services.

## 🚨 Recovery:
1. Identify PID:
   ```bash
   ps aux | sort -nk 8
   ```
2. Reset:
   ```bash
   sudo renice 0 -p <PID>
   ```

---

# 🔟 Want to Reset Everything?

Stop all test processes:
```bash
pkill dd
```

Verify:
```bash
pgrep dd
```

No output = clean system.

---

# 🧠 Production Best Practices

✔ Never boost priority blindly  
✔ Monitor CPU before and after changes  
✔ Avoid negative nice in shared environments  
✔ Use systemd for persistent tuning  
✔ Prefer cgroups for strict CPU control  
✔ Test in staging before production  

---

# 📊 Diagnostic Commands

```bash
ps -eo pid,ni,pri,cmd --sort=-ni
htop
vmstat 2
uptime
top
```

---

# 🚀 Advanced CPU Control (Beyond nice)

For stricter control:

| Tool | Purpose |
|------|--------|
| chrt | Real-time scheduling |
| cgroups | CPU quotas and shares |
| systemd | Persistent service-level priority |
| cpulimit | Limit CPU % directly |

---

# 🔐 Real Infrastructure Insight

In production environments:

- Batch jobs → Nice 10–19  
- API services → Nice 0  
- Critical DB → Nice -5 (carefully)  
- Real-time workloads → chrt  

Nice is a soft priority adjustment — not a guarantee.

---
