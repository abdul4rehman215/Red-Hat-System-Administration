# 🛠 Troubleshooting Guide – Lab 21: Advanced Bash History and Search

---

## Issue 1️⃣: `Ctrl+R` Not Working

### 🔎 Problem
Pressing `Ctrl+R` does not initiate reverse search.

### 🎯 Possible Causes
- Terminal emulator keybinding conflict
- Shell is not Bash
- Keyboard shortcut overridden

### ✅ Resolution
1. Verify current shell:
   ```bash
   echo $SHELL
   ```
2. Ensure Bash is running:
   ```bash
   bash
   ```
3. Check terminal keybinding settings.

### 🔐 Prevention
- Use standard terminal emulator (GNOME Terminal, iTerm2, etc.)
- Avoid remapping control keys unnecessarily.

---

## Issue 2️⃣: History Not Persisting Across Sessions

### 🔎 Problem
Commands disappear after logging out.

### 🎯 Possible Causes
- `histappend` not enabled
- `HISTSIZE` or `HISTFILESIZE` too small
- Improper shell exit

### ✅ Resolution
Add to `~/.bashrc`:

```bash
shopt -s histappend
HISTSIZE=5000
HISTFILESIZE=10000
```

Reload:
```bash
source ~/.bashrc
```

### 🔐 Prevention
- Always exit shell properly using `exit`
- Avoid force-closing terminal windows

---

## Issue 3️⃣: Duplicate Commands Filling History

### 🔎 Problem
Repeated commands clutter history.

### 🎯 Cause
`HISTCONTROL` not configured.

### ✅ Resolution
Add:

```bash
HISTCONTROL=ignoreboth
```

Reload configuration:
```bash
source ~/.bashrc
```

### 🔐 Prevention
Set history control early in shell configuration.

---

## Issue 4️⃣: Alias Not Recognized (`hs: command not found`)

### 🔎 Problem
Running `hs docker` results in:
```
command not found
```

### 🎯 Cause
- Alias not added correctly
- `~/.bashrc` not reloaded

### ✅ Resolution
Verify alias exists:
```bash
alias
```

If missing:
```bash
nano ~/.bashrc
```

Add:
```bash
alias hs='history | grep'
```

Reload:
```bash
source ~/.bashrc
```

### 🔐 Prevention
Always reload configuration after editing shell files.

---

## Issue 5️⃣: Custom Function `hst` Not Executing

### 🔎 Problem
Running `hst` returns:
```
command not found
```

### 🎯 Cause
Function not defined properly or missing `source` execution.

### ✅ Resolution
Verify function exists:
```bash
type hst
```

If not defined:
Re-add function in `~/.bashrc` and reload:
```bash
source ~/.bashrc
```

### 🔐 Prevention
- Ensure no syntax errors in function definition
- Avoid incorrect indentation or quoting errors

---

## Issue 6️⃣: History Contains Sensitive Information

### 🔎 Problem
Sensitive commands (e.g., passwords) appear in history.

### 🎯 Cause
Commands executed without ignoring history.

### ✅ Resolution
Clear history:
```bash
history -c
```

Remove history file:
```bash
rm ~/.bash_history
```

Use space-prefixed commands:
```bash
 echo "This will not be saved"
```

### 🔐 Prevention
- Avoid passing secrets directly in CLI arguments
- Use secure methods (environment variables, prompts)
- Enable:
```bash
HISTCONTROL=ignorespace
```

---

## Issue 7️⃣: History File Permission Issues

### 🔎 Problem
Cannot write to `~/.bash_history`.

### 🎯 Cause
Incorrect file ownership or permissions.

### ✅ Resolution
Check ownership:
```bash
ls -l ~/.bash_history
```

Fix ownership:
```bash
chown $USER:$USER ~/.bash_history
chmod 600 ~/.bash_history
```

### 🔐 Prevention
Maintain correct user permissions on home directory files.

---

# 📌 Summary

Common issues in advanced Bash history management are typically configuration-related. Proper `.bashrc` management, correct use of `source`, and understanding shell behavior resolve most problems.
