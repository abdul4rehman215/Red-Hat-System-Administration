# 🧪 Lab 05: Editing Text Files in RHEL

---

## 🎯 Objectives

By the end of this lab, I was able to:

- Create and edit text files using command-line editors (`vim`, `nano`)
- Perform inline text replacements using `sed`
- Process and manipulate structured text using `awk`
- Understand field separation and pattern matching in text processing

---

## 🖥️ Lab Environment

- OS: Red Hat Enterprise Linux 9.x
- Shell: Bash
- User: `student`
- Editors: `vim`, `nano`
- Text Processing Tools: `sed`, `awk`

---

## 📂 Repository Structure

```

lab05-editing-text-files/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md

```

---

# ✅ Task Overview

---

## ✏️ Task 1: Editing Files with vim and nano

### 🔹 vim

- Created file `lab5_vim.txt`
- Entered Insert Mode
- Saved using `:wq`
- Verified using `cat`

### 🔹 nano

- Created file `lab5_nano.txt`
- Used keyboard shortcuts:
  - `Ctrl + O` → Save
  - `Ctrl + X` → Exit
- Verified file contents

📌 Learned difference between modal editor (vim) and modeless editor (nano).

---

## 🔁 Task 2: Inline Text Replacement with sed

### 🔹 Replace Text

- Created `versions.txt`
- Replaced `RHEL` with `Red Hat`
- Used `-i` flag for inline editing

### 🔹 Backup Editing

- Used `-i.bak` to create backup file

### 🔹 Delete Pattern

- Removed lines containing `Fedora`
- Used pattern-based deletion

📌 Learned safe editing and pattern matching with sed.

---

## 📊 Task 3: Text Processing with awk

### 🔹 Extract Columns

- Created `users.csv`
- Extracted second column (Name)
- Used field separator `-F ','`

### 🔹 Conditional Filtering

- Printed rows where OS equals `RHEL`

📌 Learned field-based filtering and structured text parsing.

---

# 🧠 Key Commands Practiced

| Command | Purpose |
|----------|----------|
| `vim` | Advanced modal editor |
| `nano` | Beginner-friendly editor |
| `sed -i` | Inline text replacement |
| `sed '/pattern/d'` | Delete matching lines |
| `awk -F` | Field-based processing |
| `awk '$3 == value'` | Conditional filtering |

---

# 💼 Real-World Relevance

Text editing and processing are foundational skills for:

- System administration
- DevOps automation
- Log analysis
- Configuration management
- CSV parsing
- Security auditing
- CI/CD scripting

Enterprise environments rely heavily on `sed` and `awk` for automation.

---

# 🏁 Conclusion

In this lab, I successfully:

✔ Edited files using `vim` and `nano`  
✔ Performed inline text replacement with `sed`  
✔ Processed CSV data using `awk`  
✔ Applied filtering and field extraction  

I now understand core Linux text manipulation workflows.

---
