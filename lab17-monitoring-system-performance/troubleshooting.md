# 🛠 Troubleshooting Guide – Lab 17: Monitoring System Performance and Resource Usage

---

# 📌 Overview

This guide provides structured troubleshooting steps for diagnosing:

- High CPU usage
- Memory exhaustion
- Disk bottlenecks
- Network saturation
- Container performance issues
- Resource exhaustion

Follow a systematic approach — never guess.

---

# 🔥 1️⃣ High CPU Usage

## Symptoms

- CPU usage > 90%
- Load average higher than core count
- System sluggish

## Step 1: Identify Top CPU Process

```bash
top
````

Or:

```bash id="4mbvsi"
ps aux --sort=-%cpu | head -n 5
```

## Step 2: Check Per-Core Usage

```bash id="9q4z7v"
mpstat -P ALL 1 5
```

## Step 3: Investigate Process

* Is it expected workload?
* Infinite loop?
* Container misconfiguration?

## Step 4: Take Action

* Restart service
* Limit CPU
* Kill process if necessary:

```bash id="4qp9oe"
kill -9 <PID>
```

---

# 🧠 2️⃣ Memory Pressure

## Symptoms

* Low available memory
* Swap usage increasing
* OOM killer events

Check memory:

```bash id="mj72p1"
free -h
```

Check top memory consumers:

```bash id="z3f9ep"
ps aux --sort=-%mem | head -n 5
```

Check OOM logs:

```bash id="21b6ro"
journalctl | grep -i oom
```

## Solutions

* Restart memory-heavy application
* Increase RAM
* Tune application memory limits
* Add swap (temporary solution)

---

# 💿 3️⃣ Disk Bottlenecks

## Symptoms

* High %wa in top
* Slow application performance
* Disk nearly full

Check disk usage:

```bash id="xt6fpr"
df -h
```

Find large directories:

```bash id="2y98sm"
du -sh /* | sort -hr | head
```

Check I/O activity:

```bash id="t81oqv"
sudo iotop -o
```

## Solutions

* Rotate logs
* Remove unused files
* Extend LVM volume
* Move heavy workloads to separate disk

---

# 🌐 4️⃣ Network Issues

## Symptoms

* Connection delays
* Unexpected open ports
* High outbound traffic

Check listening services:

```bash id="2p7aof"
ss -tulnp
```

Monitor traffic:

```bash id="hf9k8x"
nload
```

Check failed logins:

```bash id="3dm2rt"
journalctl -u sshd | grep -i failed
```

## Solutions

* Close unused ports
* Restart service
* Enable firewall rules
* Investigate suspicious IP addresses

---

# 📦 5️⃣ Container Resource Issues

## Symptoms

* Container slow
* Host healthy
* Resource limits reached

Check:

```bash id="94fzct"
podman stats
```

Possible Causes:

* CPU limit
* Memory limit
* Container misconfiguration
* Resource quota

---

# ⚠ 6️⃣ CPU Throttling

Detected in logs:

```bash id="m8q2kx"
journalctl -p err -b
```

Possible Causes:

* Thermal throttling
* Hypervisor CPU cap
* Resource limits

Solutions:

* Reduce workload
* Adjust VM allocation
* Improve cooling (physical systems)

---

# 🧪 7️⃣ System Becomes Unresponsive During Stress Test

## Immediate Steps

1. Open new terminal
2. Check load:

```bash id="w19z3v"
uptime
```

3. Kill stress process:

```bash id="v2m6pr"
pkill stress-ng
```

---

# 🧭 Structured Troubleshooting Workflow

1️⃣ Check load average
2️⃣ Check CPU usage
3️⃣ Check memory availability
4️⃣ Check disk usage
5️⃣ Check disk I/O
6️⃣ Check network activity
7️⃣ Review logs

Always move from high-level → detailed investigation.

---

# 🧠 Enterprise Best Practices

* Set monitoring alerts
* Track performance trends
* Use centralized logging
* Monitor container limits
* Capacity plan regularly
* Automate health checks

---

# ✅ Final Health Validation

```bash
uptime
free -h
df -h
```

System should show:

✔ Load normalized
✔ Memory stable
✔ Disk under safe threshold
✔ No active errors

---
