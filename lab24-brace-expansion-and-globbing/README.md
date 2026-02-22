# 🧪 Lab 24: Brace Expansion and Globbing

## 🎯 Objective

This lab focuses on mastering:

- Brace expansion for efficient file and directory generation
- Globbing patterns for file matching
- Combining brace expansion and globbing for bulk operations
- Advanced pattern matching techniques for scripting automation

By the end of this lab, I demonstrated the ability to automate repetitive filesystem operations using native Bash features.

---

## 📌 Prerequisites

- Linux-based OS
- Bash 5.0+
- Basic command-line familiarity
- Standard GNU core utilities installed

---

**Environment:** Ubuntu 24.04.1 LTS (Cloud Lab Environment)  
**User:** toor  
**Bash Version:** 5.2  

---

## 🗂 Repository Structure

```
lab24-brace-expansion-and-globbing/
│
├── README.md
├── commands.sh
├── scripts/
│   └── pattern_examples.txt
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

# 🧩 Lab Tasks Overview

---

## 🔹 Task 1: Brace Expansion Fundamentals

### ✔ Numeric Expansion
Generated multiple filenames in one command:
```bash
echo file_{1..5}.txt
```

### ✔ String-Based Expansion
Created multiple report log files:
```bash
touch report_{jan,feb,mar}_2023.log
```

Brace expansion allows dynamic string generation before execution.

---

## 🔹 Task 2: Globbing Patterns

### ✔ Basic Globbing
```bash
ls *.log
ls report_*
```

### ✔ Pattern Matching
- `*` → zero or more characters
- `?` → exactly one character
- `[abc]` → match specific characters
- `[0-9]` → match digit range

Demonstrated how globbing matches existing files, unlike brace expansion which generates patterns.

---

## 🔹 Task 3: Combining Brace Expansion & Globbing

### ✔ Complex Directory Creation
```bash
mkdir -p projects/{src,bin,doc}/{web,cli,api}_{dev,prod}
```

Created 18 directories in a single command.

### ✔ Bulk File Generation
```bash
touch file_{a..d}{1..3}.tmp
```

### ✔ Pattern-Based File Movement
```bash
mv file_[a-b]?.tmp backup/
```

Matched and moved only specific files.

---

## 🧪 Verification Exercises

- Generated 10 files:
```bash
touch data_{01..10}.txt
```

- Listed even-numbered files:
```bash
ls data_*[02468].txt
```

- Copied files containing 1 or 3:
```bash
cp data_*[13].txt filtered/
```

---

# 🧠 Key Concepts Learned

| Concept | Purpose |
|----------|----------|
| `{}` | Generate strings before command execution |
| `*` | Match multiple characters |
| `?` | Match exactly one character |
| `[]` | Character class matching |
| `extglob` | Advanced extended pattern matching |

---

# 💡 Why This Matters (Real-World Relevance)

Brace expansion and globbing are critical for:

- DevOps automation
- Log management
- Batch file processing
- CI/CD scripting
- Linux system administration
- Bulk deployment operations

These techniques reduce manual work and prevent scripting errors.

---

# 📊 Result

✔ Efficient bulk file creation  
✔ Automated directory structure generation  
✔ Advanced file filtering  
✔ Pattern-based movement and copying  
✔ Prepared for extended globbing exploration  

---

# 🚀 Next Steps

Enabled extended globbing:
```bash
shopt -s extglob
```

Further exploration includes:

- `!(pattern)`
- `+(pattern)`
- `?(pattern)`
- `*(pattern)`

---

# 🧹 Cleanup

```bash
cd ..
rm -rf lab4_brace_globbing
```

Verified successful removal.

---

# 🏁 Conclusion

This lab strengthened my command-line efficiency by leveraging Bash-native expansion mechanisms.  
These foundational skills are essential for advanced scripting, Linux administration, and automation engineering.

---
