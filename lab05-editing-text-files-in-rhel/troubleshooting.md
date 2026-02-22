# 🛠 Troubleshooting Guide – Lab 05: Editing Text Files in RHEL

---

# 🔎 1️⃣ vim Won’t Save File

## Problem

You attempt to save in vim but receive:

```bash
E212: Can't open file for writing
````

## Cause

* No write permission
* File owned by another user
* Editing system-protected file

## Solution

Check permissions:

```bash
ls -l filename.txt
```

Use sudo if needed:

```bash
sudo vim filename.txt
```

---

# 🔎 2️⃣ Stuck in vim (Cannot Exit)

## Problem

User cannot exit vim.

## Solution

Press:

```text
ESC
```

Then:

```text
:q
```

If file modified and you want to quit without saving:

```text
:q!
```

To save and exit:

```text
:wq
```

---

# 🔎 3️⃣ nano Not Installed

## Problem

```bash
nano: command not found
```

## Solution

Install nano:

```bash
sudo dnf install nano -y
```

Verify:

```bash
nano --version
```

---

# 🔎 4️⃣ sed Did Not Modify File

## Problem

You ran:

```bash
sed 's/RHEL/Red Hat/g' versions.txt
```

But file did not change.

## Cause

Missing `-i` flag.

## Solution

Use:

```bash
sed -i 's/RHEL/Red Hat/g' versions.txt
```

---

# 🔎 5️⃣ sed Pattern Not Matching

## Problem

Replacement does not occur.

## Cause

* Case mismatch
* Extra spaces
* Pattern incorrect

## Debug

Check exact content:

```bash
cat -n versions.txt
```

Use case-insensitive match:

```bash
sed -i 's/rhel/Red Hat/gi' versions.txt
```

---

# 🔎 6️⃣ Accidental sed Overwrite

## Problem

You replaced text incorrectly and lost original content.

## Prevention

Always create backup:

```bash
sed -i.bak 's/old/new/g' file.txt
```

Restore backup:

```bash
mv file.txt.bak file.txt
```

---

# 🔎 7️⃣ awk Column Not Printing Correctly

## Problem

Output appears incorrect or empty.

## Cause

Incorrect field separator.

## Fix

If CSV:

```bash
awk -F ',' '{print $2}' users.csv
```

If space-separated:

```bash
awk '{print $2}' filename.txt
```

---

# 🔎 8️⃣ awk Condition Not Matching

## Problem

No output from:

```bash
awk -F ',' '$3 == "RHEL" {print $0}' users.csv
```

## Cause

* Extra whitespace
* Case mismatch

## Debug

Check spacing:

```bash
cat -A users.csv
```

Use trim approach:

```bash
awk -F ',' '$3 ~ /RHEL/' users.csv
```

---

# 🔎 9️⃣ File Not Found Errors

## Problem

```bash
sed: can't read versions.txt: No such file or directory
```

## Solution

Verify current directory:

```bash
pwd
```

List files:

```bash
ls
```

---

# 🔎 🔟 Permission Denied on File Editing

## Problem

```bash
sed: couldn't open temporary file: Permission denied
```

## Cause

No write permission in directory.

## Solution

Check directory permissions:

```bash
ls -ld .
```

Use sudo if required:

```bash
sudo sed -i 's/old/new/g' file.txt
```

---

# 📌 Best Practices Learned

✔ Always verify file location with `pwd`
✔ Use `ls -l` before editing
✔ Create backups before mass replacement
✔ Use correct field separators in awk
✔ Understand modal editing in vim
✔ Prefer safe editing methods in production

---

# 💼 Professional Insight

Text manipulation is heavily used in:

* Log parsing
* Configuration management
* Infrastructure automation
* DevOps CI/CD pipelines
* Security analytics
* Cloud scripting

Mastery of vim, sed, and awk significantly increases Linux productivity.

---
