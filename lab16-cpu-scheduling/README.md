## 🧪 Lab 16 - Adjusting CPU Scheduling with `nice` and `renice`

---

### 📍 Environment

* **OS:** CentOS Linux 7 (Core)
* **Shell:** Bash 4.2
* **User:** centos (sudo privileges)
* **Monitoring Tool:** htop

---

## 🎯 Overview

This lab demonstrates **Linux CPU scheduling control using nice and renice**, focusing on:

* Understanding Linux process priority
* Launching processes with controlled CPU access
* Modifying running process priority
* Observing scheduler behavior under load

The lab simulates real-world scenarios such as:

* Production servers running competing workloads
* Batch jobs vs interactive services
* Performance tuning under resource contention
* CPU fairness in multi-user environments

---

## 🧠 Skills Demonstrated

| Category                 | Skills Applied                        |
| ------------------------ | ------------------------------------- |
| Linux Process Management | Monitoring and prioritizing processes |
| Performance Optimization | CPU allocation tuning                 |
| System Administration    | Runtime scheduling adjustment         |
| Production Stability     | Resource contention management        |
| DevOps/SRE               | Controlled workload prioritization    |

---

## ⚙ Core Concepts Covered

---

### 1️⃣ Linux Scheduling & Nice Values

* Range: **-20 to 19**
* Default: **0**
* Lower NI → Higher priority
* Higher NI → Lower priority

| Nice Value | Effect           |
| ---------- | ---------------- |
| -20        | Highest priority |
| 0          | Default          |
| 19         | Lowest priority  |

⚠ Negative values require root privileges.

---

### 2️⃣ Starting Processes with `nice`

Used for:

```bash
nice -n <value> command
```

Example:

```bash
nice -n 10 dd if=/dev/zero of=/dev/null &
```

This launches the process with reduced CPU priority.

---

### 3️⃣ Modifying Running Processes with `renice`

Used for:

```bash
renice -n <value> -p <PID>
```

Allows dynamic scheduling adjustments without restarting services.

---

### 4️⃣ Monitoring CPU Impact with `htop`

Observed:

* Higher priority process (-5) consumed ~80% CPU
* Lower priority process (15 or 19) received significantly less CPU

Demonstrates real scheduler fairness behavior.

---

## 🔬 Practical Scenarios Simulated

✔ High-priority system service
✔ Low-priority background batch job
✔ CPU contention scenario
✔ Controlled resource allocation
✔ Live priority tuning without downtime

---

## 📊 Why This Matters in Production

In real systems:

* Databases should have higher priority
* Backup jobs should have lower priority
* Log processors may run with reduced scheduling
* Critical services must not starve

Improper CPU scheduling can cause:

* API latency spikes
* Service crashes
* Resource starvation
* User-facing slowdowns

This lab teaches safe runtime control.

---

## 🔐 Best Practices Applied

✔ Monitored CPU before & after tuning
✔ Used background processes safely
✔ Avoided unnecessary system impact
✔ Terminated test processes properly
✔ Demonstrated safe cleanup

---

## 📁 Repository Structure

```
lab16-cpu-scheduling/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

## 🏁 Outcome

After completing this lab, I can:

* Control CPU allocation dynamically
* Adjust running processes safely
* Diagnose CPU contention issues
* Protect critical services from starvation
* Tune scheduling in production environments

---

## 📌 Professional Relevance

Essential for:

* DevOps Engineers
* Linux Administrators
* SRE Engineers
* Platform Engineers
* Performance Engineers

---

## 🧠 Advanced Topics (Next-Level)

* `chrt` (real-time scheduling)
* `cgroups` CPU quotas
* Container CPU limits
* Kubernetes CPU requests/limits
* Systemd resource controls

---

## ✅ Lab Status

✔ Completed
✔ Production-relevant
✔ Real-world applicable
✔ Monitoring verified
