# 🎤 Interview Q&A – Lab 35: Kernel Tuning with sysctl

---

## 1️⃣ What is `sysctl`?

**Answer:**  
`sysctl` is a Linux utility used to view and modify kernel runtime parameters. It allows tuning of networking, memory, and system behavior without recompiling the kernel.

---

## 2️⃣ What is the difference between `sysctl -w` and editing `/etc/sysctl.conf`?

**Answer:**
- `sysctl -w` → Applies changes immediately but temporarily (lost after reboot)
- `/etc/sysctl.conf` or `/etc/sysctl.d/` → Makes changes persistent across reboots

---

## 3️⃣ What does `vm.swappiness` control?

**Answer:**  
It controls how aggressively the kernel swaps memory pages to disk.

- 0 = Avoid swapping as much as possible
- 60 = Default moderate behavior
- 100 = Aggressive swapping

Lower swappiness is preferred for:
- Database servers
- Low-latency systems

---

## 4️⃣ Why would you tune `net.core.somaxconn`?

**Answer:**  
It controls the maximum number of queued socket connections.

In high-traffic web servers or load balancers, increasing this prevents:
- Connection drops
- SYN backlog overflows

---

## 5️⃣ What is `net.ipv4.tcp_fastopen`?

**Answer:**  
TCP Fast Open allows sending data during the TCP handshake, reducing latency.

Values:
- 0 = Disabled
- 1 = Client only
- 2 = Server only
- 3 = Both client & server

Used in performance-sensitive APIs and microservices.

---

## 6️⃣ What is `fs.file-max`?

**Answer:**  
Maximum number of file descriptors allowed system-wide.

High concurrency servers need higher values to prevent:
```
Too many open files
```

---

## 7️⃣ How do you safely test sysctl changes in production?

**Answer:**
1. Apply temporary change with `sysctl -w`
2. Monitor system (vmstat, netstat, dstat)
3. Validate performance improvement
4. Persist only after verification

Never persist untested parameters.

---

## 8️⃣ Where are sysctl configurations stored?

**Answer:**
- `/etc/sysctl.conf` (legacy/global)
- `/etc/sysctl.d/*.conf` (modular/recommended)
- `/usr/lib/sysctl.d/` (distribution defaults)

---

## 9️⃣ What happens if you configure an unsupported kernel parameter?

**Answer:**
You get:
```
sysctl: cannot stat /proc/sys/...
```
This means the running kernel does not support that parameter.

Always verify using:
```bash
sysctl -a | grep parameter_name
```

---

## 🔟 Why is kernel tuning critical in Kubernetes environments?

**Answer:**  
Containers share the host kernel. Improper tuning can cause:

- Pod eviction
- Connection exhaustion
- High swap latency
- Performance degradation

Cluster nodes must be tuned properly.

---

## 1️⃣1️⃣ How do you revert a bad sysctl change?

**Answer:**
1. Remove line from config file
2. Reload:
```bash
sudo sysctl --system
```
Or manually reset:
```bash
sudo sysctl -w parameter=default_value
```

---

## 1️⃣2️⃣ How would you diagnose memory thrashing?

**Answer:**
Use:
```bash
vmstat 2
```
Look for:
- High `si` (swap in)
- High `so` (swap out)

Indicates excessive swapping.

---

## 1️⃣3️⃣ What monitoring tools complement sysctl tuning?

**Answer:**
- `vmstat`
- `netstat -s`
- `dstat`
- `htop`
- `sar`
- `top`

---

## 1️⃣4️⃣ What is the safest way to apply multiple sysctl configs?

**Answer:**
Use:
```bash
sudo sysctl --system
```
This loads all configuration files in correct order.

---

## 1️⃣5️⃣ Real-World Scenario Question

**Question:**  
A production API server starts dropping connections under load. What would you check?

**Answer:**
1. `net.core.somaxconn`
2. `net.ipv4.tcp_max_syn_backlog`
3. File descriptor limits (`fs.file-max`)
4. Current open sockets:
```bash
ss -s
```
5. Monitor packet drops:
```bash
netstat -s
```

Then tune accordingly and validate with load testing.

---

# 📌 Quick Command Reference

```bash
sysctl -a
sysctl vm.swappiness
sysctl -w vm.swappiness=10
sysctl -p
sysctl --system
vmstat 2
netstat -s
```

---

# ✅ Professional Summary

Kernel tuning is not just configuration — it is:

✔ Capacity planning  
✔ Stability engineering  
✔ Performance optimization  
✔ Infrastructure reliability  

Mastering `sysctl` is essential for:
- DevOps Engineers
- SREs
- Platform Engineers
- Linux System Administrators
