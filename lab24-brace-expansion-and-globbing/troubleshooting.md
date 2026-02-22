# 🛠 Troubleshooting Guide – Lab 24: Brace Expansion and Globbing

---

## Issue 1️⃣: Brace Expansion Not Working

### 🔎 Problem
Running:
```bash
echo file_{1..5}.txt
```
prints literally:
```
file_{1..5}.txt
```

### 🎯 Cause
- Using a non-Bash shell (e.g., sh)
- Brace expansion disabled in current shell

### ✅ Resolution
Verify shell:
```bash
echo $SHELL
```

Switch to Bash:
```bash
bash
```

Check Bash version:
```bash
bash --version
```

### 🔐 Prevention
Always confirm you are using Bash 4.0+.

---

## Issue 2️⃣: Globbing Pattern Returns “No Such File”

### 🔎 Problem
```bash
ls report_[0-9]*.log
```
returns:
```
No such file or directory
```

### 🎯 Cause
No files match the pattern.

Globbing only matches existing files.

### ✅ Resolution
Verify existing filenames:
```bash
ls
```

Adjust pattern accordingly.

### 🔐 Prevention
Use:
```bash
shopt -s nullglob
```
to avoid errors when no match exists.

---

## Issue 3️⃣: `tree` Command Not Found

### 🔎 Problem
```bash
tree projects/
```
returns:
```
command not found
```

### 🎯 Cause
`tree` package not installed.

### ✅ Resolution
Install:
```bash
sudo apt install tree
```

### 🔐 Prevention
Verify required utilities before running lab commands.

---

## Issue 4️⃣: Extended Globbing Not Working

### 🔎 Problem
Pattern like:
```bash
ls !(*.log)
```
does not work.

### 🎯 Cause
Extended globbing not enabled.

### ✅ Resolution
Enable extglob:
```bash
shopt -s extglob
```

Verify:
```bash
shopt extglob
```

Should show:
```
extglob        on
```

### 🔐 Prevention
Always enable extglob before using advanced patterns.

---

## Issue 5️⃣: Unexpected File Matches

### 🔎 Problem
Pattern:
```bash
mv file_[a-b]?.tmp backup/
```
moves unexpected files.

### 🎯 Cause
Pattern interpretation misunderstood:
- `[a-b]` matches letters a through b
- `?` matches exactly one character

### ✅ Resolution
Test pattern before moving:
```bash
ls file_[a-b]?.tmp
```

### 🔐 Prevention
Always preview matches before destructive commands like `mv` or `rm`.

---

## Issue 6️⃣: Accidentally Deleted Files with Wildcard

### 🔎 Problem
Running:
```bash
rm *.tmp
```
deleted more files than expected.

### 🎯 Cause
Wildcard matched all `.tmp` files in directory.

### ✅ Resolution
Restore from backup if available.

### 🔐 Prevention
Use interactive mode:
```bash
rm -i *.tmp
```

Or preview with:
```bash
ls *.tmp
```

---

## Issue 7️⃣: Brace Expansion with Spaces Fails

### 🔎 Problem
```bash
touch file_{a, b}.txt
```
creates unexpected output.

### 🎯 Cause
Spaces inside braces break expansion.

### ✅ Resolution
Remove spaces:
```bash
touch file_{a,b}.txt
```

### 🔐 Prevention
Never include spaces inside brace expansion lists.

---

## Issue 8️⃣: Character Class Not Matching

### 🔎 Problem
```bash
ls data_[13].txt
```
does not match expected files.

### 🎯 Cause
Pattern only matches exactly one character in that position.

Example:
- Matches `data_1.txt`
- Does NOT match `data_13.txt`

### ✅ Resolution
Use wildcard:
```bash
ls data_*[13].txt
```

### 🔐 Prevention
Understand position-based pattern matching.

---

# 📌 Summary

Common problems in brace expansion and globbing include:

- Using wrong shell
- Misunderstanding wildcard behavior
- Forgetting to enable extglob
- Not previewing patterns before destructive operations
- Confusing string generation vs file matching

Mastering these ensures safe and efficient automation.

---
