# 🎤 Interview Q&A – Lab 25: Job Control

---

## 1️⃣ What is Job Control in Linux?

Job control allows users to manage multiple processes within a single terminal session by running them in the foreground or background.

It enables suspending, resuming, and terminating processes efficiently.

---

## 2️⃣ What is the difference between a Job and a Process?

| Job | Process |
|------|---------|
| Managed by the shell | Managed by the kernel |
| Identified by job number (%1) | Identified by PID |
| Visible via `jobs` | Visible via `ps` |

---

## 3️⃣ How do you run a process in the background?

By appending `&` to the command:

```bash
sleep 300 &
```

---

## 4️⃣ How do you list background jobs?

```bash
jobs
```

To include PID:
```bash
jobs -l
```

---

## 5️⃣ How do you bring a background job to the foreground?

```bash
fg %1
```

---

## 6️⃣ How do you suspend a foreground process?

Press:

```
Ctrl + Z
```

This sends SIGTSTP to the process.

---

## 7️⃣ How do you resume a stopped job in the background?

```bash
bg %1
```

---

## 8️⃣ What is the difference between `kill` and `kill -9`?

| Command | Signal | Behavior |
|----------|--------|-----------|
| kill PID | SIGTERM (15) | Graceful termination |
| kill -9 PID | SIGKILL (9) | Force termination |

SIGKILL cannot be intercepted.

---

## 9️⃣ What does `kill -l` do?

Lists all available signals in the system.

---

## 🔟 What is SIGTERM?

Signal 15 (default kill signal).  
Requests process to terminate gracefully.

---

## 1️⃣1️⃣ What is SIGKILL?

Signal 9.  
Forces immediate termination.  
Cannot be caught or ignored.

---

## 1️⃣2️⃣ What is the purpose of `nohup`?

Allows a process to continue running after terminal logout.

Example:

```bash
nohup sleep 600 &
```

---

## 1️⃣3️⃣ What does `disown` do?

Removes a job from shell job control without terminating it.

Example:

```bash
disown %1
```

---

## 1️⃣4️⃣ Why is job control important in DevOps?

Because it allows:

- Managing long-running deployments
- Monitoring background services
- Handling hung processes
- Managing container lifecycle
- Debugging production issues

---

## 1️⃣5️⃣ How does job control relate to containers?

Containers are managed processes.

Commands like:

```bash
podman run -d
podman stop
```

internally manage process states and signals.

Understanding job control helps manage containers efficiently.

---

# ✅ Interview Summary

Job control is a fundamental Linux skill required for:

- System Administration
- DevOps Engineering
- Cloud Engineering
- Incident Response
- RHCSA Certification

Mastery of process states and signals is critical for production environments.

---
