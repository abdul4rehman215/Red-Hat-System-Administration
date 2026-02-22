# 🧪 Lab 03 – Managing Files and Directories via CLI

# 🎯 Lab Overview

This lab focuses on core file and directory management operations using the Linux command-line interface (CLI).

The lab demonstrates:

- Creating directories and files
- Copying and moving files
- Viewing file metadata
- Redirecting output using `>` and `>>`
- Deleting files and directories safely

These operations form the foundation of Linux system administration and are heavily tested in RHCSA certification exams.

---

# 🎯 Objectives

By completing this lab, I was able to:

- Create directories using `mkdir`
- Create files using `touch`
- Copy files using `cp`
- Move files using `mv`
- Delete files and directories using `rm`
- Explore file metadata using:
  - `ls -l`
  - `stat`
- Redirect and append output using:
  - `>`
  - `>>`

---

# 📋 Prerequisites

- Linux-based system (RHEL 9 used in this lab)
- Terminal access
- Standard user privileges
- Basic navigation skills (`pwd`, `cd`, `ls`)

---

# 🖥️ Lab Environment

| Component | Details |
|------------|----------|
| OS | Red Hat Enterprise Linux 9 |
| User | student |
| Working Directory | /home/student |
| Shell | Bash |
| File System | ext4 |

---

## 📁 Repository Structure

lab03-managing-files-and-directories-via-cli/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

---

# ✅ Task Overview

---

## 🟢 Task 1 – Creating Files and Directories

### 🔹 Subtask 1.1 – Create a Directory

- Verified current location using `pwd`
- Created directory `lab3_files`
- Verified directory creation using `ls`

### 🔹 Subtask 1.2 – Create a File

- Navigated into `lab3_files`
- Created empty file `notes.txt` using `touch`
- Verified file creation

---

## 🟢 Task 2 – Copying and Moving Files

### 🔹 Subtask 2.1 – Copy a File

- Created `notes_backup.txt` using `cp`
- Verified file duplication

### 🔹 Subtask 2.2 – Move a File

- Created directory `backup`
- Moved `notes_backup.txt` into `backup/`
- Verified relocation

---

## 🟢 Task 3 – Exploring File Metadata

### 🔹 Using `ls -l`

Displayed:

- File permissions
- Owner
- Group
- File size
- Modification time

### 🔹 Using `stat`

Displayed advanced metadata including:

- Inode number
- Access, modify, change timestamps
- Block size
- File type
- UID and GID
- Links count

---

## 🟢 Task 4 – Redirecting Output

### 🔹 Overwrite Redirection (`>`)

- Redirected `ls -l` output into `file_list.txt`
- Verified file content using `cat`

### 🔹 Append Redirection (`>>`)

- Appended `stat notes.txt` output into `file_list.txt`
- Verified appended metadata

This demonstrates:

- Output redirection
- File writing via command execution
- Combining multiple outputs into one file

---

## 🟢 Task 5 – Deleting Files and Directories

### 🔹 Delete a File

- Removed `notes.txt` using `rm`
- Verified deletion

### 🔹 Delete a Directory

- Removed `backup` directory using `rm -r`
- Verified directory removal

⚠ Used recursive flag carefully to avoid accidental deletion.

---

# 📊 Result

✔ Successfully created directories and files  
✔ Successfully copied and moved files  
✔ Verified metadata using `ls -l` and `stat`  
✔ Demonstrated output redirection and appending  
✔ Deleted files and directories safely  

All file management operations executed successfully via CLI.

---

# 🧠 What I Learned

- The importance of understanding file system hierarchy.
- Differences between copying and moving.
- How Linux stores metadata (inode, timestamps).
- How output redirection works internally.
- The risks of using `rm -r` without caution.
- How permissions and ownership are displayed in long listings.

---

# 🛡️ Why This Matters

File and directory management is a daily responsibility for:

- Linux Administrators
- DevOps Engineers
- Cloud Engineers
- System Engineers

Understanding metadata and file handling is essential for:

- Log management
- Configuration handling
- Backup operations
- Script automation
- Security auditing

---

# 🌍 Real-World Applications

- Managing application logs
- Backing up configuration files
- Auditing file changes
- Organizing deployment directories
- Redirecting command outputs for reporting
- Preparing data for automation scripts

---

# 🔎 Real-World Relevance

These commands are frequently used in:

- Production Linux servers
- Cloud VM management
- Container environments
- Enterprise storage systems
- CI/CD pipelines

This lab directly aligns with RHCSA exam objectives related to file system management.

---

# 🏁 Conclusion

In this lab, I:

✔ Created directories and files  
✔ Copied and moved files  
✔ Examined file metadata  
✔ Used redirection operators  
✔ Safely removed files and directories  

These foundational skills are essential for efficient Linux administration and are prerequisites for advanced tasks such as permissions management, scripting, and system automation.

---

📌 Commands executed are listed in `commands.sh`  
📌 Full outputs are documented in `output.txt`  
📌 Interview preparation questions are included in `interview_qna.md`  
📌 Troubleshooting scenarios are detailed in `troubleshooting.md`
