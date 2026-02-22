# 🧪 Lab 23 – Command Substitution

# 🎯 Objectives

This lab focuses on mastering command substitution in Bash to create dynamic and efficient shell operations.

By completing this lab, I achieved the ability to:

- Implement command substitution using `$()` syntax
- Use legacy backtick (`` ` ` ``) syntax correctly
- Nest command substitutions safely
- Perform dynamic file operations
- Build efficient command pipelines
- Automate file processing using substitution

---

# 📌 Prerequisites

- Basic Linux command-line knowledge
- Access to a Bash shell
- Standard GNU core utilities
- File system manipulation familiarity

---

## 📁 Repository Structure

```
lab23-command-substitution/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── scripts/
    └── practice_commands.txt

---

## 🖥 Environment Details

| Component | Value |
|------------|--------|
| OS | Ubuntu 24.04.1 LTS |
| Shell | GNU Bash 5.x |
| User | toor |
| Host | ip-172-31-10-203 |
| Tools | GNU Core Utilities |

---

# ⚙ Setup & Environment Preparation

## 🔹 Step 1 – Create Practice Directory

Created isolated working directory:

```
mkdir command_substitution_lab
cd command_substitution_lab
```

Confirmed working directory change.

---

## 🔹 Step 2 – Create Sample Files

Created test files:

- `file1.txt`
- `file2.log`
- `data.csv`
- `config.ini`
- `backup.tar.gz`

Verified file creation using `ls`.

---

# 🧩 Task 1 – Basic Command Substitution

## 🔹 Subtask 1.1 – Using `$()` Syntax

Executed:

```
echo "Today is $(date)"
```

Demonstrates dynamic insertion of command output.

Then counted files:

```
echo "There are $(ls | wc -l) files in this directory"
```

This shows substitution inside a pipeline.

---

## 🔹 Subtask 1.2 – Using Backtick Syntax

Executed:

```
echo "Today is `date`"
```

Demonstrated legacy syntax.

Then tested nested substitutions:

```
echo "Test 1: $(echo $(date))"
echo "Test 2: `echo \`date\``"
```

Key Insight:

- `$()` is cleaner
- Backticks require escaping when nested
- `$()` is recommended in modern scripting

---

# 🧩 Task 2 – Dynamic File Operations

## 🔹 Subtask 2.1 – Processing Files Dynamically

Added content to `.txt` file and used:

```
cat $(find . -name "*.txt")
```

Demonstrates passing dynamic file list to `cat`.

Then counted `.log` file lines:

```
wc -l $(find . -name "*.log")
```

Shows dynamic argument expansion.

---

## 🔹 Subtask 2.2 – Advanced File Operations

Created timestamped backup:

```
tar czf config_backup_$(date +%Y%m%d).tar.gz $(find . -name "*.ini")
```

Key Learning:

- Dynamic filename creation
- Date-based automation
- Automated config backup naming

Then tested large file detection:

```
du -h $(find . -size +1M)
```

Demonstrates dynamic file filtering.

---

# 🧩 Task 3 – Building Command Pipelines

## 🔹 Subtask 3.1 – Process Monitoring

Counted running processes dynamically:

```
echo "There are $(ps aux | wc -l) processes running"
```

Demonstrates pipeline output injection.

Identified largest file:

```
ls -S | head -n 1
```

---

## 🔹 Subtask 3.2 – Nested Command Substitution

Retrieved newest file modification time:

```
echo "Newest file was modified at $(date -r $(ls -t | head -n 1))"
```

Shows nested substitution usage.

Executed complex pipeline:

```
echo "The largest file is $(du -h $(find . -type f) | sort -h | tail -n 1)"
```

Demonstrates:

- File discovery
- Size calculation
- Sorting
- Dynamic output formatting

---

# 📊 Result

After completing this lab:

- Used both `$()` and backtick syntax
- Nested command substitutions correctly
- Automated file processing operations
- Built dynamic file backup naming
- Implemented process monitoring pipelines
- Practiced dynamic shell automation patterns

---

# 🌍 Why This Matters

Command substitution is foundational for:

- Shell scripting automation
- DevOps pipelines
- System monitoring
- Dynamic configuration management
- Backup automation
- Security auditing scripts

It enables real-time data-driven command execution.

---

# 💼 Real-World Applications

- Automated daily backups
- Dynamic log monitoring scripts
- File system auditing
- Security compliance checks
- Resource usage reporting
- Cron job automation

---

# 🔑 Key Takeaways

1. `$()` is modern and preferred.
2. Backticks are legacy and harder to nest.
3. Substitution enables dynamic script logic.
4. Nested substitutions allow complex workflows.
5. Pipelines combined with substitution create powerful automation.

---

# 🎓 Conclusion

In this lab, I successfully:

✔ Implemented both command substitution syntaxes  
✔ Created dynamic file operations  
✔ Built efficient command pipelines  
✔ Used nested substitution safely  
✔ Automated backup and monitoring logic  

This lab strengthened core Bash scripting skills essential for Linux system administration and automation engineering.

---

## 🧹 Cleanup

Removed practice directory to restore environment:

```
cd ..
rm -rf command_substitution_lab
```

Verified removal successfully.

---

✅ **Lab 03 Completed Successfully**  
Ubuntu 24.04 – Advanced Command Substitution & Pipelines
