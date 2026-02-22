# 🎓 Interview Q&A – Lab 03: Managing Files and Directories via CLI

---

## 1️⃣ What is the difference between `cp` and `mv`?

**Answer:**  
- `cp` creates a duplicate copy of a file or directory.
- `mv` moves a file or directory to a new location or renames it.

`cp` keeps the original intact, while `mv` relocates it.

---

## 2️⃣ How do you create an empty file from the command line?

**Answer:**  
Using the `touch` command:

```bash
touch filename.txt
````

This creates an empty file if it doesn’t exist or updates timestamps if it does.

---

## 3️⃣ What does `mkdir -p` do?

**Answer:**
The `-p` flag creates parent directories if they do not already exist.

Example:

```bash
mkdir -p dir1/dir2/dir3
```

It creates the full path structure in one command.

---

## 4️⃣ What information does `ls -l` provide?

**Answer:**
It displays:

* File permissions
* Number of links
* Owner
* Group
* File size
* Last modification date
* File name

Example:

```bash
-rw-r--r-- 1 student student 0 Feb 22 11:01 notes.txt
```

---

## 5️⃣ What is an inode?

**Answer:**
An inode is a data structure in Linux that stores metadata about a file, such as:

* File size
* Permissions
* Owner
* Timestamps
* Block locations

It does **not** store the filename itself.

You can view inode details using:

```bash
stat filename
```

---

## 6️⃣ What is the difference between `>` and `>>`?

**Answer:**

| Operator | Function        |
| -------- | --------------- |
| `>`      | Overwrites file |
| `>>`     | Appends to file |

Example:

```bash
ls > output.txt      # Overwrites
ls >> output.txt     # Appends
```

---

## 7️⃣ How do you safely remove a file interactively?

**Answer:**
Use the `-i` flag:

```bash
rm -i filename.txt
```

It prompts for confirmation before deletion.

---

## 8️⃣ What is the risk of using `rm -r`?

**Answer:**
`rm -r` recursively deletes directories and all contents permanently.

There is no built-in undo. It must be used carefully, especially as root.

---

## 9️⃣ How can you verify that a file was moved successfully?

**Answer:**

After running:

```bash
mv file.txt backup/
```

Verify with:

```bash
ls backup/
```

If the file appears there and no longer exists in the original directory, the move was successful.

---

## 🔟 Why is file management important in system administration?

**Answer:**

Efficient file management is critical for:

* System organization
* Backup management
* Log handling
* Configuration management
* Security (proper permissions)
* Automation workflows

It forms the foundation of Linux system administration.

---

## 1️⃣1️⃣ How can you check file permissions in numeric format?

**Answer:**

Use:

```bash
stat filename
```

Or:

```bash
ls -l
```

Permissions like `-rw-r--r--` correspond to numeric values such as `0644`.

---

## 1️⃣2️⃣ What does the dot (`.`) at the end of permissions mean in RHEL?

Example:

```bash
-rw-r--r--.
```

**Answer:**
The dot indicates that **extended attributes** or **SELinux context** are applied to the file.

---

# ✅ Interview Readiness Summary

This lab demonstrates foundational Linux file system operations, which are heavily tested in:

* RHCSA
* Linux System Administration interviews
* DevOps roles
* Cloud Engineering positions

Mastery of file manipulation is considered a baseline skill for Linux professionals.
