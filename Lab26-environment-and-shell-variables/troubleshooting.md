# 🛠 Troubleshooting Guide – Lab 26: Environment and Shell Variables

---

## Issue 1️⃣: Variable Not Expanding

### 🔎 Problem
```bash
echo '$HOME'
```
Output:
```
$HOME
```

### 🎯 Cause
Single quotes prevent variable expansion.

### ✅ Resolution
Use double quotes:
```bash
echo "$HOME"
```

---

## Issue 2️⃣: Variable Not Persistent After Logout

### 🔎 Problem
After reopening terminal:
```bash
echo $PROJECT_DIR
```
Returns empty.

### 🎯 Cause
Variable not added to correct configuration file.

### ✅ Resolution
Add to:
```bash
~/.bashrc
```

Then reload:
```bash
source ~/.bashrc
```

---

## Issue 3️⃣: `Permission denied` When Running Script

### 🔎 Problem
```bash
./variables.sh
```
Returns:
```
Permission denied
```

### 🎯 Cause
Script not executable.

### ✅ Resolution
```bash
chmod +x variables.sh
```

---

## Issue 4️⃣: `Command not found` for Script

### 🔎 Problem
Typing:
```bash
variables.sh
```
returns:
```
command not found
```

### 🎯 Cause
Current directory not in PATH.

### ✅ Resolution
Run with:
```bash
./variables.sh
```

Or add directory to PATH.

---

## Issue 5️⃣: Variable Not Available in Child Process

### 🔎 Problem
Script cannot see variable defined in parent shell.

### 🎯 Cause
Variable not exported.

### ✅ Resolution
Use:
```bash
export VAR_NAME=value
```

---

## Issue 6️⃣: Local Variable Accessible Outside Function

### 🔎 Problem
Unexpected global variable behavior.

### 🎯 Cause
`local` keyword not used.

### ✅ Resolution
Inside function:
```bash
local var="value"
```

---

## Issue 7️⃣: Incorrect Variable Expansion in Scripts

### 🔎 Problem
```bash
echo $var_text
```
Unexpected result.

### 🎯 Cause
Variable name ambiguity.

### ✅ Resolution
Use braces:
```bash
echo "${var}_text"
```

---

## Issue 8️⃣: Configuration File Not Loading

### 🔎 Problem
```bash
source config.cfg
```
Returns error.

### 🎯 Cause
Wrong file path or syntax error.

### ✅ Resolution
Ensure file exists:
```bash
ls config.cfg
```

Ensure proper syntax:
```
VAR=value
```
(No spaces around `=`)

---

## Issue 9️⃣: Special Characters Breaking Script

### 🔎 Problem
Variables containing spaces break commands.

### 🎯 Cause
Unquoted variable usage.

### ✅ Resolution
Always quote variables:
```bash
mkdir -p "$BACKUP_DIR"
```

---

## Issue 🔟: PATH Variable Misconfigured

### 🔎 Problem
Common commands not found.

### 🎯 Cause
PATH overwritten instead of appended.

Incorrect:
```bash
export PATH=/custom/path
```

Correct:
```bash
export PATH=$PATH:/custom/path
```

---

# 📌 Summary

Common variable-related issues include:

- Improper quoting
- Not exporting variables
- Incorrect scope handling
- PATH misconfiguration
- Script execution permissions

Mastering these prevents automation failures and production incidents.

---
