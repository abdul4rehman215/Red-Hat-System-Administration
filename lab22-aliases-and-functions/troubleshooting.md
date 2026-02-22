# 🛠 Troubleshooting Guide – Lab 22: Aliases and Functions

---

## Issue 1️⃣: `alias: command not found`

### 🔎 Problem
Running:
```
alias ll='ls -alF'
```
returns an error.

### 🎯 Possible Causes
- Not using Bash shell
- Running inside restricted shell
- PATH misconfiguration

### ✅ Resolution
Verify current shell:
```bash
echo $SHELL
```

Switch to Bash if needed:
```bash
bash
```

Confirm Bash version:
```bash
bash --version
```

### 🔐 Prevention
Always confirm shell environment before configuring aliases or functions.

---

## Issue 2️⃣: Alias Works in Terminal but Not in Script

### 🔎 Problem
Alias executes in interactive shell but fails inside `.sh` file.

### 🎯 Cause
Aliases are not expanded in non-interactive shells by default.

### ✅ Resolution
Add to script:
```bash
shopt -s expand_aliases
source ~/.bashrc
```

### 🔐 Prevention
For production scripts, prefer functions over aliases to ensure portability.

---

## Issue 3️⃣: `source ~/.bashrc` Does Not Apply Changes

### 🔎 Problem
Aliases or functions still unavailable after sourcing.

### 🎯 Possible Causes
- Syntax error in `.bashrc`
- Incorrect file modified
- Misplaced alias/function block

### ✅ Resolution
Check for syntax errors:
```bash
bash -n ~/.bashrc
```

Verify alias exists:
```bash
alias
```

Verify function exists:
```bash
type function_name
```

### 🔐 Prevention
Always test `.bashrc` syntax before reloading.

---

## Issue 4️⃣: `sudo` Prompt Inside Script Fails

### 🔎 Problem
Running:
```
update
```
inside script hangs or fails.

### 🎯 Cause
`sudo` requires password input, which may not work in non-interactive scripts.

### ✅ Resolution
Use:
```bash
sudo -n dnf update -y
```

Or configure passwordless sudo (only in secure controlled environments).

### 🔐 Prevention
Avoid embedding interactive `sudo` inside automation scripts.

---

## Issue 5️⃣: Function With Parameters Not Working

### 🔎 Problem
Running:
```
cstate start db_container
```
returns usage error.

### 🎯 Cause
Incorrect parameter syntax or missing container name.

### ✅ Resolution
Verify container name:
```bash
podman ps -a
```

Ensure correct syntax:
```bash
cstate start container_name
```

### 🔐 Prevention
Add input validation in functions:
```bash
if [ -z "$2" ]; then
 echo "Container name required"
fi
```

---

## Issue 6️⃣: Podman Command Not Found

### 🔎 Problem
Running `podman` returns:
```
command not found
```

### 🎯 Cause
Podman not installed or PATH misconfigured.

### ✅ Resolution
Verify installation:
```bash
podman --version
```

Install if missing:
```bash
sudo yum install podman
```

### 🔐 Prevention
Confirm required dependencies before scripting automation tasks.

---

## Issue 7️⃣: Cleanup Function Deletes Needed Containers

### 🔎 Problem
`pclean` removes containers unintentionally.

### 🎯 Cause
`podman container prune -f` removes all stopped containers.

### ✅ Resolution
Review before pruning:
```bash
podman ps -a
```

Remove `-f` to require confirmation:
```bash
podman container prune
```

### 🔐 Prevention
Use prune cautiously in production environments.

---

## Issue 8️⃣: Permission Denied When Running Script

### 🔎 Problem
```
./manage_system.sh: Permission denied
```

### 🎯 Cause
Script not executable.

### ✅ Resolution
Make executable:
```bash
chmod +x manage_system.sh
```

### 🔐 Prevention
Always set correct permissions after creating scripts.

---

# 📌 Summary

Common issues in alias and function management are typically:

- Shell configuration errors
- Script execution permission issues
- Non-interactive shell limitations
- Container engine misconfiguration

Understanding Bash behavior ensures reliable automation.

---
