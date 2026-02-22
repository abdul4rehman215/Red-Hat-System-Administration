# 🛠 Troubleshooting Guide – Lab 25: Job Control

---

## Issue 1️⃣: `jobs` Shows Nothing

### 🔎 Problem
Running:
```bash
jobs
```
returns no output.

### 🎯 Cause
- No background jobs exist
- Process was already terminated
- Running in a new shell session

### ✅ Resolution
Start a new background job:
```bash
sleep 300 &
```

Then verify:
```bash
jobs
```

### 🔐 Prevention
Remember that jobs are session-specific and do not persist across terminal sessions.

---

## Issue 2️⃣: `fg %1` Returns “No Such Job”

### 🔎 Problem
```bash
fg %1
```
returns:
```
bash: fg: %1: no such job
```

### 🎯 Cause
- Job already terminated
- Incorrect job number
- Different shell session

### ✅ Resolution
Check active jobs:
```bash
jobs
```

Use correct job number.

---

## Issue 3️⃣: `kill PID` Does Not Stop Process

### 🔎 Problem
Process continues running after:
```bash
kill PID
```

### 🎯 Cause
Process ignored SIGTERM signal.

### ✅ Resolution
Force termination:
```bash
kill -9 PID
```

### 🔐 Prevention
Use `kill` first. Only use `kill -9` when necessary.

---

## Issue 4️⃣: Background Job Stops After Logout

### 🔎 Problem
Long-running process stops after terminal closes.

### 🎯 Cause
Process tied to terminal session.

### ✅ Resolution
Use:
```bash
nohup command &
```

Or:
```bash
disown %1
```

### 🔐 Prevention
Use `nohup` for persistent jobs.

---

## Issue 5️⃣: Suspended Process Not Resuming

### 🔎 Problem
After pressing Ctrl+Z, process remains stopped.

### 🎯 Cause
Not resumed using `bg` or `fg`.

### ✅ Resolution
Resume:
```bash
bg %1
```
or
```bash
fg %1
```

---

## Issue 6️⃣: Wrong Process Killed

### 🔎 Problem
Accidentally terminated incorrect PID.

### 🎯 Cause
Confusion between multiple PIDs.

### ✅ Resolution
Always verify before killing:
```bash
ps aux | grep process_name
```

### 🔐 Prevention
Use `pkill process_name` carefully or verify PID via `jobs -l`.

---

## Issue 7️⃣: Podman Container Not Stopping

### 🔎 Problem
```bash
podman stop lab_nginx
```
hangs or does not stop.

### 🎯 Cause
Container process not responding to SIGTERM.

### ✅ Resolution
Force remove:
```bash
podman rm -f lab_nginx
```

---

## Issue 8️⃣: Cannot Suspend Process with Ctrl+Z

### 🔎 Problem
Ctrl+Z does nothing.

### 🎯 Cause
Process running in background already
OR
Running inside non-interactive shell

### ✅ Resolution
Bring to foreground first:
```bash
fg %1
```

Then suspend.

---

## Issue 9️⃣: Permission Denied When Killing Process

### 🔎 Problem
```bash
kill PID
```
returns:
```
Operation not permitted
```

### 🎯 Cause
Trying to kill process owned by another user.

### ✅ Resolution
Use sudo (if authorized):
```bash
sudo kill PID
```

---

# 📌 Summary

Common job control problems arise due to:

- Session-based job handling
- Incorrect PID usage
- Signal misunderstanding
- Terminal-dependent processes
- Permission issues

Understanding process lifecycle and signals ensures safe and effective system administration.

---
