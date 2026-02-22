# 🎤 Interview Questions – Lab 37: I/O Scheduler

---

## 1️⃣ What is an I/O scheduler?

It determines the order in which disk read/write requests are processed.

---

## 2️⃣ How do you check the active scheduler?

```bash
cat /sys/block/sda/queue/scheduler
```

---

## 3️⃣ What does mq-deadline do?

Provides balanced scheduling with latency control — good for servers.

---

## 4️⃣ Why use bfq?

Optimizes responsiveness for interactive workloads.

---

## 5️⃣ How do you make scheduler changes persistent?

Using udev rules:

```
/etc/udev/rules.d/60-io-schedulers.rules
```

---

## 6️⃣ Which scheduler for NVMe SSD?

kyber or none (depending on workload).

---

## 7️⃣ Why benchmark before production changes?

Because workload behavior varies:
- Random I/O
- Sequential I/O
- Mixed workloads

Wrong scheduler can degrade performance.

---

## 8️⃣ What tool measures disk performance?

- iostat
- fio
- dd
