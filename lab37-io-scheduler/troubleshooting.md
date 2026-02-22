# 🛠 Troubleshooting Guide – Lab 37: I/O Scheduler

---

## 1️⃣ Scheduler Not Changing

Check if:

```bash
cat /sys/block/sda/queue/scheduler
```

If denied:
- Ensure sudo privileges

---

## 2️⃣ Scheduler Reverts After Reboot

Persistent method required:

Create udev rule:

```
/etc/udev/rules.d/60-io-schedulers.rules
```

Reload:

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```

---

## 3️⃣ fio Not Installed

Install:

```bash
sudo yum install fio -y
```

---

## 4️⃣ High Disk Latency

Monitor:

```bash
iostat -x 1
```

Check:
- %util
- await
- svctm

---

## 5️⃣ Test Results Inconsistent

Always:
- Drop caches before testing
- Run multiple iterations
- Ensure no background workload

---

## 6️⃣ Production Best Practices

✔ Benchmark first  
✔ Monitor latency  
✔ Use appropriate scheduler for storage type  
✔ Avoid blind changes in production  
✔ Document performance comparison  

---

## 🔬 Real Infrastructure Insight

Databases → mq-deadline  
High-speed NVMe → kyber  
Containers → depends on workload  
Interactive desktops → bfq  

Scheduler tuning should be workload-driven.
