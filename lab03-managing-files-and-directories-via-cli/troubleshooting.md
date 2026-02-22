# 🛠 Troubleshooting Guide – Lab 03: Managing Files and Directories via CLI

---

# 🔎 1️⃣ Permission Denied Errors

## Problem
You receive:

```bash
rm: cannot remove 'backup': Permission denied
````

## Cause

* Insufficient user privileges
* File owned by another user
* Restricted directory permissions

## Solution

Check file ownership:

```bash
ls -l
```

Use sudo if appropriate:

```bash
sudo rm -r backup
```

Or change ownership:

```bash
sudo chown student:student backup
```

---

# 🔎 2️⃣ File Not Found Error

## Problem

```bash
rm: cannot remove 'notes.txt': No such file or directory
```

## Cause

* Typo in filename
* Wrong directory
* File already deleted

## Solution

Verify current directory:

```bash
pwd
```

List files:

```bash
ls -a
```

Use tab-completion to avoid spelling mistakes.

---

# 🔎 3️⃣ Cannot Remove Directory (Directory Not Empty)

## Problem

```bash
rm: cannot remove 'backup': Is a directory
```

## Cause

You tried removing a directory without `-r`.

## Solution

Use recursive removal:

```bash
rm -r backup
```

For confirmation prompts:

```bash
rm -ri backup
```

---

# 🔎 4️⃣ Overwriting Files Accidentally

## Problem

Using:

```bash
ls > file_list.txt
```

Overwrites existing content.

## Prevention

Use append operator:

```bash
ls >> file_list.txt
```

Or confirm before overwrite:

```bash
set -o noclobber
```

To disable:

```bash
set +o noclobber
```

---

# 🔎 5️⃣ cp Command Overwrites File Without Warning

## Problem

```bash
cp notes.txt notes_backup.txt
```

Overwrites existing file silently.

## Prevention

Use interactive mode:

```bash
cp -i notes.txt notes_backup.txt
```

---

# 🔎 6️⃣ Accidental Deletion with rm -r

## Risk

`rm -r` permanently deletes directories.

There is no recycle bin in CLI.

## Best Practice

Use interactive mode:

```bash
rm -ri backup
```

Or use safe aliases:

```bash
alias rm='rm -i'
```

Add this to `~/.bashrc` for safety.

---

# 🔎 7️⃣ Understanding Metadata Confusion

## Problem

User unsure about inode, links, or timestamps.

## Solution

Use:

```bash
stat filename
```

Check:

* Access time (atime)
* Modify time (mtime)
* Change time (ctime)
* Birth time (creation)

Understanding timestamps helps in forensic analysis and auditing.

---

# 🔎 8️⃣ SELinux Context Issues (RHEL Specific)

If you see permission-like issues even with correct file permissions:

```bash
ls -lZ
```

SELinux contexts may restrict access.

Temporarily check SELinux status:

```bash
sestatus
```

---

# 🔎 9️⃣ Working in Wrong Directory

Common beginner mistake:

Performing commands in `/home` instead of `/home/student/lab3_files`.

Always confirm:

```bash
pwd
```

---

# 🔎 🔟 Redirection Confusion

Remember:

| Operator | Behavior                 |
| -------- | ------------------------ |
| `>`      | Overwrite                |
| `>>`     | Append                   |
| `2>`     | Redirect errors          |
| `&>`     | Redirect stdout + stderr |

Example:

```bash
ls nonexistent 2> error.txt
```

---

# 📌 Best Practices Learned

✔ Always verify location with `pwd`
✔ Use `ls -l` before deleting
✔ Use `-i` flags for safety
✔ Be cautious with `rm -r`
✔ Understand metadata using `stat`
✔ Use redirection carefully

---

# 🚀 Professional Insight

These troubleshooting skills are essential for:

* RHCSA exam scenarios
* Linux server administration
* DevOps pipelines
* Production system maintenance
* Security auditing

File management errors are one of the most common causes of outages in production systems.

---
