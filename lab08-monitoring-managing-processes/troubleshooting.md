### 📂 Lab 08 – File 5 of 6

Here is the complete **`troubleshooting.md`**

---

```markdown
# 🛠 Lab 08 – Troubleshooting Guide  
## Monitoring and Managing Processes

---

## 🔍 Issue 1: `htop` Command Not Found

### ❌ Error
```

bash: htop: command not found

````

### ✅ Solution
Install htop using:
```bash
sudo dnf install htop -y
````

Verify installation:

```bash
htop --version
```

---

## 🔍 Issue 2: Permission Denied When Using `renice`

### ❌ Error

```
renice: failed to set priority for PID 1378 (process ID): Permission denied
```

### ✅ Cause

Only root can decrease nice values (increase priority).

### ✅ Solution

Use sudo:

```bash
sudo renice -n 5 -p 1378
```

---

## 🔍 Issue 3: `kill` Does Not Terminate Process

### ❌ Behavior

Process continues running after:

```bash
kill <PID>
```

### ✅ Cause

Process ignored SIGTERM (signal 15).

### ✅ Solution

Force terminate:

```bash
kill -9 <PID>
```

⚠ Use SIGKILL carefully — no cleanup occurs.

---

## 🔍 Issue 4: `pkill` Kills Wrong Process

### ❌ Cause

Multiple processes match the same name.

### ✅ Solution

Be specific:

```bash
pkill -f "sleep 300"
```

Preview before killing:

```bash
pgrep sleep
```

---

## 🔍 Issue 5: Job Control Not Working

### ❌ Error

```
fg: no such job
```

### ✅ Cause

No background job exists.

### ✅ Solution

Start a background job first:

```bash
sleep 300 &
jobs
```

---

## 🔍 Issue 6: Cannot Bring Job to Foreground

### ❌ Cause

Incorrect job ID.

### ✅ Solution

Check active jobs:

```bash
jobs
```

Then use correct ID:

```bash
fg %1
```

---

## 🔍 Issue 7: High CPU Usage

### Diagnose

```bash
top
```

Sort by CPU:

* Press **Shift + P** in top

Or:

```bash
ps aux --sort=-%cpu | head
```

---

## 🔍 Issue 8: High Memory Usage

### Diagnose

```bash
top
```

Sort by memory:

* Press **Shift + M**

Or:

```bash
ps aux --sort=-%mem | head
```

---

## 🔍 Issue 9: Zombie Processes Appearing

### Identify

In `ps aux`, STAT column shows:

```
Z
```

### Explanation

Zombie processes are terminated processes waiting for parent cleanup.

### Solution

Restart parent process or reboot if necessary.

---

## 🔍 Issue 10: Cannot Kill Root-Owned Process

### ❌ Error

```
Operation not permitted
```

### ✅ Solution

Use sudo:

```bash
sudo kill <PID>
```

---

## 🔍 Issue 11: Incorrect Nice Value

### Verify Current Priority

```bash
ps -o pid,ni,cmd -p <PID>
```

### Correct It

```bash
sudo renice -n 10 -p <PID>
```

---

## 🔍 Issue 12: Process Not Found

### ❌ Error

```
kill: (1234) - No such process
```

### ✅ Cause

Process already terminated.

### ✅ Verify

```bash
ps aux | grep processname
```

---

# 🧠 Best Practices

* Always try SIGTERM before SIGKILL.
* Verify PID before killing.
* Use `pgrep` before `pkill`.
* Avoid renicing critical system processes.
* Monitor system load regularly.

---

# ✅ Lab 08 Completed Successfully

✔ Viewed running processes
✔ Used dynamic monitoring tools
✔ Sent signals correctly
✔ Managed job control
✔ Adjusted process priorities
✔ Troubleshot common process issues

---

```

---

### 📂 Remaining File

Next and final file:

📄 `README.md` for Lab 08  

Proceed?
```
