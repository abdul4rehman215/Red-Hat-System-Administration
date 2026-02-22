# 🧪 Lab 22 – Aliases and Functions

# 🎯 Objectives

This lab focuses on mastering Bash aliases and shell functions to improve efficiency and automate administrative tasks.

By completing this lab, I achieved the ability to:

- Understand and implement command aliases
- Create temporary and persistent aliases
- Develop shell functions for automation
- Use parameters in shell functions
- Integrate aliases and functions into executable scripts
- Automate container management tasks using Podman

---

# 📌 Prerequisites

- Basic Linux command-line knowledge
- Bash shell environment
- Podman installed
- Text editor (nano / vim)

---

## 📁 Repository Structure

```
lab22-aliases-and-functions/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
│
└── scripts/
    ├── manage_system.sh
    ├── container_report.sh
    └── bashrc_additions.txt
```

---

## 🖥 Environment Details

| Component | Value |
|------------|--------|
| OS | CentOS Linux 7 (Core) |
| Shell | GNU Bash 4.2.46 |
| Container Engine | Podman 4.6.1 |
| User | centos |
| Access Level | Standard User |

---

# ⚙ Setup & Verification

## 🔍 Step 1 – Verify Bash Installation

Confirmed installed Bash version:

Requirement: Bash environment  
Installed: GNU Bash 4.2.46  

This satisfies the requirement for function and alias support.

---

## 🔍 Step 2 – Verify Podman Installation

Confirmed container engine availability:

Installed Version: Podman 4.6.1  

This ensures container management commands can be automated via aliases and functions.

---

# 🧩 Task 1 – Creating Simple Aliases

## 🔹 1.1 Understanding Aliases

Aliases are shortcuts that:

- Reduce repetitive typing
- Add default options to commands
- Improve command-line efficiency
- Standardize commonly used flags

---

## 🔹 1.2 Creating Temporary Aliases

Created temporary aliases for:

- Detailed directory listing
- Formatted container display

Alias examples:

```
alias ll='ls -alF'
alias pps='podman ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"'
```

Tested both successfully.

---

## 🔹 1.3 Making Aliases Persistent

Modified `~/.bashrc` to add:

```
alias update='sudo dnf update -y'
alias c='clear'
```

Reloaded configuration using:

```
source ~/.bashrc
```

Verified functionality.

---

# 🧩 Task 2 – Creating Shell Functions

## 🔹 2.1 Basic Function Structure

Created `pcount` function to:

- List all containers
- Count total containers
- Display formatted result

This demonstrates grouped command automation.

---

## 🔹 2.2 Function with Parameters

Created `cstate` function to:

- Start containers
- Stop containers
- Validate input parameters
- Display usage instructions if invalid

This demonstrates conditional logic and parameter handling in Bash functions.

---

## 🔹 2.3 Persistent Functions

Added persistent cleanup function (`pclean`) to `.bashrc`:

- Prunes unused containers
- Removes unused images
- Frees disk space

Reloaded configuration and tested successfully.

---

# 🧩 Task 3 – Using Aliases in Scripts

## 🔹 3.1 Script with Aliases

Created `manage_system.sh` to:

- Enable alias expansion in scripts
- Source `.bashrc`
- Run system update alias
- Display formatted container list

Demonstrated script-level alias usage.

---

## 🔹 3.2 Advanced Script with Functions

Created `container_report.sh` to:

- Generate structured container report
- Display disk usage statistics
- Call function logic internally

This demonstrates modular automation design.

---

# 📊 Result

After completing this lab:

- 4 aliases created (ll, pps, update, c)
- 3 functions created (pcount, cstate, pclean)
- 2 automation scripts developed
- Integrated alias expansion inside scripts
- Implemented container management automation

---

# 🌍 Why This Matters

Aliases and functions are critical for:

- System administration efficiency
- DevOps workflows
- Container orchestration
- Automation scripting
- Operational consistency

They reduce errors and standardize repetitive tasks.

---

# 💼 Real-World Applications

- Automating container lifecycle management
- Standardizing update procedures
- Improving CLI productivity
- Creating reusable administrative utilities
- Simplifying large-scale system management

---

# 🔎 Verification Checklist

✔ Created 3+ temporary and persistent aliases  
✔ Built parameterized functions  
✔ Persisted functions in `.bashrc`  
✔ Used aliases inside scripts  
✔ Automated container management tasks  

---

# 🎓 Conclusion

In this lab, I successfully:

✔ Implemented temporary and persistent aliases  
✔ Developed reusable shell functions  
✔ Used parameters within functions  
✔ Integrated aliases/functions into automation scripts  
✔ Applied automation concepts to real container workloads  

This lab strengthened practical Bash scripting and command-line automation skills in a containerized Linux environment.

---
