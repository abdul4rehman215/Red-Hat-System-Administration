# 🧪 Lab 08 – Interview Q&A: Monitoring and Managing Processes

---

## 1️⃣ What is a process in Linux?

A process is a running instance of a program. Each process has:
- A unique Process ID (PID)
- Assigned system resources (CPU, memory)
- A process state (running, sleeping, stopped, zombie)

---

## 2️⃣ What is the difference between `ps aux` and `top`?

| Command | Purpose |
|----------|----------|
| `ps aux` | Snapshot of running processes |
| `top` | Real-time dynamic monitoring |

`ps` shows a static list, while `top` updates continuously.

---

## 3️⃣ What do the columns in `ps aux` represent?

Common columns include:
- **USER** – Process owner
- **PID** – Process ID
- **%CPU** – CPU usage
- **%MEM** – Memory usage
- **VSZ** – Virtual memory size
- **RSS** – Resident memory
- **STAT** – Process state
- **COMMAND** – Executed command

---

## 4️⃣ What is the difference between SIGTERM and SIGKILL?

| Signal | Number | Description |
|--------|--------|-------------|
| SIGTERM | 15 | Graceful termination |
| SIGKILL | 9 | Immediate forced termination |

SIGTERM allows cleanup. SIGKILL does not.

---

## 5️⃣ How do you list all available signals?

```bash
kill -l
````

This displays all supported signals in Linux.

---

## 6️⃣ What is job control in Linux?

Job control allows managing processes started in the shell:

* `&` → Run in background
* `jobs` → List jobs
* `fg` → Bring to foreground
* `bg` → Resume in background
* `Ctrl + Z` → Suspend process

---

## 7️⃣ What is a nice value?

Nice value determines process priority:

* Range: **-20 (highest priority)** to **19 (lowest priority)**
* Default: **0**
* Higher nice value → lower priority

---

## 8️⃣ What is the difference between `nice` and `renice`?

| Command  | Function                               |
| -------- | -------------------------------------- |
| `nice`   | Start a process with modified priority |
| `renice` | Change priority of running process     |

---

## 9️⃣ When would you use `pkill` instead of `kill`?

Use `pkill` when:

* You want to terminate processes by name
* You don’t want to manually find PID

Example:

```bash
pkill sleep
```

---

## 🔟 What tools are used for advanced process monitoring?

Common tools include:

* `htop` (interactive process viewer)
* `atop`
* `iotop` (disk I/O monitoring)
* `vmstat`
* `systemctl` (service management)

---

## 1️⃣1️⃣ What is the difference between foreground and background processes?

* **Foreground**: Attached to terminal; user waits for completion.
* **Background**: Runs independently; terminal remains usable.

---

## 1️⃣2️⃣ How can you check the priority of a process?

```bash
ps -o pid,ni,cmd -p <PID>
```

The **NI column** shows the nice value.

---

## 1️⃣3️⃣ What happens if you terminate PID 1?

PID 1 is usually `systemd`. Terminating it can crash the system or cause a reboot. It should never be killed manually.

---

## 1️⃣4️⃣ How do you monitor resource usage quickly?

```bash
top
```

Or more user-friendly:

```bash
htop
```

---

## 1️⃣5️⃣ Why is process management important in enterprise Linux systems?

It allows administrators to:

* Troubleshoot performance issues
* Prevent system overload
* Stop malicious processes
* Optimize resource allocation
* Maintain system stability
