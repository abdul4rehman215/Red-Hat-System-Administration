# 🧪 Lab 26: Environment and Shell Variables 

## 🎯 Objective

This lab focuses on understanding and implementing **environment variables and shell variables** in Linux.

Key learning outcomes:

- Distinguish between environment and shell variables
- View and modify environment variables
- Create temporary and persistent variables
- Implement variables in shell scripts
- Understand variable scope (global vs local)
- Build configuration-driven automation scripts

This lab builds foundational skills for automation, DevOps, scripting, and system administration.

---

## 📌 Prerequisites

- Bash shell (version 4.x or newer)
- Basic command-line knowledge
- Text editor (nano)
- Standard user privileges

---

**Environment:** Ubuntu 24.04.1 LTS – Cloud Lab Environment  
**User:** toor  
**Bash Version:** 5.2 

---

## 🗂 Repository Structure

```
lab26-environment-and-shell-variables/
│
├── README.md
├── commands.sh
├── scripts/
│   ├── variables.sh
│   ├── scope_demo.sh
│   ├── config.cfg
│   ├── app.sh
│   └── system_report.sh
├── output.txt
├── interview_qna.md
└── troubleshooting.md
```

---

# 🧩 Lab Tasks Overview

---

## 🔹 Task 1: Working with Environment Variables

### ✔ Viewing Environment Variables

Commands used:

```bash
printenv
echo $HOME
echo $PATH
```

Key Understanding:
- Environment variables are inherited by child processes.
- Common examples: `HOME`, `PATH`, `USER`, `SHELL`.

---

### ✔ Setting Temporary Environment Variables

```bash
export LAB_USER="dev_user"
```

- Exists only for current session.
- Removed after logout.

---

### ✔ Making Variables Persistent

Added to `~/.bashrc`:

```bash
export PROJECT_DIR="/opt/my_project"
```

Reloaded using:

```bash
source ~/.bashrc
```

Now persists across new terminal sessions.

---

## 🔹 Task 2: Shell Variables in Scripts

### ✔ Basic Variable Usage

Script example:

```bash
greeting="Welcome"
user=$(whoami)
echo "$greeting $user! Today is $(date)"
```

Concepts:
- Variable assignment
- Command substitution
- Proper quoting

---

### ✔ Variable Scope Demonstration

Used `local` keyword inside function:

- `global_var` → Accessible everywhere
- `local_var` → Accessible only inside function

Important for writing modular scripts.

---

## 🔹 Task 3: Automation with Variables

### ✔ Configuration File Driven Script

Created:

- `config.cfg`
- `app.sh`

Used:

```bash
source config.cfg
```

This allows dynamic configuration without modifying script logic.

---

### ✔ System Report Automation

Used command substitution:

```bash
current_users=$(who | wc -l)
disk_usage=$(df -h / | awk 'NR==2 {print $5}')
```

Generated dynamic system report.

---

# 🧠 Key Concepts Learned

| Concept | Description |
|----------|-------------|
| Environment Variable | Inherited by child processes |
| Shell Variable | Exists only in current shell |
| export | Makes variable available to child processes |
| source | Loads variables from file |
| local | Restricts variable scope to function |
| Command Substitution | Embeds command output inside variable |

---

# 💡 Real-World Relevance

Understanding variables is essential for:

- DevOps automation
- CI/CD pipelines
- Configuration management
- Infrastructure scripting
- Cloud-native deployments
- OpenShift / Kubernetes environments
- Secure environment handling

Variables form the backbone of automation systems.

---

# 📊 Result

✔ Distinguished environment vs shell variables  
✔ Created session and persistent variables  
✔ Built automation scripts using variables  
✔ Implemented configuration-based scripting  
✔ Demonstrated variable scope control  

---

# 🏁 Conclusion

This lab strengthened foundational Bash scripting skills by mastering environment and shell variables. These concepts are essential for scalable automation and production-ready scripting practices.

---
