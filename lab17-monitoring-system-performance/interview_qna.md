# 🎤 Interview Q&A – Lab 17: Monitoring System Performance and Resource Usage

# 🔹 Section 1: HR / Behavioral Questions

### 1️⃣ Why is system performance monitoring important in production environments?

Performance monitoring ensures:

- System stability
- Early detection of bottlenecks
- Prevention of downtime
- Efficient resource utilization
- Capacity planning

It allows proactive troubleshooting instead of reactive firefighting.

---

### 2️⃣ Describe a time you diagnosed a performance issue.

In this lab scenario:

- Used `top` to detect CPU utilization
- Used `free -h` to check memory
- Used `df -h` and `du` to inspect disk
- Used `ss` to verify active services
- Simulated high load with `stress-ng`
- Confirmed system stability after load test

This demonstrates structured troubleshooting methodology.

---

### 3️⃣ How do you prioritize issues during system degradation?

1. Check CPU load and load average
2. Verify memory and swap usage
3. Inspect disk I/O wait
4. Check network saturation
5. Review system logs

Always address critical bottlenecks first.

---

# 🔹 Section 2: Technical Questions

---

### 4️⃣ What does load average represent?

Load average shows the number of processes:

- Running
- Waiting for CPU
- Waiting for I/O

If load > number of CPU cores → system is overloaded.

Example:
4-core system with load average of 6 = overloaded.

---

### 5️⃣ What is the difference between %us and %sy in top?

| Metric | Meaning |
|--------|---------|
| %us | CPU time spent in user space |
| %sy | CPU time spent in kernel/system space |

High %sy may indicate kernel-intensive operations.

---

### 6️⃣ What does %wa indicate?

%wa = I/O wait

High %wa means CPU is waiting on disk operations.

This indicates disk bottleneck.

---

### 7️⃣ How do you detect memory pressure?

Check:

```bash
free -h
````

Signs:

* Low available memory
* Swap usage increasing
* OOM killer logs

Check OOM:

```bash
journalctl | grep -i oom
```

---

### 8️⃣ How do you monitor disk performance?

* `df -h` → Disk space
* `du -sh` → Directory usage
* `iotop` → I/O heavy processes
* `dmesg` → Disk errors

---

### 9️⃣ How do you check open ports?

```bash
ss -tulnp
```

It shows:

* Listening services
* Port numbers
* Associated processes

---

### 🔟 How do you monitor container resource usage?

```bash
podman stats
```

Displays:

* CPU usage
* Memory usage
* Network I/O
* Block I/O

Useful in containerized environments.

---

# 🔹 Section 3: Scenario-Based Questions

---

### 1️⃣1️⃣ Scenario: CPU is 100% for 10 minutes. What do you do?

Steps:

1. Run `top`
2. Identify top CPU-consuming process
3. Use `ps aux --sort=-%cpu`
4. Determine if workload is legitimate
5. Kill or throttle process if needed
6. Check logs
7. Analyze long-term trends

---

### 1️⃣2️⃣ Scenario: Server is slow but CPU is low.

Likely causes:

* Disk bottleneck (%wa high)
* Memory pressure
* Network latency
* Blocking I/O operations

Check:

```bash
iotop
free -h
ss -tulnp
```

---

### 1️⃣3️⃣ Scenario: Swap usage keeps increasing.

Possible causes:

* Memory leak
* Under-provisioned RAM
* Misconfigured JVM or application limits

Investigate:

```bash
ps aux --sort=-%mem
```

---

### 1️⃣4️⃣ Scenario: Container is slow but host is fine.

Check:

```bash
podman stats
```

Possible causes:

* CPU limits
* Memory limits
* Resource quotas
* Container-level throttling

---

# 🔹 Section 4: Advanced Questions

---

### 1️⃣5️⃣ What is CPU throttling?

CPU throttling occurs when:

* CPU temperature is high
* Resource limits applied
* Hypervisor constraints exist

Detected via logs:

```bash
journalctl -p err -b
```

---

### 1️⃣6️⃣ What is the difference between load average and CPU usage?

CPU usage = current utilization
Load average = queued + running processes

Load gives better overall system pressure view.

---

### 1️⃣7️⃣ What tools would you use in enterprise environments?

* top
* htop
* mpstat
* iotop
* nload
* Prometheus
* Grafana
* ELK stack
* Datadog
* New Relic

---

# ✅ Interview Readiness Checklist

✔ Understand load average
✔ Interpret CPU states
✔ Diagnose memory pressure
✔ Identify disk bottlenecks
✔ Monitor container resources
✔ Investigate system logs
✔ Handle real-world scenarios

---
